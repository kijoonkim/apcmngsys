package com.apcmngsys.apcss.am.tot.vo;

import com.apcmngsys.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@Setter
public class TotMngVO extends ComVO{

	/**
	APC코드
	**/
	private String apcCd;


	/**
	부자재기준유형코드
	**/
	private String totCrtrType;


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
	집계상세처리코드
	**/
	private String totDtlPrcsCd;

	/**
	비고
	**/
	private String rmrk;

	/**
	 * 집계상세유형
	 */
	private String totDtlType;

	/**
	 * 구분
	 */
	private String gubun;

	/**
	 *
	 */
	private String dtlNm;


	private List<TotCrtrVO> crtrList;

	private List<TotCrtrVO> crtrDtlList;



	public List<TotCrtrVO> getCrtrList() {
		return crtrList == null ? null : new ArrayList<>(crtrList);
	}

	public void setCrtrList(List<TotCrtrVO> crtrList) {
		this.crtrList = crtrList == null ? null : new ArrayList<>(crtrList);
	}

	public List<TotCrtrVO> getCrtrDtlList() {
		return crtrDtlList == null ? null : new ArrayList<>(crtrDtlList);
	}

	public void setCrtrDtlList(List<TotCrtrVO> crtrDtlList) {
		this.crtrDtlList = crtrDtlList == null ? null : new ArrayList<>(crtrDtlList);
	}



}
