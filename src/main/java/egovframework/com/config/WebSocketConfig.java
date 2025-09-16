package egovframework.com.config;

import egovframework.com.cmm.websoket.CustomWebSocketHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
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

    // JEUS 전용 클래스명 (존재하면 그걸로 핸드셰이크)
    private static final String JEUS_HANDSHAKE_HANDLER = "jeus.spring.websocket.JeusHandshakeHandler";
    private static final String JEUS_UPGRADE_STRATEGY  = "jeus.spring.websocket.JeusRequestUpgradeStrategy";

    @Value("${websocket.endpoint:/chat/ws}")
    private String endpoint;

    // 쉼표로 여러 개 가능: "https://a.com,https://b.com,*"
    @Value("${websocket.allowed-origin-patterns:*}")
    private String allowedOriginPatterns;

    private final HandshakeHandler handshakeHandler;

    public WebSocketConfig(ObjectProvider<HandshakeHandler> hhProvider,
                           ApplicationContext ctx) {
        // 0) XML 등으로 이미 HandshakeHandler 빈이 등록돼 있으면 그걸 우선 사용
        HandshakeHandler existing = hhProvider.getIfAvailable();
        if (existing != null) {
            log.info("[WS] Using existing HandshakeHandler bean: {}", existing.getClass().getName());
            this.handshakeHandler = existing;
            return;
        }

        // 1) JEUS HandshakeHandler 직접 로드 시도
        HandshakeHandler jeusHH = tryJeusHandshakeHandler();
        if (jeusHH != null) {
            this.handshakeHandler = jeusHH;
            return;
        }

        // 2) JEUS RequestUpgradeStrategy 로드 시도
        HandshakeHandler jeusByStrategy = tryJeusUpgradeStrategy();
        if (jeusByStrategy != null) {
            this.handshakeHandler = jeusByStrategy;
            return;
        }

        // 3) 기본(Tomcat 등)
        log.info("[WS] Using default HandshakeHandler (Tomcat, etc.)");
        this.handshakeHandler = new DefaultHandshakeHandler();
    }

    @Bean
    public WebSocketHandler chatHandler() {
        return new CustomWebSocketHandler();
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        String[] patterns = StringUtils.tokenizeToStringArray(allowedOriginPatterns, ", \t\r\n");

        registry.addHandler(chatHandler(), endpoint)
                .setHandshakeHandler(handshakeHandler)
                .setAllowedOriginPatterns(patterns);
        // 필요 시 .withSockJS();
        log.info("[WS] Registered endpoint '{}' with {} and allowedOriginPatterns={}",
                endpoint, handshakeHandler.getClass().getSimpleName(), String.join(",", patterns));
    }

    private HandshakeHandler tryJeusHandshakeHandler() {
        try {
            if (ClassUtils.isPresent(JEUS_HANDSHAKE_HANDLER, getClass().getClassLoader())) {
                Class<?> c = Class.forName(JEUS_HANDSHAKE_HANDLER);
                HandshakeHandler h = (HandshakeHandler) c.getDeclaredConstructor().newInstance();
                log.info("[WS] Using JEUS HandshakeHandler: {}", c.getName());
                return h;
            }
        } catch (Throwable ignore) { /* 다음 폴백 */ }
        return null;
    }

    private HandshakeHandler tryJeusUpgradeStrategy() {
        try {
            if (ClassUtils.isPresent(JEUS_UPGRADE_STRATEGY, getClass().getClassLoader())) {
                Class<?> c = Class.forName(JEUS_UPGRADE_STRATEGY);
                RequestUpgradeStrategy strat = (RequestUpgradeStrategy) c.getDeclaredConstructor().newInstance();
                log.info("[WS] Using JEUS RequestUpgradeStrategy: {}", c.getName());
                return new DefaultHandshakeHandler(strat);
            }
        } catch (Throwable ignore) { /* 다음 폴백 */ }
        return null;
    }
}
