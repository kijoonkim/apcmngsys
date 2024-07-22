package com.at.apcss.mobile.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class FcmResponseVO {
    private boolean success;
    private String message;
    private String data;
}
