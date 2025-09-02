package egovframework.com.config;

import egovframework.com.cmm.websoket.CustomHandshakeInterceptor;
import egovframework.com.cmm.websoket.CustomWebSocketHandler;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.HandshakeHandler;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    @Value("${custom.server.vender:tomcat}")
    private String serverType;

    @Bean
    public WebSocketHandler customWebSocketHandler() {
        return new CustomWebSocketHandler();
    }

    @Bean
    public HandshakeHandler handshakeHandler() {
        if ("jeus".equalsIgnoreCase(serverType)) {
            try {
                Class<?> jeusHandshakeHandlerClass = Class.forName("jeus.spring.websocket.JeusHandshakeHandler");
                return (HandshakeHandler) jeusHandshakeHandlerClass.getDeclaredConstructor().newInstance();
            } catch (Throwable e) {
                throw new RuntimeException("JEUS 환경에 필요한 WebSocketHandler를 로드할 수 없습니다.", e);
            }
        }
        return new DefaultHandshakeHandler();
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(customWebSocketHandler(), "/ws/chat")
                .setHandshakeHandler(handshakeHandler())
                .addInterceptors(new CustomHandshakeInterceptor())
                .setAllowedOrigins("*");
    }
}