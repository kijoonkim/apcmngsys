package com.at.apcss.pd.bsm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrdcrCrclOgnUsrMngVO extends ComVO{
	private String userId;		//사용자id
	private String userNm;		//사용자명
	private String userType;	//권한
	private String userStts;	//1차승인
	private String authrtId;	//권한아이디
	private String apoSe;		//평가등록 통합조직 출자출핮조직 구분값
	private String telno;		//전화번호
	private String brno;		//사업자등록번호
	private String moblno;		//휴대전화번호
	private String mblTelno;		//휴대전화번호
	private String coNm;		//회사명 -> 임시로 법인명으로 사용중
	private String evCertYn;	//2차승인구분
	private String cmptnInst;	//관할기관
	private String cmptnInstCofmCd;
	private String cmptncInstAprvSe;
	private String cmptncInstAprvYmd;
	private String cmptncInst;
	private String uoAprvStts;
	private String userAprvYmd;


	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;


}
