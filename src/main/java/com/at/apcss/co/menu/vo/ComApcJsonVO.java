package com.at.apcss.co.menu.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComApcJsonVO {

	private String apcCd;
	private String apcNm;
	private String label;
	private String value;
	private String text;
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

	private String apcSeCd;
}
