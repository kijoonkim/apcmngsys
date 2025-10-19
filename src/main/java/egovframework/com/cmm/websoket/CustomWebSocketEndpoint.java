package egovframework.com.cmm.websoket;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.*;

import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.server.ServerEndpointConfig;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@ServerEndpoint(value = "/ws/chat/{roomId}/{userId}")
public class CustomWebSocketEndpoint {
    public CustomWebSocketEndpoint(){};

    // roomId -> (userId -> Session)
    private static final Map<String, Map<String, Session>> roomMap = new ConcurrentHashMap<>();
    private static final ObjectMapper mapper = new ObjectMapper();

    @OnOpen
    public void onOpen(Session session,
                       @PathParam("roomId") String roomId,
                       @PathParam("userId") String userId) {
        session.getUserProperties().put("roomId", roomId);
        session.getUserProperties().put("userId", userId);
        roomMap.computeIfAbsent(roomId, k -> new ConcurrentHashMap<>()).put(userId, session);
        broadcast(roomId, json("worker.online", "userId", userId, "roomId", roomId),session);
        System.out.println("[WS] connected " + session.getId() + " room=" + roomId + " user=" + userId);
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        String roomId = (String) session.getUserProperties().get("roomId");
        String userId = (String) session.getUserProperties().get("userId");
        if (roomId == null || userId == null) return;

        broadcast(roomId, message, session);
    }

    @OnClose
    public void onClose(Session session, CloseReason reason) {
        String roomId = (String) session.getUserProperties().get("roomId");
        String userId = (String) session.getUserProperties().get("userId");
        if (roomId == null || userId == null) return;

        Map<String, Session> members = roomMap.get(roomId);
        if (members != null) {
            members.remove(userId, session);
            if (members.isEmpty()) roomMap.remove(roomId);
        }
        broadcast(roomId, json("worker.offline", "userId", userId, "roomId", roomId),session);
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.err.println("[WS] error in session " + session.getId() + ": " + throwable.getMessage());
    }

    private void broadcast(String roomId, String payload, Session exclude) {
        Map<String, Session> members = roomMap.get(roomId);
        if (members == null) return;

        for (Session s : members.values()) {
            if (s.isOpen() && (exclude == null || !s.equals(exclude))) {
                try {
                    s.getBasicRemote().sendText(payload);
                } catch (IOException ignore) {
                    // 필요 시 로깅
                }
            }
        }
    }

    private String json(String type, Object... kv) {
        StringBuilder sb = new StringBuilder("{\"type\":\"").append(type).append("\"");
        for (int i = 0; i < kv.length; i += 2) {
            sb.append(",\"").append(kv[i]).append("\":\"").append(kv[i + 1]).append("\"");
        }
        return sb.append("}").toString();
    }
}