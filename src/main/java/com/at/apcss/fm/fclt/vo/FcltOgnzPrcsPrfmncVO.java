package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltOgnzPrcsPrfmncVO extends ComVO{

	private String trgtYr;
	//private String apcCd;
	//private String apcNm;
	private int sn;
	private String fcltOgnzClsfCd;     //시설 처리 분류 코드
	private String fcltOgnzTrmtCd;  //시설 처리 취급 코드

	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;

	private String fcltOgnzTrmtAmt;   //시설 처리 취급금액
	private String fcltOgnzTrmt2Amt;
	private String fcltOgnzTrmt3Amt;
	private String fcltOgnzTrmt4Amt;

	/* 테이블 변경으로 추가 */
	private String prgrsYn;//진척도 갱신 여부
	private String tmprStrgYn;//임시저장 여부
	private String crtrYr;
	private String apcCd;
	private String apcNm;
	private String rtlOgnzTotTrmtAmt;
	private String rtlOgnzGnrlSum;
	private String rtlOgnzGnrlSmplTrst;
	private String rtlOgnzGnrlSmplEmspap;
	private String rtlOgnzOGnzSum;
	private String rtlOgnzOgnzCprtnSortTrst;
	private String rtlOgnzOgnzCtrtEmspap;
	private String rtlOgnzTotTrmtVlm;


}


