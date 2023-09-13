package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : CmnsGdsVO.java
 * @Description : 상품정보에 대한 VO 클래스
 * @author 하민우
 * @since 2023.09.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.11  하민우        최초 생성
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
	 * 품목명
	 */
	private String itemNm;
	/**
	 * 품종코드
	 */
	private String vrtyCd;
	/**
	 * 품종명
	 */
	private String vrtyNm;
	/**
	 * 규격코드
	 */
	private String spcfctCd;
	/**
	 * 규격명
	 */
	private String spcfctNm;
	/**
	 * 상품등급
	 */
	private String gdsGrd;
	/**
	 * 상품등급명
	 */
	private String gdsGrdNm;
	/**
	 * 브랜드코드
	 */
	private String brndCd;
	/**
	 * 브랜드명
	 */
	private String brndNm;
	/**
	 * 산지코드
	 */
	private String plorCd;
	/**
	 * 산지명
	 */
	private String plorNm;
	/**
	 * 포장단위코드
	 */
	private String spmtPckgUnitCd;
	/**
	 * 포장단위명
	 */
	private String spmtPckgUnitNm;
	/**
	 * 입수
	 */
	private int bxGdsQntt;
	/**
	 * 중량
	 */
	private double wght;
}
