package com.at.apcss.am.invntr.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : GdsInvntrVO.java
 * @Description : 상품재고정보에 대한 VO 클래스
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
public class GdsInvntrVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 포장번호
	 */
	private String pckgno;

	/**
	 * 포장순번
	 */
	private int pckgSn;

	/**
	 * 포장일자
	 */
	private String pckgYmd;

	/**
	 * 설비코드
	 */
	private String fcltCd;

	/**
	 * 대표생산자코드
	 */
	private String rprsPrdcrCd;

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
	 * 포장구분코드
	 */
	private String pckgSeCd;

	/**
	 * 창고구분코드
	 */
	private String warehouseSeCd;

	/**
	 * 포장수량
	 */
	private int pckgQntt;

	/**
	 * 포장중량
	 */
	private double pckgWght;

	/**
	 * 출하수량
	 */
	private int spmtQntt;

	/**
	 * 출하중량
	 */
	private double spmtWght;

	/**
	 * 재고수량
	 */
	private int invntrQntt;

	/**
	 * 재고중량
	 */
	private double invntrWght;
}
