package com.at.apcss.pd.pcorm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrdcrCrclOgnVluIdctrMngVO extends ComVO{
	private String yr;
	private String apoCd;
	private String uoCd;
	private String apoSe;
	private String apoSeNm;
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

	private String trmtType;
	private String trmtTypeNm;

	private String prdcrOgnzNm;

	private String aprv;

	private String stbltYn;
	private String stbltYnNm;

	private String itemNm;
	private String itemCd;

	private String sttgUpbrItemSe;
	private String sttgUpbrItemNm;

	private String ctgryCd;
	private String ctgryNm;

	private String totTrmtPrfmnc;//통합조직총취급액(A)
	private String totSpmtPrfmnc;//생산자조직 전속출하액
	private String totTrmtRt;//전속취급률

	private String wrtYn;
	private String userType;
	private String prdcrOgnzSn;

	private String picFlnm;
	private String mngmstYn;

	private String lotnoAddr;
	private String lotnoDtlAddr;
	private String zip;
	private String roadNmAddr;
	private String roadNmDtlAddr;

	private String corpFndnDay;
	private String invstNope;
	private String invstExpndFrmerNope;
	private String invstAmt;

	private String frmerInvstAmt;
	private String prdcrGrpInvstAmt;
	private String locgovInvstAmt;
	private String etcInvstAmt;

	private String rgllbrNope;
	private String dwNope;
	private String dlbrrNope;

	private String untyYn;
	private String uoNm;
	private String untyYr;

	private String isoHldYn;
	private String yrChk;
	private String aplyDay;
	private String corpDdlnSeCd;
	private String rawMtrEnsr;//값 확인용
	private String rawMtrEnsrSigunCnt;
	private String rawMtrEnsrCtpvCnt;
	private String ctpvNm;
	private String sigunNm;
	private String pruoFundAplyAmt;
	private String isoFundAplyAmt;
	private String aplyTrgtSe;

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

	private String orgStbltYn;

	private String aprvNm;

	private String slsCnsgnSlsAmt;
	private String slsCnsgnSlsAmtTot;
	private String slsCnsgnSlsAmtRt;

	/*예외*/
	private String chkItemA; /*CTGRY_CD 2*/
	private String chkItemB; /*CTGRY_CD 3*/

	/* 총취급액 최저 금액 */
	private String chkAmtTotAA;
	private String chkAmtTotAB;
	private String chkAmtTotAC;

	private String chkAmtTotBA;
	private String chkAmtTotBB;
	private String chkAmtTotBC;

	private String chkAmtTotCA;
	private String chkAmtTotCB;
	private String chkAmtTotCC;

	private String chkRtAA;
	private String chkRtAB;
	private String chkRtAC;

	private String chkRtBA;
	private String chkRtBB;
	private String chkRtBC;

	private String chkRtC;

	private String ecSpmtPlanVlmTot;//전속(약정)출하계획량
	private String ecSpmtVlmTot;//전속(약정)출하량
	private String ecSpmtRate;//출하비율
	private String ecSpmtRateA;//출하비율A
	private String ecSpmtRateB;//출하비율B
	private String spmtPrcTot;//출하대금지급액
	private String prdctnVlmTot;//생산량(결과)
	private String cnt;//조직원수

	private String fundAplyAmtTot;//자금신청액
	private String stbltItemList;//적합품목 리스트
	private String itrRt;//금리

	private String rmrk;//비고


	private String prfmncCorpDdlnYn;//실적 법인체 마감
	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;


}
