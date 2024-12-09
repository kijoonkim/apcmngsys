package com.at.apcss.am.asst.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AsstMtrVO extends ComVO{

	/**
	APC코드
	**/
	private String apcCd;
	/**
	부자재기준유형코드
	**/
	private String asstMtrCrtrType;

	/**
	부자재기준유형명칭
	**/
	private String asstMtrCrtrTypeNm;
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

}
