package com.at.apcss.am.sort.vo;

import com.at.apcss.co.cd.vo.ComCdVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SortBffaGrdVO extends ComCdVO {
    /**
     * APC 코드
     */
    private String apcCd;
    /**
     * 품목 코드
     */
    private String itemCd;
    /**
     * 사전등급유형
     */
    private String bffaGrdType;
    /**
     * 등급종류
     */
    private String grdKnd;
    /**
     * 등급종류명
     */
    private String grdKndNm;
    /**
     * 등급코드
     */
    private String grdCd;
    /**
     * 등급종류명
     */
    private String grdNm;
    /**
     * 등급값
     */
    private int grdVl;
    /**
     * 순번
     */
    private int sn;
    /**
     * 비고
     */
    private String rmrk;

}
