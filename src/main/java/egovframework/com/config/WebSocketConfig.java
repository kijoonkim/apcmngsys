package egovframework.com.config;

import egovframework.com.cmm.websoket.CustomHandshakeInterceptor;
import egovframework.com.cmm.websoket.CustomWebSocketHandler;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.HandshakeHandler;
import org.springframework.web.socket.server.RequestUpgradeStrategy;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    @Bean
    public WebSocketHandler customWebSocketHandler() {
        return new CustomWebSocketHandler();
    }

    @Bean
    public HandshakeHandler handshakeHandler() {
        try {
            Class<?> clazz = Class.forName("jeus.spring.websocket.JeusRequestUpgradeStrategy");
            RequestUpgradeStrategy s =
                    (RequestUpgradeStrategy) clazz.getDeclaredConstructor().newInstance();
            return new DefaultHandshakeHandler(s);  // JEUS일 때
        } catch (Throwable ignore) {
            // 클래스가 없거나(로컬/톰캣) 만들어지지 않으면 기본 핸드셰이크로 폴백
            return new DefaultHandshakeHandler();
        }
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(customWebSocketHandler(), "/ws/chat")
                .setHandshakeHandler(handshakeHandler())
                .addInterceptors(new CustomHandshakeInterceptor())
                .setAllowedOrigins("*");
    }
}