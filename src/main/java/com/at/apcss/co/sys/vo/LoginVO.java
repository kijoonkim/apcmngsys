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
	private String crno;

	private String lgnRslt;
	private String delYn;

	private String apcAdminType;
	private String apcSeCd;

	private String loginCode;
	private String loginMessage;

	private String frcdExpryYn;

	private String refreshToken;

	private String clntCd;
	private String corpCd;
	private String userCtrgy;
	private String empCd;
	private String deptCd;
	private String hrmMngrYn;
	private String hrmEvlRole;
	private String hrmPayMngrYn;
	private String acntgMngrYn;

	/** 사용자 주소 */
	private String addr;

	/** 농업인 일련번호 */
	private String frmerSn;

	/** 통합조직ID **/
	private String untyOgnzId;

	/** 통합조직유형 */
	private String untyOgnzType;

	/** 통합권한유형 */
	private String untyAuthrtType;

	/** 통합권한관리여부 */
	private String untyAuthrtMngYn;

	/** 시도 */
	private String ctpv;
	/** 시군구 */
	private String sgg;


	public String getUntyOgnzId() {
		return untyOgnzId;
	}
	public void setUntyOgnzId(String untyOgnzId) {
		this.untyOgnzId = untyOgnzId;
	}
	public String getUntyOgnzType() {
		return untyOgnzType;
	}
	public void setUntyOgnzType(String untyOgnzType) {
		this.untyOgnzType = untyOgnzType;
	}
	public String getUntyAuthrtType() {
		return untyAuthrtType;
	}
	public void setUntyAuthrtType(String untyAuthrtType) {
		this.untyAuthrtType = untyAuthrtType;
	}
	public String getUntyAuthrtMngYn() {
		return untyAuthrtMngYn;
	}
	public void setUntyAuthrtMngYn(String untyAuthrtMngYn) {
		this.untyAuthrtMngYn = untyAuthrtMngYn;
	}


	public String getFrmerSn() {
		return frmerSn;
	}
	public void setFrmerSn(String frmerSn) {
		this.frmerSn = frmerSn;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getBrno() {
		return brno;
	}
	public void setBrno(String brno) {
		this.brno = brno;
	}
	public String getCrno() {
		return crno;
	}
	public void setCrno(String crno) {
		this.crno = crno;
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
	public String getClntCd() {
		return clntCd;
	}
	public void setClntCd(String clntCd) {
		this.clntCd = clntCd;
	}
	public String getCorpCd() {
		return corpCd;
	}
	public void setCorpCd(String corpCd) {
		this.corpCd = corpCd;
	}
	public String getUserCtrgy() {
		return userCtrgy;
	}
	public void setUserCtrgy(String userCtrgy) {
		this.userCtrgy = userCtrgy;
	}
	public String getEmpCd() {
		return empCd;
	}
	public void setEmpCd(String empCd) {
		this.empCd = empCd;
	}
	public String getDeptCd() {
		return deptCd;
	}
	public void setDeptCd(String deptCd) {
		this.deptCd = deptCd;
	}
	public String getHrmMngrYn() {
		return hrmMngrYn;
	}
	public void setHrmMngrYn(String hrmMngrYn) {
		this.hrmMngrYn = hrmMngrYn;
	}
	public String getHrmEvlRole() {
		return hrmEvlRole;
	}
	public void setHrmEvlRole(String hrmEvlRole) {
		this.hrmEvlRole = hrmEvlRole;
	}
	public String getHrmPayMngrYn() {
		return hrmPayMngrYn;
	}
	public void setHrmPayMngrYn(String hrmPayMngrYn) {
		this.hrmPayMngrYn = hrmPayMngrYn;
	}
	public String getAcntgMngrYn() {
		return acntgMngrYn;
	}
	public void setAcntgMngrYn(String acntgMngrYn) {
		this.acntgMngrYn = acntgMngrYn;
	}

	//------------------------------------------------------
	/** 경영관리 */
	private String maBaseCurrCode;		//	기본통화코드
	private String maBaseLangID;		//	기본언어코드
	private String maBIZSTOPURL;		//	거래중지 정보전송
	private String maCalApiUrl;			//	공휴일 조회 API URL
	private String maCompCode;			//	법인코드
	private String maCompName;			//	법인명
	private String maCurrCode;			//	통화
	private String maCurrName;			//	통화
	private String maCurrUnit;			//	통화
	private String maDefaultAcctRule;	//	회계기준
	private String maDeptCode;			//	부서코드
	private String maDeptName;			//	부서명
	private String maDeptRule;			//	부서기준(1:부서기준, 2:원가중심점기준)
	private String maDutyCode;			//	직책코드
	private String maEmpCode;			//	사원코드
	private String maEmpName;			//	사원명
	private String maEmpNameEN;			//	사원명 영문
	private String maEmpNameFOR;		//	사원명 한자
	private String maEssHome;			//	ESS_HOME
	private String maEssReportHome;		//	ESS REPORT홈(EssReportHome)
	private String maFBSBATCHID;		//	펌뱅킹FTP ID
	private String maFBSBATCHPW;		//	펌뱅킹FTP PASSWORD
	private String maFBSBIP;			//	펌뱅킹 소켓 IP
	private String maFBSBPORT;			//	펌뱅킹 소켓 PORT
	private String maFBSCIP;			//	펌뱅킹 소켓 IP (CB)
	private String maFBSCPORT;			//	펌뱅킹 소켓 PORT (CB)
	private String maFBSFIP;			//	펌뱅킹 소켓 IP (외화)
	private String maFBSFPORT;			//	펌뱅킹 소켓 PORT (외화)
	private String maFBSRECEIVEPATH;	//	펌뱅킹배치수신폴더(FTP서버 위치 기준으로 정의)
	private String maFBSRIP;			//	펌뱅킹 소켓 IP
	private String maFBSRPORT;			//	펌뱅킹 소켓 PORT
	private String maFBSSENDPATH;		//	펌뱅킹배치송신폴더(FTP서버 위치 기준으로 정의)
	private String maFBSSERVERTYPE;		//	서버구분 (DEV : 개발계, PROD : 가동계) /펌뱅킹 전문 송신시 업체코드 자동세팅용
	private String maFBSVAN;			//	ECBANK(원화)
	private String maFBSVANCB;			//	ECBANKCB
	private String maFBSVANFC;			//	ECBANKFC(외화)
	private String maFI_DELETE_USER;	//	회계삭제권한
	private String maFileServerHome;	//	파일서버홈
	private String maFIOrgCode;			//	회계
	private String maGADeptCode;		//	총무부서 코드
	private String maGW_SITE;			//	그룹웨어결제 화면
	private String maHRDeptCode;		//	인사 부서 코드
	private String maHREvaluateRole;	//	e-평가 권한
	private String maHriReport;			//	인사기록카드
	private String maIsAccountChief;	//	회계팀장 여부 2016.07.11
	private String maIsAccountManager;	//	회계담당자 여부
	private String maIsGW;				//	그룹웨어 결제여부
	private String maIsHRManager;		//	인사총무관리자 여부
	private String maIsHRPayManager;	//	인사급여관리자 여부
	private String maIsManager;			//	특정임원여부
	private String maIsPayResultAdjust;	//	급여조정여부
	private String maIsPostingUser;		//	전기담당자 여부
	private String maIsSalesEmp;		//	영업사원 여부
	private String maIsTrManager;		//	특정임원여부
	private String maIsTrUser;			//	특정임원여부
	private String maJobCode;			//	직무코드
	private String maJobFamilyCode;		//	직종코드
	private String maJobRankCode;		//	직급코드
	private String maLanguageID;		//	언어코드
	private String maNTSBIZURL;			//	국세청 사업자등록현황 전송
	private String maPositionCode;		//	직위코드
	private String maProxyEmpCode;		//
	private String maScmHome;			//	scm홈
	private String maSiteCode;			//	사업장코드
	private String maSiteName;			//	사업장명
	private String maSystemDeptCode;	//	System 부서 코드
	private String maSystemDeveloper;	//	개발자권한
	private String maTaxSiteCode;		//	신고사업장코드
	private String maTaxSiteName;		//	신고사업장명
	private String maUserID;			//	사용자ID
	private String maUserName;			//	사용자Name

	public String getMaBaseCurrCode() {
		return maBaseCurrCode;
	}
	public void setMaBaseCurrCode(String maBaseCurrCode) {
		this.maBaseCurrCode = maBaseCurrCode;
	}
	public String getMaBaseLangID() {
		return maBaseLangID;
	}
	public void setMaBaseLangID(String maBaseLangID) {
		this.maBaseLangID = maBaseLangID;
	}
	public String getMaBIZSTOPURL() {
		return maBIZSTOPURL;
	}
	public void setMaBIZSTOPURL(String maBIZSTOPURL) {
		this.maBIZSTOPURL = maBIZSTOPURL;
	}
	public String getMaCalApiUrl() {
		return maCalApiUrl;
	}
	public void setMaCalApiUrl(String maCalApiUrl) {
		this.maCalApiUrl = maCalApiUrl;
	}
	public String getMaCompCode() {
		return maCompCode;
	}
	public void setMaCompCode(String maCompCode) {
		this.maCompCode = maCompCode;
	}
	public String getMaCompName() {
		return maCompName;
	}
	public void setMaCompName(String maCompName) {
		this.maCompName = maCompName;
	}
	public String getMaCurrCode() {
		return maCurrCode;
	}
	public void setMaCurrCode(String maCurrCode) {
		this.maCurrCode = maCurrCode;
	}
	public String getMaCurrName() {
		return maCurrName;
	}
	public void setMaCurrName(String maCurrName) {
		this.maCurrName = maCurrName;
	}
	public String getMaCurrUnit() {
		return maCurrUnit;
	}
	public void setMaCurrUnit(String maCurrUnit) {
		this.maCurrUnit = maCurrUnit;
	}
	public String getMaDefaultAcctRule() {
		return maDefaultAcctRule;
	}
	public void setMaDefaultAcctRule(String maDefaultAcctRule) {
		this.maDefaultAcctRule = maDefaultAcctRule;
	}
	public String getMaDeptCode() {
		return maDeptCode;
	}
	public void setMaDeptCode(String maDeptCode) {
		this.maDeptCode = maDeptCode;
	}
	public String getMaDeptName() {
		return maDeptName;
	}
	public void setMaDeptName(String maDeptName) {
		this.maDeptName = maDeptName;
	}
	public String getMaDeptRule() {
		return maDeptRule;
	}
	public void setMaDeptRule(String maDeptRule) {
		this.maDeptRule = maDeptRule;
	}
	public String getMaDutyCode() {
		return maDutyCode;
	}
	public void setMaDutyCode(String maDutyCode) {
		this.maDutyCode = maDutyCode;
	}
	public String getMaEmpCode() {
		return maEmpCode;
	}
	public void setMaEmpCode(String maEmpCode) {
		this.maEmpCode = maEmpCode;
	}
	public String getMaEmpName() {
		return maEmpName;
	}
	public void setMaEmpName(String maEmpName) {
		this.maEmpName = maEmpName;
	}
	public String getMaEmpNameEN() {
		return maEmpNameEN;
	}
	public void setMaEmpNameEN(String maEmpNameEN) {
		this.maEmpNameEN = maEmpNameEN;
	}
	public String getMaEmpNameFOR() {
		return maEmpNameFOR;
	}
	public void setMaEmpNameFOR(String maEmpNameFOR) {
		this.maEmpNameFOR = maEmpNameFOR;
	}
	public String getMaEssHome() {
		return maEssHome;
	}
	public void setMaEssHome(String maEssHome) {
		this.maEssHome = maEssHome;
	}
	public String getMaEssReportHome() {
		return maEssReportHome;
	}
	public void setMaEssReportHome(String maEssReportHome) {
		this.maEssReportHome = maEssReportHome;
	}
	public String getMaFBSBATCHID() {
		return maFBSBATCHID;
	}
	public void setMaFBSBATCHID(String maFBSBATCHID) {
		this.maFBSBATCHID = maFBSBATCHID;
	}
	public String getMaFBSBATCHPW() {
		return maFBSBATCHPW;
	}
	public void setMaFBSBATCHPW(String maFBSBATCHPW) {
		this.maFBSBATCHPW = maFBSBATCHPW;
	}
	public String getMaFBSBIP() {
		return maFBSBIP;
	}
	public void setMaFBSBIP(String maFBSBIP) {
		this.maFBSBIP = maFBSBIP;
	}
	public String getMaFBSBPORT() {
		return maFBSBPORT;
	}
	public void setMaFBSBPORT(String maFBSBPORT) {
		this.maFBSBPORT = maFBSBPORT;
	}
	public String getMaFBSCIP() {
		return maFBSCIP;
	}
	public void setMaFBSCIP(String maFBSCIP) {
		this.maFBSCIP = maFBSCIP;
	}
	public String getMaFBSCPORT() {
		return maFBSCPORT;
	}
	public void setMaFBSCPORT(String maFBSCPORT) {
		this.maFBSCPORT = maFBSCPORT;
	}
	public String getMaFBSFIP() {
		return maFBSFIP;
	}
	public void setMaFBSFIP(String maFBSFIP) {
		this.maFBSFIP = maFBSFIP;
	}
	public String getMaFBSFPORT() {
		return maFBSFPORT;
	}
	public void setMaFBSFPORT(String maFBSFPORT) {
		this.maFBSFPORT = maFBSFPORT;
	}
	public String getMaFBSRECEIVEPATH() {
		return maFBSRECEIVEPATH;
	}
	public void setMaFBSRECEIVEPATH(String maFBSRECEIVEPATH) {
		this.maFBSRECEIVEPATH = maFBSRECEIVEPATH;
	}
	public String getMaFBSRIP() {
		return maFBSRIP;
	}
	public void setMaFBSRIP(String maFBSRIP) {
		this.maFBSRIP = maFBSRIP;
	}
	public String getMaFBSRPORT() {
		return maFBSRPORT;
	}
	public void setMaFBSRPORT(String maFBSRPORT) {
		this.maFBSRPORT = maFBSRPORT;
	}
	public String getMaFBSSENDPATH() {
		return maFBSSENDPATH;
	}
	public void setMaFBSSENDPATH(String maFBSSENDPATH) {
		this.maFBSSENDPATH = maFBSSENDPATH;
	}
	public String getMaFBSSERVERTYPE() {
		return maFBSSERVERTYPE;
	}
	public void setMaFBSSERVERTYPE(String maFBSSERVERTYPE) {
		this.maFBSSERVERTYPE = maFBSSERVERTYPE;
	}
	public String getMaFBSVAN() {
		return maFBSVAN;
	}
	public void setMaFBSVAN(String maFBSVAN) {
		this.maFBSVAN = maFBSVAN;
	}
	public String getMaFBSVANCB() {
		return maFBSVANCB;
	}
	public void setMaFBSVANCB(String maFBSVANCB) {
		this.maFBSVANCB = maFBSVANCB;
	}
	public String getMaFBSVANFC() {
		return maFBSVANFC;
	}
	public void setMaFBSVANFC(String maFBSVANFC) {
		this.maFBSVANFC = maFBSVANFC;
	}
	public String getMaFI_DELETE_USER() {
		return maFI_DELETE_USER;
	}
	public void setMaFI_DELETE_USER(String maFI_DELETE_USER) {
		this.maFI_DELETE_USER = maFI_DELETE_USER;
	}
	public String getMaFileServerHome() {
		return maFileServerHome;
	}
	public void setMaFileServerHome(String maFileServerHome) {
		this.maFileServerHome = maFileServerHome;
	}
	public String getMaFIOrgCode() {
		return maFIOrgCode;
	}
	public void setMaFIOrgCode(String maFIOrgCode) {
		this.maFIOrgCode = maFIOrgCode;
	}
	public String getMaGADeptCode() {
		return maGADeptCode;
	}
	public void setMaGADeptCode(String maGADeptCode) {
		this.maGADeptCode = maGADeptCode;
	}
	public String getMaGW_SITE() {
		return maGW_SITE;
	}
	public void setMaGW_SITE(String maGW_SITE) {
		this.maGW_SITE = maGW_SITE;
	}
	public String getMaHRDeptCode() {
		return maHRDeptCode;
	}
	public void setMaHRDeptCode(String maHRDeptCode) {
		this.maHRDeptCode = maHRDeptCode;
	}
	public String getMaHREvaluateRole() {
		return maHREvaluateRole;
	}
	public void setMaHREvaluateRole(String maHREvaluateRole) {
		this.maHREvaluateRole = maHREvaluateRole;
	}
	public String getMaHriReport() {
		return maHriReport;
	}
	public void setMaHriReport(String maHriReport) {
		this.maHriReport = maHriReport;
	}
	public String getMaIsAccountChief() {
		return maIsAccountChief;
	}
	public void setMaIsAccountChief(String maIsAccountChief) {
		this.maIsAccountChief = maIsAccountChief;
	}
	public String getMaIsAccountManager() {
		return maIsAccountManager;
	}
	public void setMaIsAccountManager(String maIsAccountManager) {
		this.maIsAccountManager = maIsAccountManager;
	}
	public String getMaIsGW() {
		return maIsGW;
	}
	public void setMaIsGW(String maIsGW) {
		this.maIsGW = maIsGW;
	}
	public String getMaIsHRManager() {
		return maIsHRManager;
	}
	public void setMaIsHRManager(String maIsHRManager) {
		this.maIsHRManager = maIsHRManager;
	}
	public String getMaIsHRPayManager() {
		return maIsHRPayManager;
	}
	public void setMaIsHRPayManager(String maIsHRPayManager) {
		this.maIsHRPayManager = maIsHRPayManager;
	}
	public String getMaIsManager() {
		return maIsManager;
	}
	public void setMaIsManager(String maIsManager) {
		this.maIsManager = maIsManager;
	}
	public String getMaIsPayResultAdjust() {
		return maIsPayResultAdjust;
	}
	public void setMaIsPayResultAdjust(String maIsPayResultAdjust) {
		this.maIsPayResultAdjust = maIsPayResultAdjust;
	}
	public String getMaIsPostingUser() {
		return maIsPostingUser;
	}
	public void setMaIsPostingUser(String maIsPostingUser) {
		this.maIsPostingUser = maIsPostingUser;
	}
	public String getMaIsSalesEmp() {
		return maIsSalesEmp;
	}
	public void setMaIsSalesEmp(String maIsSalesEmp) {
		this.maIsSalesEmp = maIsSalesEmp;
	}
	public String getMaIsTrManager() {
		return maIsTrManager;
	}
	public void setMaIsTrManager(String maIsTrManager) {
		this.maIsTrManager = maIsTrManager;
	}
	public String getMaIsTrUser() {
		return maIsTrUser;
	}
	public void setMaIsTrUser(String maIsTrUser) {
		this.maIsTrUser = maIsTrUser;
	}
	public String getMaJobCode() {
		return maJobCode;
	}
	public void setMaJobCode(String maJobCode) {
		this.maJobCode = maJobCode;
	}
	public String getMaJobFamilyCode() {
		return maJobFamilyCode;
	}
	public void setMaJobFamilyCode(String maJobFamilyCode) {
		this.maJobFamilyCode = maJobFamilyCode;
	}
	public String getMaJobRankCode() {
		return maJobRankCode;
	}
	public void setMaJobRankCode(String maJobRankCode) {
		this.maJobRankCode = maJobRankCode;
	}
	public String getMaLanguageID() {
		return maLanguageID;
	}
	public void setMaLanguageID(String maLanguageID) {
		this.maLanguageID = maLanguageID;
	}
	public String getMaNTSBIZURL() {
		return maNTSBIZURL;
	}
	public void setMaNTSBIZURL(String maNTSBIZURL) {
		this.maNTSBIZURL = maNTSBIZURL;
	}
	public String getMaPositionCode() {
		return maPositionCode;
	}
	public void setMaPositionCode(String maPositionCode) {
		this.maPositionCode = maPositionCode;
	}
	public String getMaProxyEmpCode() {
		return maProxyEmpCode;
	}
	public void setMaProxyEmpCode(String maProxyEmpCode) {
		this.maProxyEmpCode = maProxyEmpCode;
	}
	public String getMaScmHome() {
		return maScmHome;
	}
	public void setMaScmHome(String maScmHome) {
		this.maScmHome = maScmHome;
	}
	public String getMaSiteCode() {
		return maSiteCode;
	}
	public void setMaSiteCode(String maSiteCode) {
		this.maSiteCode = maSiteCode;
	}
	public String getMaSiteName() {
		return maSiteName;
	}
	public void setMaSiteName(String maSiteName) {
		this.maSiteName = maSiteName;
	}
	public String getMaSystemDeptCode() {
		return maSystemDeptCode;
	}
	public void setMaSystemDeptCode(String maSystemDeptCode) {
		this.maSystemDeptCode = maSystemDeptCode;
	}
	public String getMaSystemDeveloper() {
		return maSystemDeveloper;
	}
	public void setMaSystemDeveloper(String maSystemDeveloper) {
		this.maSystemDeveloper = maSystemDeveloper;
	}
	public String getMaTaxSiteCode() {
		return maTaxSiteCode;
	}
	public void setMaTaxSiteCode(String maTaxSiteCode) {
		this.maTaxSiteCode = maTaxSiteCode;
	}
	public String getMaTaxSiteName() {
		return maTaxSiteName;
	}
	public void setMaTaxSiteName(String maTaxSiteName) {
		this.maTaxSiteName = maTaxSiteName;
	}
	public String getMaUserID() {
		return maUserID;
	}
	public void setMaUserID(String maUserID) {
		this.maUserID = maUserID;
	}
	public String getMaUserName() {
		return maUserName;
	}
	public void setMaUserName(String maUserName) {
		this.maUserName = maUserName;
	}
	//------------------------------------------------------
	public String getCtpv() {
		return ctpv;
	}
	public void setCtpv(String ctpv) {
		this.ctpv = ctpv;
	}
	public String getSgg() {
		return sgg;
	}
	public void setSgg(String sgg) {
		this.sgg = sgg;
	}


}
