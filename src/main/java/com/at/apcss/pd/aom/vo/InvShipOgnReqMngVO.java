package com.at.apcss.pd.aom.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InvShipOgnReqMngVO extends ComVO{
	private String apoCd;
	private String corpNm;
	private String rprsvFlnm;
	private String brno;
	private String rprsvTelno;
	private String corpDtlSeCd;
	private String invstNope;
	private String invstExpndFrmerNope;

	private String uoBrno;

	private String crno;
	private String corpSeCd;
	private String corpFndnDay;
	private String invstAmt;
	private String frmerInvstAmt;
	private String prdcrGrpInvstAmt;
	private String locgovInvstAmt;
	private String etcAmt;
	private String fxno;

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;


}
