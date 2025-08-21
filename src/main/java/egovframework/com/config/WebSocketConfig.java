package egovframework.com.config;

import egovframework.com.cmm.websoket.CustomHandshakeInterceptor;
import egovframework.com.cmm.websoket.CustomWebSocketHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    @Bean
    public WebSocketHandler customWebSocketHandler() {
        return new CustomWebSocketHandler(); // 의존성 없으면 OK
    }

    @Bean
    public CustomHandshakeInterceptor customHandshakeInterceptor() {
        return new CustomHandshakeInterceptor();    // 빈으로 등록 권장 (로깅/설정 주입 용이)
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(customWebSocketHandler(), "/ws/chat")
                .addInterceptors(customHandshakeInterceptor())
                .setAllowedOrigins("*");     // ★ setAllowedOrigins("*") → setAllowedOriginPatterns("*")
        // .withSockJS();  // SockJS 쓰면 여기도 고려(필요 시)
    }
}