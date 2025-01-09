package com.at.apcss.mobile.service.impl;

import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.mobile.service.FcmService;
import com.at.apcss.mobile.vo.FcmResponseVO;
import com.at.apcss.mobile.vo.FcmSendVO;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.messaging.*;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@Service("fcmService")
public class FcmServiceImpl extends BaseServiceImpl implements FcmService{
    @Autowired
    private WebClient gatewayWebClient;

    @Override
    public boolean subscribeTopic(FcmSendVO fcmSendVO) throws FirebaseMessagingException {
        /*
        TopicManagementResponse response = FirebaseMessaging.getInstance().subscribeToTopic(
                Arrays.asList(fcmSendVO.getToken()), fcmSendVO.getTopic());
        System.out.println(response.getSuccessCount() + " tokens were subscribed successfully");
        return response.getSuccessCount();
         */
        //웹서버를 우회하여 FCM호출 변경. 2024.07.22 by joon
        JSONObject json = new JSONObject();
        json.put("topic", fcmSendVO.getTopic());
        json.put("token", fcmSendVO.getToken());

        FcmResponseVO res = gatewayWebClient.post()
                .uri("/subscribe")
                .contentType(MediaType.APPLICATION_JSON)
                .bodyValue(json)
                .retrieve()
                .bodyToMono(FcmResponseVO.class)
                .block();

        return res.isSuccess();
    }

    @Override
    public boolean sendTopicMessage(FcmSendVO fcmSendVO) throws FirebaseMessagingException {
        /*
        List<Message> messages = Arrays.asList(
                Message.builder()
                        //.setToken(fcmSendVO.getToken())
                        .setNotification(Notification.builder()
                                .setTitle(fcmSendVO.getTitle())
                                .setBody(fcmSendVO.getBody())
                                .build())
                        .setTopic("notice")
                        .build()
        );

        BatchResponse response = FirebaseMessaging.getInstance().sendAll(messages);
        System.out.println(response.getSuccessCount() + " messages were sent successfully");
        return response.getSuccessCount();
         */
        //웹서버를 우회하여 FCM호출 변경. 2024.07.22 by joon
        JSONObject json = new JSONObject();
        json.put("topic", fcmSendVO.getTopic());
        json.put("title", fcmSendVO.getTitle());
        json.put("body", fcmSendVO.getBody());

        FcmResponseVO res = gatewayWebClient.post()
                .uri("/send")
                .contentType(MediaType.APPLICATION_JSON)
                .bodyValue(json)
                .retrieve()
                .bodyToMono(FcmResponseVO.class)
                .block();

        return res.isSuccess();
    }

    @Override
    public boolean sendMessageTo(FcmSendVO fcmSendVO) throws FirebaseMessagingException {
        /*
        List<Message> messages = Arrays.asList(
                Message.builder()
                        .setToken(fcmSendVO.getToken())
                        .setNotification(Notification.builder()
                                .setTitle(fcmSendVO.getTitle())
                                .setBody(fcmSendVO.getBody())
                                .build())
                        .build()
        );

        BatchResponse response = FirebaseMessaging.getInstance().sendAll(messages);
         */
        //웹서버를 우회하여 FCM호출 변경. 2024.07.22 by joon
        JSONObject json = new JSONObject();
        json.put("token", fcmSendVO.getToken());
        json.put("title", fcmSendVO.getTitle());
        json.put("body", fcmSendVO.getBody());

        FcmResponseVO res = gatewayWebClient.post()
                .uri("/send")
                .contentType(MediaType.APPLICATION_JSON)
                .bodyValue(json)
                .retrieve()
                .bodyToMono(FcmResponseVO.class)
                .block();

        return res.isSuccess();
    }

    /**
     * Firebase Admin SDK의 비공개 키를 참조하여 Bearer 토큰을 발급 받습니다.
     *
     * @return Bearer token
     */
    private String getAccessToken() throws IOException {
        String firebaseConfigPath = "firebase/apcss-e27c1-firebase-adminsdk-lozm8-64d60dbb91.json";

        GoogleCredentials googleCredentials = GoogleCredentials
                .fromStream(new ClassPathResource(firebaseConfigPath).getInputStream())
                .createScoped(List.of("<https://www.googleapis.com/auth/cloud-platform>"));

        googleCredentials.refreshIfExpired();
        return googleCredentials.getAccessToken().getTokenValue();
    }

}
