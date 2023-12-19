package com.at.apcss.am.bbs.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class apcBbsVO extends ComVO{

	private String apcCd;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;
	private String bbsNo;
	private String bbsTtl;
	private String bbsSeCd;
	private String bbsSeCdNm;
	private String bbsSbjt;
	private String delYn;
	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;
}
