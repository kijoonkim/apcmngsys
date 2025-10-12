package egovframework.com.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

@Component
@Profile("embedded")
public class WebSocketEndpointConfig {

    @Bean
    //웹 소켓 end point bean에 등록하기
    public ServerEndpointExporter serverEndpointExporter() {

        return new ServerEndpointExporter();
    }
}
