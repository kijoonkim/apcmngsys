package com.at.apcss.am.trnsf.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : RawMtrStdGrdVO.java
 * @Description : 재고 표준등급에 대한 VO 클래스
 * @author 신정철
 * @since 2023.09.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class RawMtrStdGrdVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * 등급구분코드
	 */
	private String grdSeCd;
	/**
	 * 품목코드
	 */
	private String itemCd;
	/**
	 * 입고번호
	 */
	private String wrhsno;
	/**
	 * 등급종류
	 */
	private String grdKnd;
	/**
	 * 등급종류명
	 */
	private String grdKndNm;
	/**
	 * 등급코드
	 */
	private String grdCd;
	/**
	 * 등급코드
	 */
	private String grdNm;

	/**
	 * 순번
	 */
	private int sn;

}
