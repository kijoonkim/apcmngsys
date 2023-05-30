package com.at.apcss.co.user.vo;

import lombok.Data;

@Data
public class ComUserVO {
	
	/**
	 * COM_USER
	 */
	private String userId;
	private String userNm;
	private String pswd;
	private String userType;
	private String userStts;
	private String eml;
	private String mblTelno;
	private String apcCd;
	private String ogdpNm;
	private String chrgdCertYn;
	private String chrgdCertType;
	private String lckYn;
	private int lgnFailNmtm;
	private String endLgnDt;
	private String endLgnIp;

}
