package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltItemVO extends ComVO{

	/*품목*/
	private String crtrYr;
	private String apcCd;
	private String apcNm;
	private String itemDtlNm;
	private String trmtAmt;

	private String itemCd;//품목코드
	private String itemNm;//품목명
	private String sn;//순번
	private String ognzSeCd;//조직 구분
	private String etcCtgryCd;//기타 부류

	/**
	 * 처리종류 : 이력용
	 */
	private String prcsKnd;
}











