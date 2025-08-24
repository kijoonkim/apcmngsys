package egovframework.com.config;

import egovframework.com.cmm.websoket.CustomHandshakeInterceptor;
import egovframework.com.cmm.websoket.CustomWebSocketHandler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.HandshakeHandler;
import org.springframework.web.socket.server.RequestUpgradeStrategy;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;

/**
 * 톰캣/JEUS 모두에서 동작하는 단일 WebSocket 설정.
 * - JEUS 환경이면 jeus.spring.websocket.JeusRequestUpgradeStrategy를 리플렉션으로 로드
 * - 없으면(로컬 톰캣 등) 기본 HandshakeHandler 사용
 *
 * JVM 옵션 예)
 *  - JEUS    : -Dcustom.server.vendor=jeus
 *  - TOMCAT  : -Dcustom.server.vendor=tomcat   (미설정 시 기본 tomcat)
 *
 * 과거 오타 키도 함께 지원됨: -Dcustoum.server.vender
 */
@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    private static final Logger log = LoggerFactory.getLogger(WebSocketConfig.class);

    /**
     * 우선순위:
     *   custom.server.vendor  -> custoum.server.vender(오타 호환) -> "tomcat"
     */
    @Value("${custom.server.vendor:${custoum.server.vender:tomcat}}")
    private String serverVendor;

    @Bean
    public WebSocketHandler customWebSocketHandler() {
        return new CustomWebSocketHandler();
    }

    @Bean
    public HandshakeHandler handshakeHandler() {
        // JEUS일 가능성이 있으면 JEUS 업그레이드 전략을 시도
        if ("jeus".equalsIgnoreCase(serverVendor)) {
            try {
                Class<?> clazz = Class.forName("jeus.spring.websocket.JeusRequestUpgradeStrategy");
                RequestUpgradeStrategy strategy =
                        (RequestUpgradeStrategy) clazz.getDeclaredConstructor().newInstance();
                log.info("[WebSocket] Using JEUS RequestUpgradeStrategy");
                return new DefaultHandshakeHandler(strategy);
            } catch (Throwable e) {
                // JEUS 클래스가 없거나 로딩 실패 시 안전하게 기본 핸들러로 폴백
                log.warn("[WebSocket] JEUS strategy not found/failed. Fallback to default. cause={}", e.toString());
                return new DefaultHandshakeHandler();
            }
        }

        // 기본(톰캣 등)
        log.info("[WebSocket] Using default (Tomcat) HandshakeHandler");
        return new DefaultHandshakeHandler();
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(customWebSocketHandler(), "/ws/chat")
                .setHandshakeHandler(handshakeHandler())
                .addInterceptors(new CustomHandshakeInterceptor())
                .setAllowedOrigins("*"); // 필요 시 특정 도메인으로 제한
        // .withSockJS(); // SockJS 쓰면 주석 해제
    }
}