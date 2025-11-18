package com.at.apcss.am.ordr.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
public class MrktGdsOrdrVO  extends ComVO {

    private String ordrApcCd;
    private String lgszMrktCd;
    private String outordrno;
    private Integer ordrSeq;
    private String mrktWrhsType;
    private String mrktWrhsTypeNm;
    private String mrktGdsCd;
    private String mrktGdsNm;
    private String otptNm;
    private String cntrCd;
    private String cntrNm;
    private String wrhsYmd;
    private String outordrYmd;
    private String outordrTm;
    private Long outordrQntt;
    private Long cfmtnQntt;
    private Long wrhsQntt;
    private String prchsTypeCd;
    private String prchsTypeNm;
    private String exmptnYn;
    private String prdctnYr;
    private String mnftrYmd;
    private BigDecimal pieceUntprc;
    private BigDecimal outordrUntprc;
    private Long txamt;
    private Long outordrAmt;
    private Long wrhsAmt;


    private String wrhsYmdFrom;
    private String wrhsYmdTo;

    private String lgszMrktNm;
}
