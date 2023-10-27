package com.at.apcss.am.pckg.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GdsCdVO extends ComVO {
	// apc 코드
	private String apcCd;
	// 상품코드
	private String gdsCd;
	// 상품명
	private String gdsNm;
	// 품명
	private String itemCd;
	// 품종
	private String vrtyCd;
	// 규격
	private String spcfctCd;
	// 상품등급
	private String gdsGrd;
	// 브랜드
	private String brndCd;
	// 산지
	private String plorCd;
	// 포장구분
	private String pckgSeCd;
	// 입수
	private String bxGdsQntt;
	// 중량
	private String wght;
	//사용여부
	private String delYn;

}
