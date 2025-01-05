package com.at.apcss.am.spmt.vo;

import java.util.List;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SlsMngVO extends ComVO{
	
	

	/**
	 * APC코드
	 */
	private String apcCd;
	
	/**
	 * 매출기준유형
	 */
	private String slsCrtrType;
	
	/**
	 * 기준코드
	 */
	private String crtrCd;
	
	/**
	 * 기준값
	 */
	private String crtrVl;
	
	/**
	 * 기준표시명
	 */
	private String crtrIndctNm;
	
	/**
	 * 표시순서
	 */
	private String indctSeq;

	/**
	 * 사용여부
	 */
	private String useYn;

	/**
	 * 삭제여부
	 */
	private String delYn;
	
	/**
	 * 상세일련번호
	 */
	private String dtlSn;
	
	/**
	 * 상세코드
	 */
	private String dtlCd;
	
	
	/**
	 * 상세값
	 */
	private String dtlVl;
	
	/**
	 * 상세표시명
	 */
	private String dtlChrVl;
	

	/**
	 * 매출일자
	 */
	private String slsYmd;
	

	/**
	 * 매출순번
	 */
	private int slsSn;
	

	/**
	 * 거래처코드
	 */
	private String cnptCd;

	/**
	 * 상품코드
	 */
	private String gdsCd;

	/**
	 * 품목코드
	 */
	private String itemCd ;
	

	/**
	 * 품종코드
	 */
	private String vrtyCd;
	

	/**
	 * 규격코드
	 */
	private String spcfctCd;
	

	/**
	 * 등급코드
	 */
	private String grdCd ;
	
	
	/**
	 * 브랜드명
	 */
	private String brndNm;

	/**
	 * 출하일자
	 */
	private String spmtYmd;

	/**
	 * 수량
	 */
	private int qntt ;
	

	/**
	 * 중량
	 */
	private double wght;

	/**
	 * 매출단가
	 */
	private int slsUntprc ;

	/**
	 * 계산금액
	 */
	private int rkngAmt;
	

	/**
	 * 확정금액
	 */
	private int cfmtnAmt;

	/**
	 * 확정여부
	 */
	private String cfmtnYn;

	/**
	 * 출하번호
	 */
	private String spmtno;
	
	/**
	 * 포장번호
	 */
	private String pckgno ;
	
	/**
	 * 포장순번
	 */
	private int pckgSn;
	
	/**
	 * 수금여부
	 */
	private String clctmYn;
	
	
	List<SlsMngVO> slsPrfmncList;
	
	
	
}
