package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : CmnsGdsVO.java
 * @Description : 상품정보에 대한 VO 클래스
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
public class CmnsGdsVO extends ComVO {
	
	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * 상품코드
	 */
	private String gdsCd;
	/**
	 * 상품명
	 */
	private String gdsNm;
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
	 * 상품등급
	 */
	private String gdsGrd;
	/**
	 * 브랜드코드
	 */
	private String brndCd;
	/**
	 * 산지코드
	 */
	private String plorCd;
	/**
	 * 포장구분코드
	 */
	private String pckgSeCd;
	/**
	 * 입수
	 */
	private int bxGdsQntt;
	/**
	 * 중량
	 */
	private int wght;

}
