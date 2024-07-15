package com.at.apcss.mobile.service.impl;

import com.at.apcss.mobile.service.FcmService;
import com.at.apcss.mobile.vo.FcmSendVO;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.messaging.*;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@Service("fcmService")
public class FcmServiceImpl implements FcmService{
    @Override
    public int subscribeTopic(FcmSendVO fcmSendVO) throws FirebaseMessagingException {
        TopicManagementResponse response = FirebaseMessaging.getInstance().subscribeToTopic(
                Arrays.asList(fcmSendVO.getToken()), fcmSendVO.getTopic());
        System.out.println(response.getSuccessCount() + " tokens were subscribed successfully");
        return response.getSuccessCount();
    }

    @Override
    public int sendTopicMessage(FcmSendVO fcmSendVO) throws FirebaseMessagingException {
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
