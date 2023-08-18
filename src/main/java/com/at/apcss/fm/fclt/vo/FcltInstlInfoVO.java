package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltInstlInfoVO extends ComVO{


	private String trgtYr;
	private String apcCd;
	private int sN;
	private String bizYr;
	private String bizSprtCd;
	private String bizCn;
	private String bizAmtCd;
	private int bizAmt;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;
}

