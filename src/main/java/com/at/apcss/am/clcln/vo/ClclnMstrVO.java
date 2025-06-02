package com.at.apcss.am.clcln.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

/**
 * 정산 마스터 정보 VO
 */
@Getter
@Setter
public class ClclnMstrVO extends ComVO{
    /**
     * APC 코드
     */
    private String apcCd;

    /**
     * 정산일자
     */
    private String clclnYmd;

    /**
     * 정산일련번호
     */
    private int clclnSn;

    /**
     * 생산자코드
     */
    private String prdcrCd;

    /**
     * 품목코드
     */
    private String itemCd;

    /**
     * 품종코드
     */
    private String vrtyCd;

    /**
     * 규격코드
     */
    private String spcfctCd;

    /**
     * 실제중량
     */
    private int actlWght;

    /**
     * 계산중량
     */
    private int calWght;

    /**
     * 차이중량
     */
    private int diffWght;


}
