package com.at.apcss.co.sys.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComSysVO {

	private String userId;
	private String userNm;
	private String userIp;
	private String apcCd;
	private String userType;
	private String prgrmId;
	private String lgnScsYn;
	private String prslType;
	private String flfmtTaskSeCd;
	
	private String sessId;
	private String frcdExpryYn;
	
	private String errCd;
	private String errCnts;
}
