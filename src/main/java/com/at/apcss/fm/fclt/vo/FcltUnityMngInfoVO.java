package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltUnityMngInfoVO extends ComVO{

	private String trgtYr;
	//private String apcCd;
	//private String apcNm;
	private int sn;
	private String fcltSysInstlCd;
	private String fcltSysHldYn;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;
	private String fcltSysHldYn2;
	private String fcltSysHldYn3;
	private String fcltSysHldYn4;
	private String fcltSysHldYn5;
	private String fcltSysHldYn6;
	private String fcltSysHldYn7;

	/* 테이블 변경으로 추가 */
	private String prgrsYn;//진척도 갱신 여부
	private String tmprStrgYn;//임시저장 여부
	private String crtrYr;
	private String apcCd;
	private String apcNm;
	private String umsPrdctnInfo;
	private String umsWrhsInfo;
	private String umsSortInfo;
	private String umsStrgInfo;
	private String umsPckgInfo;
	private String umsSpmtInfo;
	private String umsClclnInfo;

}



