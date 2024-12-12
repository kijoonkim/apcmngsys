package com.at.apcss.am.stat.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StatMngVO extends ComVO{

	/**
	APC코드
	**/
	private String apcCd;

	/**
	통계기준유형코드
	**/
	private String statCrtrType;


	/**
	기준코드
	**/
	private String crtrCd;
	/**
	기준값
	**/
	private Integer crtrVl;
	/**
	기준표시명
	**/
	private String crtrIndctNm;
	/**
	사용여부
	**/
	private String useYn;
	/**
	표시순서
	**/
	private Integer indctSeq;
	/**
	삭제여부
	**/
	private String delYn;
	/**
	상세순번
	**/
	private Integer dtlSn;
	/**
	상세코드
	**/
	private String dtlCd;
	/**
	상세값
	**/
	private String dtlVl;
	/**
	상세표시명
	**/
	private String dtlIndctNm;

	/**
	상태
	**/
	private String status;

	/**
	통계상세처리코드
	**/
	private String statDtlPrcsCd;

	/**
	비고
	**/
	private String rmrk;


	/**
	 * 구분
	 */
	private String gubun;

	/**
	 *
	 */
	private String dtlNm;



}
