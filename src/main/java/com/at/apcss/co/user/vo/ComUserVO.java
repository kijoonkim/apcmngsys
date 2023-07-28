package com.at.apcss.co.user.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComUserVO extends ComVO {

	/**
	 * COM_USER
	 */
	private String userId;
	private String userNm;
	private String pswd;
	private String userType;
	private String userStts;
	private String eml;
	private String telno;
	private String apcCd;
	private String apcNm;
	private String ogdpNm;
	private String jbttlNm;
	private String tkcgTaskNm;
	private String chrgdCertYn;
	private String chrgdCertType;
	private String lckYn;
	private String rmrk;
	private int lgnFailNmtm;
	private String endLgnDt;
	private String endLgnIp;
	private String inqYmd1;
	private String inqYmd2;
	private String aprvYn;
	private String userTypeNm;
	private String userSttsNm;
}
