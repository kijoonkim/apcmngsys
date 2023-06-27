package com.at.apcss.am.spmt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SpmtCmndVO.java
 * @Description : 출고지시에 대한 VO 클래스
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
public class SpmtCmndVO extends ComVO {
	
	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 출하지시번호
	 */
	private String spmtCmndNo;

	/**
	 * 출하지시순번
	 */
	private String spmtCmndSeqNo;

	/**
	 * 지시일자
	 */
	private String cmndYmd;

	/**
	 * 거래처코드
	 */
	private String cnptCd;

	/**
	 * 배송지
	 */
	private String dldtn;

	/**
	 * 운송회사코드
	 */
	private String trsprtCoCd;

	/**
	 * 운송회사명
	 */
	private String trsprtCoNm;

	/**
	 * 상품등급
	 */
	private String gdsGrd;

	/**
	 * 지시수량
	 */
	private String cmndQntt;

	/**
	 * 지시중량
	 */
	private String cmndWght;

	/**
	 * 포장구분코드
	 */
	private String pkcgSeCd;

	/**
	 * 발주번호
	 */
	private String ordrNo;

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
