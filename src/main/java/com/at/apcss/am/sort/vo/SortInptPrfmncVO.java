package com.at.apcss.am.sort.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SortInptPrfmncVO.java
 * @Description : 선별투입실적정보에 대한 VO 클래스
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
public class SortInptPrfmncVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 입고번호
	 */
	private String wrhsno;

	/**
	 * 투입순번
	 */
	private int inptSn;

	/**
	 * 투입일자
	 */
	private String inptYmd;

	/**
	 * 품목코드
	 */
	private String itemCd;

	/**
	 * 품종코드
	 */
	private String vrtyCd;

	/**
	 * 생산자코드
	 */
	private String prdcrCd;

	/**
	 * 수량
	 */
	private int qntt;

	/**
	 * 중량
	 */
	private double wght;

	/**
	 * 선별번호
	 */
	private String sortno;

	/**
	 * 선별지시번호
	 */
	private String sortCmndno;

	/**
	 * 비고
	 */
	private String rmrk;
}
