// 패키지는 네 실제 경로로 맞춰줘 (websoket 오타 주의)
package egovframework.com.cmm.websoket;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class CustomHandshakeInterceptor implements HandshakeInterceptor {

    @Override
    public boolean beforeHandshake(
            ServerHttpRequest request, org.springframework.http.server.ServerHttpResponse response,
            WebSocketHandler wsHandler, Map<String, Object> attributes) {

        if (request instanceof ServletServerHttpRequest) {
            HttpServletRequest req = ((ServletServerHttpRequest) request).getServletRequest();

            // 쿼리스트링/헤더에서 roomId/userId 추출 (필요에 맞게 수정)
            String roomId = nvl(req.getParameter("roomId"), req.getHeader("X-Room-Id"));
            String userId = nvl(req.getParameter("userId"), req.getHeader("X-User-Id"));

            if (roomId != null) attributes.put("roomId", roomId);
            if (userId != null) attributes.put("userId", userId);
        }
        return true; // false로 하면 핸드셰이크 거절
    }

    @Override
    public void afterHandshake(
            ServerHttpRequest request, org.springframework.http.server.ServerHttpResponse response,
            WebSocketHandler wsHandler, Exception exception) { }

    private String nvl(String a, String b) { return a != null && !a.isEmpty() ? a : (b != null && !b.isEmpty() ? b : null); }
}
