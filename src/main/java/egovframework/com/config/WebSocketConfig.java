package egovframework.com.config;

import egovframework.com.cmm.websoket.CustomHandshakeInterceptor; // ← 네 실제 패키지
import egovframework.com.cmm.websoket.CustomWebSocketHandler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.ClassUtils;
import org.springframework.util.StringUtils;
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

    private static final Logger log = LoggerFactory.getLogger(WebSocketConfig.class);

    // JEUS 전용 클래스 이름(존재하면 사용)
    private static final String JEUS_HANDSHAKE_HANDLER = "jeus.spring.websocket.JeusHandshakeHandler";
    private static final String JEUS_UPGRADE_STRATEGY = "jeus.spring.websocket.JeusRequestUpgradeStrategy";

    @Value("${websocket.endpoint:/ws/chat}")
    private String endpoint;

    // 쉼표 구분: https://a.com,https://b.com,* 등
    @Value("${websocket.allowed-origin-patterns:*}")
    private String allowedOriginPatterns;

    @Bean
    public WebSocketHandler customWebSocketHandler() {
        return new CustomWebSocketHandler();
    }

    @Bean
    public CustomHandshakeInterceptor customHandshakeInterceptor() {
        return new CustomHandshakeInterceptor();
    }

    @Bean
    public HandshakeHandler handshakeHandler() {
        // 1) JEUS HandshakeHandler가 있으면 최우선 사용
        try {
            if (ClassUtils.isPresent(JEUS_HANDSHAKE_HANDLER, getClass().getClassLoader())) {
                Class<?> c = Class.forName(JEUS_HANDSHAKE_HANDLER);
                log.info("[WS] Using JEUS HandshakeHandler: {}", JEUS_HANDSHAKE_HANDLER);
                return (HandshakeHandler) c.getDeclaredConstructor().newInstance();
            }
        } catch (Throwable ignored) { /* 폴백 시도 */ }

        // 2) JEUS RequestUpgradeStrategy가 있으면 전략으로 구성
        try {
            if (ClassUtils.isPresent(JEUS_UPGRADE_STRATEGY, getClass().getClassLoader())) {
                Class<?> sc = Class.forName(JEUS_UPGRADE_STRATEGY);
                RequestUpgradeStrategy strat = (RequestUpgradeStrategy) sc.getDeclaredConstructor().newInstance();
                log.info("[WS] Using JEUS RequestUpgradeStrategy: {}", JEUS_UPGRADE_STRATEGY);
                return new DefaultHandshakeHandler(strat);
            }
        } catch (Throwable ignored) { /* 폴백 시도 */ }

        // 3) 기본(톰캣 등)
        log.info("[WS] Using default HandshakeHandler (Tomcat, etc.)");
        return new DefaultHandshakeHandler();
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        String[] patterns = StringUtils.tokenizeToStringArray(allowedOriginPatterns, ", \t\r\n");

        registry.addHandler(customWebSocketHandler(), endpoint)
                .setHandshakeHandler(handshakeHandler())
                .addInterceptors(customHandshakeInterceptor())
                .setAllowedOriginPatterns(patterns);
        // 필요하면 .withSockJS();
    }
}
