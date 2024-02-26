package com.at.apcss.co.sys.vo;

import java.io.Serializable;

/**
 * @Class Name : LoginVO.java
 * @Description : Login VO class
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.03.03		박지욱		최초 생성
 * @ 2021.05.30		정진오		디지털원패스 사용자키/세션값 추가
 *
 *  @author 공통서비스 개발팀 박지욱
 *  @since 2009.03.03
 *  @version 1.0
 *  @see
 *
 */
public class LoginVO implements Serializable{

	private static final long serialVersionUID = -8274004534207618049L;

	/** 아이디 */
	private String id;
	/** 이름 */
	private String name;
	/** 주민등록번호 */
	private String ihidNum;
	/** 이메일주소 */
	private String email;
	/** 비밀번호 */
	private String password;
	/** 비밀번호 힌트 */
	private String passwordHint;
	/** 비밀번호 정답 */
	private String passwordCnsr;

	/** 고유아이디 */
	private String uniqId;
	/** 로그인 후 이동할 페이지 */
	private String url;
	/** 사용자 IP정보 */
	private String ip;
	/** GPKI인증 DN */
	private String dn;
	/** 디지털원패스 사용자키 */
	private String onepassUserkey;
	/** 디지털원패스 사용자세션값 */
	private String onepassIntfToken;

	private String userId;
	private String pswd;
	private String userType;
	private String userStts;
	private String mblTelno;
	private String apcCd;
	private String apcNm;
	private String ogdpNm;
	private String chrgdCertYn;
	private String chrgdCertType;
	private String lckYn;
	private int lgnFailNmtm;
	private String endLgnDt;
	private String endLgnIp;
	private String brno;

	private String lgnRslt;
	private String delYn;

	private String apcAdminType;
	private String apcSeCd;

	private String loginCode;
	private String loginMessage;

	private String frcdExpryYn;
	
	private String refreshToken;

	public String getBrno() {
		return brno;
	}
	public void setBrno(String brno) {
		this.brno = brno;
	}
	/**
	 * id attribute 를 리턴한다.
	 * @return String
	 */
	public String getId() {
		return id;
	}
	/**
	 * id attribute 값을 설정한다.
	 * @param id String
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * name attribute 를 리턴한다.
	 * @return String
	 */
	public String getName() {
		return name;
	}
	/**
	 * name attribute 값을 설정한다.
	 * @param name String
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * ihidNum attribute 를 리턴한다.
	 * @return String
	 */
	public String getIhidNum() {
		return ihidNum;
	}
	/**
	 * ihidNum attribute 값을 설정한다.
	 * @param ihidNum String
	 */
	public void setIhidNum(String ihidNum) {
		this.ihidNum = ihidNum;
	}
	/**
	 * email attribute 를 리턴한다.
	 * @return String
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * email attribute 값을 설정한다.
	 * @param email String
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * password attribute 를 리턴한다.
	 * @return String
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * password attribute 값을 설정한다.
	 * @param password String
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * passwordHint attribute 를 리턴한다.
	 * @return String
	 */
	public String getPasswordHint() {
		return passwordHint;
	}
	/**
	 * passwordHint attribute 값을 설정한다.
	 * @param passwordHint String
	 */
	public void setPasswordHint(String passwordHint) {
		this.passwordHint = passwordHint;
	}
	/**
	 * passwordCnsr attribute 를 리턴한다.
	 * @return String
	 */
	public String getPasswordCnsr() {
		return passwordCnsr;
	}
	/**
	 * passwordCnsr attribute 값을 설정한다.
	 * @param passwordCnsr String
	 */
	public void setPasswordCnsr(String passwordCnsr) {
		this.passwordCnsr = passwordCnsr;
	}

	/**
	 * uniqId attribute 를 리턴한다.
	 * @return String
	 */
	public String getUniqId() {
		return uniqId;
	}
	/**
	 * uniqId attribute 값을 설정한다.
	 * @param uniqId String
	 */
	public void setUniqId(String uniqId) {
		this.uniqId = uniqId;
	}
	/**
	 * url attribute 를 리턴한다.
	 * @return String
	 */
	public String getUrl() {
		return url;
	}
	/**
	 * url attribute 값을 설정한다.
	 * @param url String
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	/**
	 * ip attribute 를 리턴한다.
	 * @return String
	 */
	public String getIp() {
		return ip;
	}
	/**
	 * ip attribute 값을 설정한다.
	 * @param ip String
	 */
	public void setIp(String ip) {
		this.ip = ip;
	}
	/**
	 * dn attribute 를 리턴한다.
	 * @return String
	 */
	public String getDn() {
		return dn;
	}
	/**
	 * dn attribute 값을 설정한다.
	 * @param dn String
	 */
	public void setDn(String dn) {
		this.dn = dn;
	}

	/**
	 * 디지털원패스 사용자키를 리턴한다.
	 * @return onepassUserkey
	 */
	public String getOnepassUserkey() {
		return onepassUserkey;
	}
	/**
	 * 디지털원패스 사용자키를 설정한다.
	 * @param onepassUserkey
	 */
	public void setOnepassUserkey(String onepassUserkey) {
		this.onepassUserkey = onepassUserkey;
	}
	/**
	 * 디지털원패스 사용자세션값을 리턴한다.
	 * @return
	 */
	public String getOnepassIntfToken() {
		return onepassIntfToken;
	}
	/**
	 * 디지털원패스 사용자세션값을 설정한다.
	 * @param onepassIntfToken
	 */
	public void setOnepassIntfToken(String onepassIntfToken) {
		this.onepassIntfToken = onepassIntfToken;
	}

	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserStts() {
		return userStts;
	}
	public void setUserStts(String userStts) {
		this.userStts = userStts;
	}
	public String getMblTelno() {
		return mblTelno;
	}
	public void setMblTelno(String mblTelno) {
		this.mblTelno = mblTelno;
	}
	public String getApcCd() {
		return apcCd;
	}
	public void setApcCd(String apcCd) {
		this.apcCd = apcCd;
	}
	public String getOgdpNm() {
		return ogdpNm;
	}
	public void setOgdpNm(String ogdpNm) {
		this.ogdpNm = ogdpNm;
	}
	public String getChrgdCertYn() {
		return chrgdCertYn;
	}
	public void setChrgdCertYn(String chrgdCertYn) {
		this.chrgdCertYn = chrgdCertYn;
	}
	public String getChrgdCertType() {
		return chrgdCertType;
	}
	public void setChrgdCertType(String chrgdCertType) {
		this.chrgdCertType = chrgdCertType;
	}
	public String getLckYn() {
		return lckYn;
	}
	public void setLckYn(String lckYn) {
		this.lckYn = lckYn;
	}
	public int getLgnFailNmtm() {
		return lgnFailNmtm;
	}
	public void setLgnFailNmtm(int lgnFailNmtm) {
		this.lgnFailNmtm = lgnFailNmtm;
	}
	public String getEndLgnDt() {
		return endLgnDt;
	}
	public void setEndLgnDt(String endLgnDt) {
		this.endLgnDt = endLgnDt;
	}
	public String getEndLgnIp() {
		return endLgnIp;
	}
	public void setEndLgnIp(String endLgnIp) {
		this.endLgnIp = endLgnIp;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPswd() {
		return pswd;
	}
	public void setPswd(String pswd) {
		this.pswd = pswd;
	}
	public String getApcNm() {
		return apcNm;
	}
	public void setApcNm(String apcNm) {
		this.apcNm = apcNm;
	}
	public String getApcAdminType() {
		return apcAdminType;
	}
	public void setApcAdminType(String apcAdminType) {
		this.apcAdminType = apcAdminType;
	}
	public String getLgnRslt() {
		return lgnRslt;
	}
	public void setLgnRslt(String lgnRslt) {
		this.lgnRslt = lgnRslt;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getApcSeCd() {
		return apcSeCd;
	}
	public void setApcSeCd(String apcSeCd) {
		this.apcSeCd = apcSeCd;
	}
	public String getLoginCode() {
		return loginCode;
	}
	public void setLoginCode(String loginCode) {
		this.loginCode = loginCode;
	}
	public String getLoginMessage() {
		return loginMessage;
	}
	public void setLoginMessage(String loginMessage) {
		this.loginMessage = loginMessage;
	}
	public String getFrcdExpryYn() {
		return frcdExpryYn;
	}
	public void setFrcdExpryYn(String frcdExpryYn) {
		this.frcdExpryYn = frcdExpryYn;
	}
	public String getRefreshToken() {
		return refreshToken;
	}
	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}

}
