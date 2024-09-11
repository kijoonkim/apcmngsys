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
	private String brno;
	private String brdt;
	private String mblTelno;
	private String coTelno;
	private String odSbmsnYn;
	private String aplyDocSbmsnYn;
	
	private String untyOgnzId;
	private String untyOgnzNm;
	private String untyOgnzType;
	private String untyOgnzCd;
	private String untyAuthrtType;
	private String untyAuthrtMngYn;
	private String untyAuthrtMngUserId;
	private String untyAuthrtId;
	
	private String aplyYn;
	private String mngrAplyYn;
	private String authrtAplyYn;
	private String aplySysId;

	
	/**
	 * 조직코드
	 */
	private String ognzCd;
	
	/**
	 * 조직명
	 */
	private String ognzNm;
	
	/**
	 * 법인명
	 */
	private String corpNm;
	private String jbps;
	private String coNm;
	
	private String ctpv;
	private String sgg;
	
	private String ctpvNm;
	private String sggNm;
	private String sggExpln;
	
	private int untyAuthrtMngUserCnt;
	
	private String superUserYn;

	
	/**
	 * 회원유형코드
	 */
	private String mbrTypeCd;
	
	private String authrtMngrYn;	
	private String sysMesYn;
	private String sysFmYn;
	private String sysPdYn;
	private String sysCsYn;
	
	
	private String rtnCd;
	private String rtnMsg;
	
}
