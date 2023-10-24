package com.at.apcss.co.apc.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApcInfoVO extends ComVO{

	/** APC코드 */
	private String apcCd;
	/* 제외APC코드 */
	private String exclApcCd;

	/** 원본 APC명 */
	private String regApcNm;
	/** 원본 우편번호 */
	private String regZip;
	/** 원본 주소 */
	private String regAddr;
	/** 원본 전화번호 */
	private String regTelno;

	/** 시도 명 */
	private String ctpvNm;
	/** 시군 명 */
	private String sigunNm;
	/** 주체 코드 */
	private String mbCd;

	/** APC명 */
	private String apcNm;
	/** 사업자등록번호 */
	private String brno;
	/** 은행코드 */
	private String bankCd;
	/** 예금주 */
	private String dpstr;
	/** 계좌번호 */
	private String actno;
	/** 주소 */
	private String addr;
	/** 전화번호 */
	private String telno;
	/** 팩스번호 */
	private String fxno;
	/** 우편번호 */
	private String zip;

	/**
	 * 정산기준
	 */
	private String clclnCrtrCd;

	private String apcSeCd;
}
