package com.at.apcss.am.trnsf.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : InvntrTrnsfVO.java
 * @Description : 재고이송에 대한 VO 클래스
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
public class InvntrTrnsfVO extends ComVO {
	
	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 이송일자
	 */
	private String trnsfYmd;

	/**
	 * 이송순번
	 */
	private int trnsfSeqNo;

	/**
	 * 재고구분코드
	 */
	private String invntrSeCd;

	/**
	 * 이송APC코드
	 */
	private String trnsfApcCd;

	/**
	 * 입고번호
	 */
	private String wrhsNo;

	/**
	 * 선별번호
	 */
	private String sortNo;

	/**
	 * 등급코드
	 */
	private String grdCd;

	/**
	 * 포장번호
	 */
	private String pckgNo;

	/**
	 * 포장순번
	 */
	private int pckgSeqNo;

	/**
	 * 이송수량
	 */
	private int trnsfQntt;

	/**
	 * 이송중량
	 */
	private double trnsfWght;
}
