package com.at.apcss.pd.pcorm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrdcrCrclOgnVluFndsMngVO extends ComVO{
	private String yr;
	private String seq;//순번
	private String brno;
	private String corpNm;

	private String computWayCd;//산출식 코드
	private String computWayDtl;//산출식 상세
	private String computWayRslt;//산출식 상세
	private String fundArtcl;//항목
	private String fundArtclNm;//항목
	private String alt;//배점
	private String scr;//점수
	private String useYn;//사용유무
	private String rmrk;//비고

	private String ctgryCd;//부류
	private String ctgryNm;//부류
	private String slsTotAmt;//전문품목 총취급액
	private String slsTotAmtTot;//총취급액
	private String slsTotAmtRt;//전속취급율
	private String onlnWhlslMrktAmt;//온라인도매시장 0.2

	private String totPercCont;//기준총취급액
	private String rtPercCont;//기준전속취급율



	private String apoCd;
	private String uoCd;
	private String apoSeNm;
	private String uoBrno;
	private String crno;
	private String uoCorpNm;
	private String ctpv;
	private String sgg;
	private String cmptnInst;

	private String trmtType;
	private String trmtTypeNm;

	private String prdcrOgnzNm;

	private String stbltYn;
	private String stbltYnNm;

	private String itemNm;
	private String itemCd;

	private String sttgUpbrItemSe;
	private String sttgUpbrItemNm;

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
	private String fundAplyAmtStbltTot;//자금신청액(탈락 출자출하조직 신청액은 제외)
	private String stbltItemList;//적합품목 리스트
	private String itrRt;//금리

	/*관리자 입력 추가*/
	private String corpSeCd;
	private String corpSeNm;
	private String corpDtlSeCd;
	private String corpDtlSeNm;

	private String uoCorpSeCd;
	private String uoCorpSeNm;
	private String uoCorpDtlSeCd;
	private String uoCorpDtlSeNm;

	private String icptRsnCd;
	private String icptRsnNm;
	private String icptRsnDtlCd;
	private String icptRsnDtlNm;
	private String mngrStbltYn;
	private String mngrIcptRsnCd;
	private String mngrIcptRsnNm;
	private String mngrIcptRsnDtlCd;
	private String mngrIcptRsnDtlNm;
	private String mngrItrRt;

	private String pnlty;
	private String mngrPnlty;

	private String totTrmtPrfmncAmt;
	private String ddcTot;
	private String ajmtAmt;
	private String spmtPrfmncAmt;
	private String slsCprtnTot;
	private String spmtRt;



	private String apoSe;//평가년도
	private String aprv;//승인형/육성형 구분
	private String aprvNm;//승인형/육성형 구분

	private String slsTotAmtScr;//전문품목 총취급액 점수(A)(50)
	private String slsTotRtScr;//전문품목 전속취급률 점수(B)(50)
	private String totScr;//총점(A+B)(100)
	private String onlnWhlslMrktScr;//온라인도매시장 가점(1~5)
	private String rtlEdnstScr;//유통교육 가점(0~2)
	private String ddcScr;//감점(△10)
	private String lastScr;//가감점 포함 최종 점수(100)

	/* 출자출하조직 로우데이터 추가 */

	private String uoStbltYn;
	private String uoMngrStbltYn;
	private String uoIcptRsnCd;
	private String uoIcptRsnNm;
	private String uoMngrIcptRsnCd;
	private String uoMngrIcptRsnNm;
	private String uoItrRt;
	private String uoMngrItrRt;

	private String uoBrnoCnt;
	private String totDdcAmt;
	private String totAjmtAmt;
	private String etcTotSpmtPrfmncAmt;
	private String spmtAmtRt;

	/* 통합조직 로우데이터 추가 */

	private String addr;

	private String rprsvFlnm;
	private String rprsvTelno;
	private String rprsvMoblno;
	private String rprsvEml;

	private String picPosition;
	private String picTelno;
	private String picMoblno;
	private String picEml;

	private String isoFundAplyAmtStbltTot;

	private String prchsTrstAmtTot;
	private String prchsEmspapAmtTot;
	private String prchsAmtTot;

	private String slsTrstAmtTot;
	private String slsEmspapAmtTot;
	private String slsAmtTot;

	private String addScr;

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;

}
