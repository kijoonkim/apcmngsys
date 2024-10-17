package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltInstlInfoVO extends ComVO{


	private String trgtYr;
	//private String apcCd;
	//private String apcNm;
	//private int sn;

	//private String bizYr;
	//private String bizCn;

	private String bizSprtCd;
	private String bizAmtCd;
	private String bizAmt;
	private String bizAmtCd2;
	private String bizAmt2;
	private String bizAmtCd3;
	private String bizAmt3;
	private String bizAmt4;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;

	/* 테이블 변경으로 인한 변경 */
	private String prgrsYn;//진척도 갱신 여부
	private String tmprStrgYn;//임시저장 여부
	private String crtrYr;
	private String sn;
	private String bizYr;
	private String apcCd;
	private String apcNm;
	private String sprtBiz;
	private String sprtBizNm;
	private String bizCn;
	private String bizNm;//사업명
	private String bizCd;//사업코드
	private String ne;
	private String lcltExpnd;
	private String slfBrdn;
	private String lcltExpndCtpv;
	private String lcltExpndSgg;

	private String userId;
	private String userType;

	private String ctpvCd;
	private String ctpvNm;
	private String sigunCd;
	private String sigunNm;
}

