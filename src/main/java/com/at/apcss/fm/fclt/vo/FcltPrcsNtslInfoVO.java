package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltPrcsNtslInfoVO extends ComVO{


	private String trgtYr;
	//private String apcCd;
	//private String apcNm;
	//private int sn;
	private String fcltStrCd;

	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;

	private String fcltNtslCd;
	private String fcltNtslCd2;
	private String fcltNtslCd3;
	private String fcltNtslCd4;
	private String fcltNtslCd5;
	private String fcltNtslCd6;
	private String fcltNtslCd7;
	private String fcltNtslCd8;
	private String fcltNtslCd9;

	/* 테이블 변경으로 추가 */
	private String prgrsYn;//진척도 갱신 여부
	private String tmprStrgYn;//임시저장 여부
	private String crtrYr;
	private String apcCd;
	private String apcNm;
	private int sn;
	private String apcNtslAmtLgszRtl;
	private String apcNtslAmtFoodMtrl;
	private String apcNtslAmtWhlslMrkt;
	private String apcNtslAmtBzenty;
	private String apcNtslAmtExprt;
	private String apcNtslAmtHmsp;
	private String apcNtslAmtOnlnB2b;
	private String apcNtslAmtOnlnB2c;
	private String apcNtslAmtEtc;
	private String apcNtslAmtOnlnWhlslMrkt;


	private String apcTrmtAmt1;
	private String apcTrmtAmt2;
	private String apcTrmtAmt3;
	private String apcTrmtAmt4;
	private String apcTrmtAmTot;

	private String rtlOgnzTotTrmtAmt1;
	private String rtlOgnzTotTrmtAmt2;
	private String rtlOgnzTotTrmtAmt3;
	private String rtlOgnzTotTrmtAmt4;
	private String rtlOgnzTotTrmtAmtTot;

}



