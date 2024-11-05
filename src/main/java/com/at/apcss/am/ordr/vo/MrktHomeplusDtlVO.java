package com.at.apcss.am.ordr.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MrktHomeplusDtlVO {
	
	private String rtnCd;
	private String rtnMsg;
	
	private String ordrApcCd;
	private String wrhsYmd;
	private long ordrSeq;
	private String outordrno;
	private int dtlSeq;
	private String mrktGdsCd;
	private String mrktGdsNm;
	private String mrktNtslCd;
	private String storCd;
	private String storNm;
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
	
}
