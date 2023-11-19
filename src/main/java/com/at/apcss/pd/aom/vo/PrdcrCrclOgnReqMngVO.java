package com.at.apcss.pd.aom.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrdcrCrclOgnReqMngVO extends ComVO{
	private String apoCd;
	private String apoSe;

	private String cmptnInst;
	private String ctpv;
	private String sgg;
	private String corpSeCd;
	private String corpDtlSeCd;
	private String brno;
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

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;


}

