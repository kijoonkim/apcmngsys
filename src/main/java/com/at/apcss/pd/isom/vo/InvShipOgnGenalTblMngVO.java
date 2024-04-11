package com.at.apcss.pd.isom.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InvShipOgnGenalTblMngVO extends ComVO{
	private String yr;
	private String apoCd;
	private String uoCd;
	private String apoSe;
	private String brno;
	private String uoBrno;
	private String crno;
	private String corpNm;
	private String uoCorpNm;
	private String ctpv;
	private String sgg;
	private String cmptnInst;
	private String corpSeCd;
	private String corpDtlSeCd;

	private String itemNm;
	private String itemCd;

	private String sttgUpbrItemSe;
	private String sttgUpbrItemNm;
	private String aprv;
	private String aprvNm;

	private String ctgryCd;
	private String ctgryNm;

	private String uoSpmtAmt;
	private String uoSpmtAmtOther;
	private String uoOtherSpmtAmt;
	private String uoOtherSpmtAmtOther;

	private String uoSpmtAmtRt;
	private String uoSpmtAmtTotRt;
	private String uoSpmtAmtTot;

	private String chkAA;//승인형 기준1
	private String chkAB;//승인형 기준2
	private String chkAC;//승인형 기준3
	private String chkBA;//육성형 기준1
	private String chkBB;//육성형 기준2
	private String chkBC;//육성형 기준3

	private String stbltYn;
	private String orgStbltYn;
	private String lastStbltYn;//최종 선정여부

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;


	private String corpNm2;

}
