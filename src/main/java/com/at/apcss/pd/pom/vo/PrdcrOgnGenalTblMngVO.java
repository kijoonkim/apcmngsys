
package com.at.apcss.pd.pom.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrdcrOgnGenalTblMngVO extends ComVO{
	private String apoCd;
	private String apoSe;
	private String wrtYn;
	private String userType;
	private String prdcrOgnzSn;
	private String stbltYn;
	private String itemCd;

	private String cmptnInst;
	private String ctpv;
	private String sgg;
	private String corpSeCd;
	private String corpDtlSeCd;
	private String brno;
	private String crno;
	private String corpNm;
	private String uoCorpNm;
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
	private String uoBrno;
	private String untyYr;

	private String isoHldYn;
	private String aprv;

	private String uoCd;
	private String yr;
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

	//생산자조직 TB_EV_FRMHS_APO
	private String ctgryCd;
	private String ctgryNm;
	private String itemNm;
	private String sttgUpbrItemSe;
	private String sttgUpbrItemNm;
	private String trmtType;
	private String trmtTypeNm;
	private String aprvNm;

	private String prdcrOgnzCd;
	private String prdcrOgnzNm;
	private String rmrk;

	private String ecSpmtPlanVlmTot;//전속(약정)출하계획량
	private String ecSpmtVlmTot;//전속(약정)출하량
	private String ecSpmtRate;//출하비율
	private String ecSpmtRateA;//출하비율A
	private String ecSpmtRateB;//출하비율B
	private String spmtPrcTot;//출하대금지급액
	private String prdctnVlmTot;//생산량(결과)
	private String cnt;//조직원수
	private String orgStbltYn;//적합여부
	private String lastStbltYn;//최종 선정여부
	private String exclYn;//제외 여부

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;
}
