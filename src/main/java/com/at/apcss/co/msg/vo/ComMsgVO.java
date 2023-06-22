package com.at.apcss.co.msg.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComMsgVO extends ComVO{

	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String rmrk;
}
