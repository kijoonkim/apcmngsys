package com.at.apcss.pd.aom.vo;

import java.util.List;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PrdcrCrclOgnReqMngVO extends ComVO{
	private String apoCd;
	private String apoSe;
	private String wrtYn;
	private String userType;

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

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;

	private List<GpcVO> gpcList;
}

