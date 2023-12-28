package com.at.apcss.pd.pom.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrdcrOgnShipContMngVO extends ComVO{
	private String apoCd;
	private String apoSe;

	private String cmptnInst;
	private String ctpv;
	private String sgg;
	private String corpSeCd;
	private String corpDtlSeCd;
	private String brno;
	private String crno;
	private String corpNm;
	private String picFlnm;

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

	private String intyYn;
	private String uoNm;
	private String uoBrno;
	private String untyYr;

	private String isoHldYn;
	private String aprv;

	private String uoCd;
	private String yr;
	private String aplyDay;
	private String rawMtrEnsrSigunCnt;
	private String rawMtrEnsrCtpvCnt;
	private String ctpvNm;
	private String sigunNm;
	private String pruoFundAplyAmt;
	private String isoFundAplyAmt;
	private String aplyTrgtSe;

	private String rmrk;

	private String itemCd;
	private String itemNm;
	private String ctgryCd;
	private String ctgryNm;
	private String trmtType;
	private String sttgUpbrItemSe;

	private String prdcrOgnzSn;
	private String prdcrOgnzCd;
	private String prdcrOgnzNm;

	private String cltvtnLandSn;
	private String flnm;
	private String cltvtnLandAddr;

	private String joinDay;
	private String whdwlDay;
	private String cltvtnSfc;//cltvtnArea -> cltvtnSfc 컬럼 표준화로 변경됨

	private String prdctnPlanVlm;
	private String ecSpmtPlanVlm;
	private String planRmrk;

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;


}
