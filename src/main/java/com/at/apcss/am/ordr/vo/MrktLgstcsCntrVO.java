package com.at.apcss.am.ordr.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MrktLgstcsCntrVO extends ComVO {
    /**
     * APC코드
     */
    private String apcCd;

    /**
     * 대형시장코드
     */
    private String lgszMrktCd;

    /**
     * 센터코드
     */
    private String cntrCd;

    /**
     * 센터명
     */
    private String cntrNm;

    /**
     * 거래처코드
     */
    private String cnptCd;

    /**
     * 표시순서
     */
    private int indctSeq;

    /**
     * 사용여부
     */
    private String useYn;
}
