package com.at.apcss.am.cmns.vo;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CnptSpmtPckgUnitVO extends CnptVO{
	/**
	 * 사용여부
	 */
	private String useYn;
	/**
	 * 품목코드
	 */
	private String itemCd;
	/**
	 * 품종코드
	 */
	private String vrtyCd;
	/**
	 * 출하포장단위코드
	 */
	private String spmtPckgUnitCd;
	/**
	 * 출하포장단위명
	 */
	private String spmtPckgUnitNm;
	/**
	 * 규격코드
	 * */
	private String spcfctCd;
}
