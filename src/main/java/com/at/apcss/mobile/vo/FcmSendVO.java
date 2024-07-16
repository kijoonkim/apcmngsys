package com.at.apcss.mobile.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class FcmSendVO {
    private String topic;
    private String token;
    private String title;
    private String body;

    @Builder(toBuilder = true)
    public FcmSendVO(String topic, String token, String title, String body) {
        this.topic = topic;
        this.token = token;
        this.title = title;
        this.body = body;
    }
}
