package com.at.apcss.am.bbs.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class apcBbsCmntVO extends ComVO{

	private String apcCd;
	private String bbsNo;
	private String cmntSeCd;
	private String cmntNo;
    private String cmntChildNo;
    private String cmntCn;
	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;

}
