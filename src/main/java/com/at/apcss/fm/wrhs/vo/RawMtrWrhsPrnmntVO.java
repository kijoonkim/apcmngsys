package com.at.apcss.fm.wrhs.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class RawMtrWrhsPrnmntVO extends ComVO {

    /**
     * APC코드
     */
    private String apcCd;
    private String apcNm;

    /**
     * 생산자코드
     */
    private String prdcrCd;
    private String prdcrNm;

    /**
     * 원물입고예정번호
     */
    private String prnmntno;

    /**
     * 예정일자
     */
    private String prnmntYmd;
    private String prnmntYmdFrom;
    private String prnmntYmdTo;
    private String wrhsPrnmntYmdFrom;
    private String wrhsPrnmntYmdTo;

    /**
     * 예정시간
     */
    private String prnmntHr;

    /**
     * 품목코드
     */
    private String itemCd;

    /**
     * 품종코드
     */
    private String vrtyCd;

    /**
     * 품목명
     */
    private String itemNm;

    /**
     * 품종명
     */
    private String vrtyNm;

    /**
     * 예정수량
     */
    private int prnmntQntt;

    /**
     * 예정중량
     */
    private double prnmntWght;

    /**
     * 비고
     */
    private String rmrk;

    /**
     * 삭제유무
     */
    private String delYn;
}
