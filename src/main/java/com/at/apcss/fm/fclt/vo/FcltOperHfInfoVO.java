package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltOperHfInfoVO extends ComVO{

	private String trgtYr;
	//private String apcCd;
	//private String apcNm;
	//private int sn;
	private String hireSeCd;
	private String ctznFrgnrSeCd;
	private String hireNope;
	private String hireNope2;
	private String hireNope3;
	private String hireNope4;
	private String hireNope0;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;


	/* 테이블 변경을 추가 */
	private String crtrYr;
	private String prgrsYn;//진척도 갱신 여부
	private String tmprStrgYn;//임시저장 여부
	private String apcCd;
	private String apcNm;
	private int sn;
	private String hireRgllbrCtzn;
	private String hireRgllbrFrgnr;
	private String hireTmprJobCtzn;
	private String hireTmprJobFrgnr;

	private String hireRgllbrOfc;
	private String hireRgllbrSpt;
	private String hireTmprWgTotSum;
	private String hireTmprAvgWg;
	private String hireTmprYrNop;

	private String hireTmprMin;
	private String hireTmprMax;
	private String hireFrgnrMin;
	private String hireFrgnrMax;
	private String hireFrgnrAvg;
	private String hireFrgnrTaskCn;
}




