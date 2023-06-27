package com.at.apcss.am.sort.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SortCmndVO.java
 * @Description : 선별지시정보에 대한 VO 클래스
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
public class SortCmndVO extends ComVO {
	
	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * APC구분코드
	 */
	private String apcSeCd;

	/**
	 * 선별지시번호
	 */
	private String sortCmndNo;

	/**
	 * 선별지시순번
	 */
	private String sortCmndSeqNo;

	/**
	 * 선별지시일자
	 */
	private String sortCmndYmd;

	/**
	 * 설비코드
	 */
	private String fcltCd;

	/**
	 * 창고구분코드
	 */
	private String warehouseSeCd;

	/**
	 * 팔레트번호
	 */
	private String pltNo;

	/**
	 * 생산자코드
	 */
	private String prdcrCd;

	/**
	 * 생산자명
	 */
	private String prdcrNm;

	/**
	 * 품목코드
	 */
	private String itemCd;

	/**
	 * 품종코드
	 */
	private String vrtyCd;

	/**
	 * 지시수량
	 */
	private int cmndQntt;

	/**
	 * 지시중량
	 */
	private double cmndWght;

	/**
	 * 비고
	 */
	private String rmrk;
}
