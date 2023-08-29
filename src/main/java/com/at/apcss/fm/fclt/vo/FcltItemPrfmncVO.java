package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltItemPrfmncVO extends ComVO{

	private String trgtYr;
	private String apcCd;
	private int sn;
	private String fcltItemCd;
	private int fcltItemTrmtAmt;
	private int fcltItemTrmtVlm;
	private int fcltItemSpmtAmt;
	private int fcltItemSpmtRt;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;
}


