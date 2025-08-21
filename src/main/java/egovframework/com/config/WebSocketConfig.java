package egovframework.com.config;

import egovframework.com.cmm.websoket.CustomHandshakeInterceptor;
import egovframework.com.cmm.websoket.CustomWebSocketHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.RequestUpgradeStrategy;
import org.springframework.web.socket.server.standard.TomcatRequestUpgradeStrategy;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    @Bean
    public WebSocketHandler customWebSocketHandler() {
        return new CustomWebSocketHandler();
    }

    @Bean
    public CustomHandshakeInterceptor customHandshakeInterceptor() {
        return new CustomHandshakeInterceptor();
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(customWebSocketHandler(), "/ws/chat")
                .addInterceptors(customHandshakeInterceptor())
                .setAllowedOriginPatterns("*"); // Spring 5.0+에서는 setAllowedOriginPatterns를 사용
    }

    @Bean
    public RequestUpgradeStrategy requestUpgradeStrategy() {
        return new TomcatRequestUpgradeStrategy();
    }
}