package com.at.apcss.am.wgh.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : WghPrfmncVO.java
 * @Description : 계량실적에 대한 VO 클래스
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
public class WghPrfmncVO extends ComVO {
	
	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 계량번호
	 */
	private String wghNo;

	/**
	 * 계량일자
	 */
	private String wghYmd;

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
	 * 차량번호
	 */
	private String vhclNo;

	/**
	 * 전체중량
	 */
	private double wholWght;

	/**
	 * 공차중량
	 */
	private double emptVhclWght;

	/**
	 * 감량율
	 */
	private double rdcdRt;

	/**
	 * 감량
	 */
	private double rdcdWght;

	/**
	 * 입고중량
	 */
	private double wrhsWght;

	/**
	 * 육안등급1
	 */
	private String otrdEyeGrd1;

	/**
	 * 육안등급2
	 */
	private String otrdEyeGrd2;

	/**
	 * 육안등급3
	 */
	private String otrdEyeGrd3;

	/**
	 * 육안등급4
	 */
	private String otrdEyeGrd4;

	/**
	 * 육안등급5
	 */
	private String otrdEyeGrd5;

	/**
	 * 비고
	 */
	private String rmrk;

	/**
	 * 계량순번
	 */
	private int wghSeqNo;

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
