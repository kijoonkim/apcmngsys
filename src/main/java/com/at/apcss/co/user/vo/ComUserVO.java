package com.at.apcss.co.user.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
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
	private String aprvYn;
	private String userTypeNm;
	private String userSttsNm;
	private String delYn;
	private String reverseYn;
	private String crno;
	private String brdt;
	private String mblTelno;
	private String odSbmsnYn;
	private String aplyDocSbmsnYn;
}
