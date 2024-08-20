package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltPrcsPrfmncVO extends ComVO{

	private String trgtYr;
	//private String apcCd;
	//private String apcNm;
	private int sn;
	private String fcltPrcsSeCd;
	private String fcltPrcsTrmtCd;
	private String fcltPrcsTrmtAmt;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;
	private String fcltPrcsTrmtAmt2;
	private String fcltPrcsTrmtAmt3;
	private String fcltPrcsTrmtAmt4;

	//테이블 변경으로 추가
	private String prgrsYn;//진척도 갱신 여부
	private String tmprStrgYn;//임시저장 여부
	private String crtrYr;
	private String apcCd;
	private String apcNm;

	private String apcTrmtAmt;
	private String apcTrmtVlm;

	private String apcGnrlTrmtAmt;
	private String apcOgnzCprtnSortTrst;
	private String apcCtrtEmspap;

	private String tmSpmtAmt;
	private String tmSpmtRt;


}




