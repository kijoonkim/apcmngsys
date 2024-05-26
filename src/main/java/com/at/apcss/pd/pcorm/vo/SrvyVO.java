package com.at.apcss.pd.pcorm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SrvyVO extends ComVO{
	private String yr;
	private String userId;
	private String srvyKnd;
	private String srvySn;
	private String srvyCn;
	private String rspnsCn;
}
