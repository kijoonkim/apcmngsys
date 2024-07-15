package com.at.apcss.mobile.service;

import com.at.apcss.mobile.vo.FcmSendVO;
import com.google.firebase.messaging.FirebaseMessagingException;
import org.springframework.stereotype.Service;

import java.io.IOException;

public interface FcmService {
    //FCM 토픽 등록
    int subscribeTopic(FcmSendVO fcmSendVO) throws FirebaseMessagingException;
    //FCM 토픽 메세지
    int sendTopicMessage(FcmSendVO fcmSendVO) throws FirebaseMessagingException;
}
