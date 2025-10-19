package egovframework.com.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Bean;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

import java.net.InetSocketAddress;
import java.net.PasswordAuthentication;
import java.net.Proxy;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Configuration
public class ProxyRestTemplateConfig {
    @Bean(name = "openApiRestTemplate")
    public RestTemplate openApiRestTemplate() {
        var f = new SimpleClientHttpRequestFactory();
        f.setConnectTimeout(10_000);
        f.setReadTimeout(15_000);
        var rt = new RestTemplate();
        rt.setRequestFactory(f);
        return rt;
    }
//    @Bean
//    public Proxy proxy(
//            @org.springframework.beans.factory.annotation.Value("${proxy.host}") String host,
//            @org.springframework.beans.factory.annotation.Value("${proxy.port}") int port,
//            @org.springframework.beans.factory.annotation.Value("${proxy.user:}") String user,
//            @org.springframework.beans.factory.annotation.Value("${proxy.pass:}") String pass
//    ) {
//        // 프록시 인증이 필요하면 전역 Authenticator 설정
//        if (user != null && !user.isEmpty()) {
//            java.net.Authenticator.setDefault(new java.net.Authenticator() {
//                @Override
//                protected PasswordAuthentication getPasswordAuthentication() {
//                    if (getRequestorType() == RequestorType.PROXY) {
//                        return new PasswordAuthentication(user, pass.toCharArray());
//                    }
//                    return null;
//                }
//            });
//        }
//        return new Proxy(Proxy.Type.HTTP, new InetSocketAddress(host, port));
//    }
}
