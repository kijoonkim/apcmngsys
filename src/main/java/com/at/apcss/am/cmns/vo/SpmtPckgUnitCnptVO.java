package com.at.apcss.am.cmns.vo;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SpmtPckgUnitCnptVO extends SpmtPckgUnitVO{
	/**
	 * 사용여부
	 */
	private String useYn;
	/**
	 * 거래처코드
	 */
	private String cnptCd;
	/**
	 * 비고
	 */
	private String rmrk;
}
