package egovframework.com.cmm.websoket;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

public class CustomWebSocketHandler extends TextWebSocketHandler {

    // roomId -> (userId -> session)
    private final Map<String, ConcurrentMap<String, WebSocketSession>> roomMap = new ConcurrentHashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) {
        String roomId = (String) session.getAttributes().get("roomId");
        String userId = (String) session.getAttributes().get("userId");

        // 만약 userId가 handshake로 안 왔다면, 첫 메시지(register)에서 세팅할 수도 있음
        if (roomId != null && userId != null) {
            roomMap.computeIfAbsent(roomId, k -> new ConcurrentHashMap<>())
                    .put(userId, session);
            broadcast(roomId, json("worker.online", "userId", userId, "code", roomId));
        }
        System.out.println("[WS] connected " + session.getId()
                + " roomId=" + session.getAttributes().get("roomId")
                + " userId=" + session.getAttributes().get("userId"));
    }

    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        var text = message.getPayload();
        var node = new com.fasterxml.jackson.databind.ObjectMapper().readTree(text);
        String type = node.path("type").asText();

        // 1) register: handshake에서 못 받은 userId/roomId를 첫 메시지로 받는 경우
        if ("register".equals(type)) {
            String roomId = node.path("roomId").asText(null);
            String userId = node.path("userId").asText(null);
            if (roomId == null || userId == null) return;

            session.getAttributes().put("roomId", roomId);
            session.getAttributes().put("userId", userId);

            roomMap.computeIfAbsent(roomId, k -> new ConcurrentHashMap<>())
                    .put(userId, session);

            broadcast(roomId, json("worker.online", "userId", userId));
            return;
        }

        // 2) 일반 브로드캐스트 (자기 자신 제외)
        String roomId = (String) session.getAttributes().get("roomId");
        String userId = (String) session.getAttributes().get("userId");
        if (roomId == null || userId == null) {
            // 등록이 안 된 세션이면 무시하거나 에러 응답
            return;
        }

        var peers = roomMap.getOrDefault(roomId, new ConcurrentHashMap<>());
        for (Map.Entry<String, WebSocketSession> e : peers.entrySet()) {
            WebSocketSession s = e.getValue();
            if (s != session && s.isOpen()) {
                s.sendMessage(message); // 보낸 놈 제외 브로드캐스트
            }
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
        String roomId = (String) session.getAttributes().get("roomId");
        String userId = (String) session.getAttributes().get("userId");
        if (roomId == null || userId == null) return;

        var members = roomMap.get(roomId);
        if (members != null) {
            members.remove(userId, session);
            if (members.isEmpty()) roomMap.remove(roomId, members);
        }
        broadcast(roomId, json("worker.offline", "userId", userId, "code", roomId));
    }

    private void broadcast(String roomId, String payload) {
        var members = roomMap.get(roomId);
        if (members == null) return;
        var msg = new TextMessage(payload);
        members.values().forEach(s -> { if (s.isOpen()) try { s.sendMessage(msg); } catch (Exception ignore) {} });
    }

    private String json(String type, Object... kv) {
        StringBuilder sb = new StringBuilder("{\"type\":\"").append(type).append("\"");
        for (int i=0;i<kv.length;i+=2) sb.append(",\"").append(kv[i]).append("\":\"").append(kv[i+1]).append("\"");
        return sb.append("}").toString();
    }
}
