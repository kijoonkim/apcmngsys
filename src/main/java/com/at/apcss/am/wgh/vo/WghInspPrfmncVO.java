package com.at.apcss.am.wgh.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WghInspPrfmncVO extends ComVO {
    /**
     * APC 코드
     */
    private String apcCd;

    /**
     * 입고번호
     */
    private String wghno;

    /**
     * 품목코드
     */
    private String itemCd;

    /**
     * 품목코드
     */
    private String vrtyCd;

    /**
     * 등급코드
     */
    private String grdCd;

    /**
     * 등급수치
     */
    private String grdVl;

}
