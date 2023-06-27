package com.at.apcss.am.whrs.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : RawMtrWrhsPlanVO.java
 * @Description : 원물입고 계획에 대한 VO 클래스
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
public class RawMtrWrhsPlanVO extends ComVO {
	
	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 원물입고계획번호
	 */
	private String rawMtrWrhsPlanNo;

	/**
	 * 계획일자
	 */
	private String planYmd;

	/**
	 * 계획시간
	 */
	private String planHr;

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
	 * 창고구분코드
	 */
	private String warehouseSeCd;

	/**
	 * 계획수량
	 */
	private String planQntt;

	/**
	 * 계획중량
	 */
	private String planWght;

	/**
	 * 비고
	 */
	private String rmrk;
}
