package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltSortMchnInfoVO extends ComVO{

	private String trgtYr;
	//private String apcCd;
	//private String apcNm;

	//private int sn;
	private String sortMchnItemCd;
	private String sortMchnPrcsSeCd;
	private String sortMchnPrcsHr;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;
	private String sortMchnHldYn1;
	private String sortMchnHldYn2;
	private String sortMchnHldYn3;
	private String sortMchnHldYn4;
	private String prcCap1;
	private String prcCap2;
	private String prcCap3;
	private String prcCap4;
	private String prcVol1;
	private String prcVol2;
	private String prcVol3;
	private String prcVol4;
	private String annOperTime1;
	private String annOperTime2;
	private String annOperTime3;
	private String annOperTime4;
	private String avgOperDay1;
	private String avgOperDay2;
	private String avgOperDay3;
	private String avgOperDay4;

	/* 테이블 변경으로 추가 */
	private String prgrsYn;//진척도 갱신 여부
	private String tmprStrgYn;//임시저장 여부
	private String crtrYr;
	private String apcCd;
	private String apcNm;

	private String itemCd;
	private String itemNm;

	private String sortItemCd;
	private String sortItemNm;
	private String sortPrcsAblt;
	private String sortPrcsPrfmnc;
	private String sortOprtngHr;
	private String sortAvgOprtngDcnt;
	private String sortMchnHoldYn;
	private String sn;

	private String userId;
	private String userType;

	private String ctpvCd;
	private String ctpvNm;
	private String sigunCd;
	private String sigunNm;

}







