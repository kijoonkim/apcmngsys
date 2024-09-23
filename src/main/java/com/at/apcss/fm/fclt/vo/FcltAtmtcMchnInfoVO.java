package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltAtmtcMchnInfoVO extends ComVO{

	private String trgtYr;
	//private String apcCd;
	//private String apcNm;
	//private int sn;
	private String fcltInstlCd;
	private String fcltHldYn;
	private String specs;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;
	private String fcltHldYn2;
	private String fcltHldYn3;
	private String fcltHldYn4;
	private String fcltHldYn5;
	private String fcltHldYn6;
	private String fcltHldYn7;
	private String fcltHldYn8;
	private String fcltHldYn9;
	private String fcltHldYn10;
	private String fcltHldYn11;
	private String otherFclt;

	/* 테이블 변경으로 추가 */
	private String crtrYr;
	private String prgrsYn;//진척도 갱신 여부
	private String tmprStrgYn;//임시저장 여부
	private String apcCd;
	private String apcNm;
	private String itemCd;
	private String itemNm;
	private String sn;

	private String rprsItemSpcfct;
	private String dptz;
	private String apm;
	private String elctrnWghtSortMchn;
	private String ndstBrckSortMchn;
	private String grdRawMtrAtmtcTrnsfMchn;
	private String emptBxAtmtcExhstMchn;
	private String atmtcBxPckgMchn;
	private String atmtcSsMchn;
	private String atmtcWrapMchn;
	private String atmtcWghtChckMchn;
	private String ptz;
	private String etcMnfcMchn;

	//20240820 추가
	private String spcfctCnt;
	private String spcfctGrp;
	private String spcfctGrd;
	private String wbg;
	private String wrhsBrQr;
	private String kskTblt;
	private String dshbrd;
	private String spmtBrQr;
	private String thAc;

	private String userId;
	private String userType;

}







