package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : PrdcrVO.java
 * @Description : 생산자 정보에 대한 VO 클래스
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
public class PrdcrVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * 생산자코드
	 */
	private String prdcrCd;
	/**
	 * 생산자명
	 */
	private String prdcrNm;
	/**
	 * 생산자초성
	 */
	private String prdcrFrstNm;
	/**
	 * 대표품목코드
	 */
	private String rprsItemCd;
	/**
	 * 대표품종코드
	 */
	private String rprsVrtyCd;
	/**
	 * 상품구분코드
	 */
	private String gdsSeCd;
	/**
	 * 입고구분코드
	 */
	private String wrhsSeCd;
	/**
	 * 운송구분코드
	 */
	private String trsprtSeCd;
	/**
	 * 차량번호
	 */
	private String vhclNo;
	/**
	 * 비고
	 */
	private String rmrk;

	/**
	 * 정산기준
	 */
	private String clclnCrtr;
}
