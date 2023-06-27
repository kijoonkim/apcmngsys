package com.at.apcss.am.pckg.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : PckgCmndVO.java
 * @Description : 포장지시에 대한 VO 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class PckgCmndVO extends ComVO {
	
	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * APC구분코드
	 */
	private String apcSeCd;

	/**
	 * 포장지시번호
	 */
	private String pckgCmndNo;

	/**
	 * 포장지시순번
	 */
	private int pckgCmndSeqNo;

	/**
	 * 포장지시일자
	 */
	private String pckgCmndYmd;

	/**
	 * 설비코드
	 */
	private String fcltCd;

	/**
	 * 거래처코드
	 */
	private String cnptCd;

	/**
	 * 거래처명
	 */
	private String cnptNm;

	/**
	 * 납기일자
	 */
	private String dudtYmd;

	/**
	 * 품목코드
	 */
	private String itemCd;

	/**
	 * 품종코드
	 */
	private String vrtyCd;

	/**
	 * 규격코드
	 */
	private String spcfctCd;

	/**
	 * 발주수량
	 */
	private int ordrQntt;

	/**
	 * 발주중량
	 */
	private double ordrWght;

	/**
	 * 입수
	 */
	private int bxGdsQntt;

	/**
	 * 지시수량
	 */
	private int cmndQntt;

	/**
	 * 지시중량
	 */
	private double cmndWght;

	/**
	 * 발주번호
	 */
	private String ordrNo;

	/**
	 * 상품코드
	 */
	private String gdsCd;

	/**
	 * 상품명
	 */
	private String gdsNm;

	/**
	 * 비고
	 */
	private String rmrk;
}
