package com.at.apcss.am.oprtr.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
public class OprtrVO extends ComVO{

	/*
	 * APC코드
	 * */
	private String apcCd;

	/*
	 * 작업자명
	 * */
	private String flnm;

	/*
	 * 생년월일
	 * */
	private String brdt;

	/*
	 * 전화번호
	 * */
	private String telno;

	/*
	 * 주소
	 * */
	private String addr;

	/*
	 * 입사일자
	 * */
	private String jncmpYmd;

	/*
	 * 은행
	 * */
	private String bankCd;

	/*
	 * 계좌번호
	 * */
	private String actno;

	/*
	 * 예금주명
	 * */
	private String dpstrNm;

	/*
	 * 비고
	 * */
	private String rmrk;

	/**
	 * 등록 수
	 */
	private int cnt;
	/**
	 * 삭제 불가능 사유
	 */
	private String delible;

}
