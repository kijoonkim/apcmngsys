package com.at.apcss.fm.farm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FarmerSnCertificationInfoVO extends ComVO{
	private String conNum;
	private String effectiveStartDt;
	private String effectiveEndDt;
	private String stateNm;
	private String congbNm;
	private String farmergbNm;
	private String groupreqerNm;
	private String ownerNm;
	private String certAddr;
	private String landQty;
	private String delYn;
	private String sysFrstInptDt;
	private String sysFrstInptUserId;
	private String sysFrstInptPrgrmId;
	private String sysLastChgDt;
	private String sysLastChgUserId;
	private String sysLastChgPrgrmId;
	private String frmerSn;
	private String bzobRgno;

}
