package com.at.apcss.am.ordr.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MrktOrdrDtlVO extends ComVO {
	
	private String rtnCd;
	private String rtnMsg;

	private String apcCd;
	private String ordrApcCd;
	private String wrhsYmd;
	private String wrhsYmdFrom;
	private String wrhsYmdTo;

	private Integer ordrSeq;
	private String outordrno;
	private int dtlSeq;
	private String mrktGdsCd;
	private String mrktGdsNm;
	private String mrktNtslCd;
	private String storCd;
	private String storNm;
	private String storTxt;
	private String mrktWrhsType;
	private String mrktWrhsTypeNm;
	private String upGrdItem;
	private int bxGdsQntt;
	private int outordrQntt;
	private String outordrUnit;
	private int pieceQntt;
	private int zcstQntt;
	private double pieceUntprc;
	private long txamt;
	private long outordrAmt;
	private double outordrUntprc;
	private int wrhsQntt;
	
	private long totOutordrAmt;
	private String outordrYmd;
	private String mrktWrhsKnd;
	private String trsmYmd;
	private String trsmTm;
	private String rcptnYmd;
	private String rcptnTm;
	private String rcptnYn;
	private String ordrr;
	private String cntrCd;
	private String cntrNm;
	private String splrCd;
	private String splrNm;
	private String userId;
	private String bplcCd;
	private String coCd;
	private String coNm;
	private String vrWarehouseCd;
	private String vrWarehouseTxt;
	private String vrWarehouseNm;
	private String warehouseCd;
	private String warehouseTxt;
	private String warehouseNm;
	private String ordrDsctn;


	private String lgszMrktCd;
	private String rcptnSeCd;
	private String apcSeCd;
	private String ordrCrtDt;
	private String ordrChgDt;
	private String ordrPrcsCd;
	private String ordrPrcsDt;
	private String ordrPrcsMsg;
	private String receiptYn;
	private String lgszMrktNm;
	private String rcptnSeNm;

	private String apcOutordrno;
	private String gdsExpln;

	/** 20251126 롯데슈퍼 추가컬럼 **/
	private String cntrWrhsYmd;
	private String storWrhsYmd;
	private String dlvrType;
	private String bxNo;
	private int bxSn;
	private double volUnitWght;

	/** 20251127 신세계 추가컬럼 **/
	private String bndlNo;
	private int	ordrUnitQntt;
	private String gdsExplN;
	private String rmrkCn;
	private String etcMttr;
	private String etcDtlCn;
	private String etcExpln;
	private String strgPlcNm;
	private String orgnlGdsCd;
	private String wrhusCd;
	private String wrhusNm;

	/** 20251127 쿠팡 추가컬럼 **/
	private String otptNm;
	private int cfmtnQntt;
	private String mnftrYmd;
	private String prdctnYr;
	private int splyPrc;
	private String rtlTermYmd;
	private String etcRsn;
	private String addrseNm;
	private String addrseAddr;
	private String addrseTelno;
	private String drctDlvrYn;

}
