package com.at.apcss.am.cmns.vo;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SpmtSlsUntprcRegVO extends SpmtPckgUnitVO{
	/**
	 * APC코드
	 */
	private String spmtSlsUntprcCd;
	/**
	 * 출하매출단가코드
	 */
	private int spmtSlsUntprc;
	/**
	 * 비고
	 */
	private String rmrk;

	/**
	 *   적용기준일자
	 */
	private String aplcnCrtrYmd;
}
