package com.at.apcss.fm.bbs.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BbsVO extends ComVO{

	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;
}
