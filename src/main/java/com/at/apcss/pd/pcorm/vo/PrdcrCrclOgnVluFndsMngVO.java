package com.at.apcss.pd.pcorm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrdcrCrclOgnVluFndsMngVO extends ComVO{
	private String yr;
	private String brno;
	private String aa;
	private String bb;
	private String cc;
	private String dd;
	private String score;

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;

}
