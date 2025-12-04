package com.apcmngsys.apcss.am.ordr.vo;

import com.apcmngsys.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
public class MrktGdsOrdrVO extends ComVO {
    /**
     * 주문APC코드
     */
    private String ordrApcCd;

    /**
     * 대형시장코드
     */
    private String lgszMrktCd;

    /**
     * 발주번호
     */
    private String outordrno;

    /**
     * 주문순서
     */
    private int ordrSeq;

    /**
     * 시장입고유형
     */
    private String mrktWrhsType;

    /**
     * 시장입고유형명
     */
    private String mrktWrhsTypeNm;

    /**
     * 시장상품코드
     */
    private String mrktGdsCd;

    /**
     * 시장상품명
     */
    private String mrktGdsNm;

    /**
     * 출력명
     */
    private String otptNm;

    /**
     * 센터코드
     */
    private String cntrCd;

    /**
     * 센터명
     */
    private String cntrNm;

    /**
     * 입고일자
     */
    private String wrhsYmd;

    /**
     * 발주일자
     */
    private String outordrYmd;

    /**
     * 발주시각
     */
    private String outordrTm;

    /**
     * 발주수량
     */
    private Integer outordrQntt;

    /**
     * 확정수량
     */
    private Integer cfmtnQntt;

    /**
     * 입고수량
     */
    private Integer wrhsQntt;

    /**
     * 매입유형
     */
    private String prchsTypeCd;

    /**
     * 매입유형명
     */
    private String prchsTypeNm;

    /**
     * 면제여부
     */
    private String exmptnYn;

    /**
     * 생산연도
     */
    private String prdctnYr;

    /**
     * 제조일자
     */
    private String mnftrYmd;

    /**
     * 낱개당 단가
     */
    private BigDecimal pieceUntprc;

    /**
     * 발주단가
     */
    private BigDecimal outordrUntprc;

    /**
     * 세액
     */
    private int txamt;

    /**
     * 발주금액
     */
    private int outordrAmt;

    /**
     * 입고금액
     */
    private int wrhsAmt;

    /**
     * 저장실패 메세지
     */
    private String failMsg;

    private String wrhsYmdFrom;
    private String wrhsYmdTo;

    private String lgszMrktNm;

    private String ordrCrtDt;
    private String ordrChgDt;
    private String ordrPrcsCd;
    private String ordrPrcsDt;
    private String ordrPrcsMsg;
    private String sttsCdNm;
    private String mrktWrhsKnd;
    private String trsmYmd;
    private String trsmTm;
    private String rcptnYmd;
    private String rcptnTm;
    private String rcptnYn;
    private String ordrr;
    private String splrCd;
    private String splrNm;
    private String userId;
    private String bplcCd;
    private String coCd;
    private String coNm;
    private String ordrDsctn;
    private String prcsSeCd;
    private String linkDt;
    private String linkPrcsDt;
    private Integer dtlSeq;
    private String mrktNtslCd;
    private String storCd;
    private String storNm;
    private String upGrdItem;
    private Integer bxGdsQntt;
    private Integer ordrUnitQntt;
    private String outordrUnit;
    private Integer pieceQntt;
    private Integer zcstQntt;
    private String splyPrc;
    private String rtlTermYmd;
    private String etcRsn;
    private String addrseNm;
    private String addrseAddr;
    private String addrseTelno;
    private String drctDlvrYn;
    private String dlvrType;
    private String bndlNo;
    private String gdsExpln;
    private String rmrkCn;
    private String cntrWrhsYmd;
    private String storWrhsYmd;
    private String bxNo;
    private String bxSn;
    private String etcMttr;
    private String etcDtlCn;
    private String etcExpln;
    private String orgnlGdsCd;
    private String wrhusCd;
    private String wrhusNm;
}