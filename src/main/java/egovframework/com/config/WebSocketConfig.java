package egovframework.com.config;

import egovframework.com.cmm.websoket.CustomHandshakeInterceptor;
import egovframework.com.cmm.websoket.CustomWebSocketHandler;

import jeus.spring.websocket.JeusRequestUpgradeStrategy; // 컴파일은 필요
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

    @Bean
    public WebSocketHandler customWebSocketHandler() {
        return new CustomWebSocketHandler();
    }

    @Bean
    public HandshakeHandler handshakeHandler() {
        // JEUS 여부 판단: jeus.home 또는 커스텀 벤더 플래그
        boolean isJeus =
                System.getProperty("jeus.home") != null ||
                        "jeus".equalsIgnoreCase(System.getProperty("custoum.server.vender"));

        if (isJeus) {
            // JEUS에서는 명시적으로 JEUS 전략을 사용 (DefaultHandshakeHandler 자동감지 못함)
            return new DefaultHandshakeHandler(new JeusRequestUpgradeStrategy());
        }

        // Tomcat 등 일반 서블릿 컨테이너에서는 기본 핸들러가 자동으로 적절한 전략을 선택
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