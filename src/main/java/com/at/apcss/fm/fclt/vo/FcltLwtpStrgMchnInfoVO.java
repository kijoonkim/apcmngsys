package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltLwtpStrgMchnInfoVO extends ComVO{

	private String trgtYr;
	//private String apcCd;
	//private String apcNm;
	//private int sn;
	private String fcltCd;
	private String fcltHldYn;
	private String fcltPrcsCd;
	private String fcltPrcsHr;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;
	private String storCap;
	private String stStorPerfm;
	private String ltStorPerfm;
	private String storOpRate;

	/* 테이블 변경으로 추가 */
	private String crtrYr;
	private String prgrsYn;//진척도 갱신 여부
	private String tmprStrgYn;//임시저장 여부
	private String apcCd;
	private String apcNm;
	private String strgPlcItemCd;
	private String strgPlcItemNm;
	private String lwtpStrgPlcHldMthd;
	private String lwtpStrgPlcHldYn;

	private String strgPlcStrgAblt;
	private String strgPlcStrmStrgAblt;
	private String strgPlcLtrmStrgAblt;
	private String strgPlcOprtngRt;
	//저장고 운영기간
	//private String sn;
	//private String itemCd;
	//private String itemNm;
	private String mchnSeCd;
	private String operYn;
	private String operPeriodYn1;
	private String operPeriodYn2;
	private String operPeriodYn3;
	private String operPeriodYn4;
	private String operPeriodYn5;
	private String operPeriodYn6;
	private String operPeriodYn7;
	private String operPeriodYn8;
	private String operPeriodYn9;
	private String operPeriodYn10;
	private String operPeriodYn11;
	private String operPeriodYn12;

}





