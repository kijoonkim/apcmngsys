package com.at.apcss.co.ntc.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class ComMsgPopupVO extends ComVO {
    /**
     * 사용자 ID
     * **/
    private String userId;
    /**
     * 수신일시
     * **/
    private Date rcptnDt;
    /**
     * 수신순서
     * **/
    private int rcptnSeq;
    /**
     * 공지구분코드
     * **/
    private String ntcSeCd;
    /**
     * 공지메세지
     * **/
    private String ntcMsg;
    /**
     * 발신사용자 ID
     * **/
    private String dsptchUserId;
    /**
     * 접근메뉴 ID
     * **/
    private String acsMenuId;
    /**
     * 확인여부
     * **/
    private String idntyYn;
    /**
     * 확인일시
     * **/
    private String idntyDt;
}
