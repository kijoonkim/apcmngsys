package egovframework.com.cmm.websoket;

import javax.servlet.http.HttpServletRequest;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;
import java.util.Optional;

import java.util.Map;

public class CustomHandshakeInterceptor implements  HandshakeInterceptor {

    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response,
                                   WebSocketHandler wsHandler, Map<String, Object> attributes) {
        var uri = request.getURI();
        var params = org.springframework.web.util.UriComponentsBuilder.fromUri(uri)
                .build().getQueryParams();
        String code   = Optional.ofNullable(params.getFirst("code")).map(String::trim).orElse(null);
        String userId = Optional.ofNullable(params.getFirst("userId")).map(String::trim).orElse(null);

        attributes.put("roomId", code);
        attributes.put("userId", userId);
        return true;
    }

    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response,
                               WebSocketHandler wsHandler, Exception exception) {
    }
}
