package com.at.apcss.am.wgh.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : WghPrfmncDtlVO.java
 * @Description : 계량실적상세에 대한 VO 클래스
 * @author 신정철
 * @since 2023.07.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class WghPrfmncDtlVO extends ComVO {
	
	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 계량번호
	 */
	private String wghno;

	/**
	 * 계량순번
	 */
	private int wghSn;

	/**
	 * 등급코드
	 */
	private String grdCd;
	
	/**
	 * 팔레트박스구분코드
	 */
	private String pltBxSeCd;

	/**
	 * 팔레트종류
	 */
	private String pltKnd;

	/**
	 * 박스종류
	 */
	private String bxKnd;

	/**
	 * 단중
	 */
	private double unitWght;

	/**
	 * 수량
	 */
	private int qntt;

	/**
	 * 중량
	 */
	private double wght;
}
