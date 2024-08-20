package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltBizInfoVO extends ComVO{

	private String msgKey;

	private String bizNm;
	private String bizCd;
	private String bizSprtCd;
	private String bizCn;
	private String sn;
	private String crtrYr;

}
