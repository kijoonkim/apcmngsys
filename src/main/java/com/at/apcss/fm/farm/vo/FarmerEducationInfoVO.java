package com.at.apcss.fm.farm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FarmerEducationInfoVO extends ComVO{
	private String frmerSn;
	private String bzobRgno;
	private String eduCosCd;
	private String name;
	private String eduOrgNm;
	private String eduCosNm;
	private String eduStrDt;
	private String eduEndDt;
	private String cnfmYn;
	private String delYn;
	private String sysFrstInptDt;
	private String sysFrstInptUserId;
	private String sysFrstInptPrgrmId;
	private String sysLastChgDt;
	private String sysLastChgUserId;
	private String sysLastChgPrgrmId;
}
