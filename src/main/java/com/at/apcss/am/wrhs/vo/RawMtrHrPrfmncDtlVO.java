package com.at.apcss.am.wrhs.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : RawMtrHrDtlVO.java
 * @Description : 원물입고시간실적상세에 대한 VO 클래스
 * @author 김호
 * @since 2025.08.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.08.21  김호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class RawMtrHrPrfmncDtlVO extends RawMtrHrPrfmncComVO {

	/**
	 * 상세코드
	 * */
	private String dtlCd;
	private String dtlNm;

	/**
	 * 입고시간
	 * */
	private String wrhsHm1;
	private String wrhsHm2;
	private String wrhsHm3;
	private String wrhsHm4;
	private String wrhsHm5;
	private String wrhsHm6;
	private String wrhsHm7;
	private String wrhsHm8;
	private String wrhsHm9;
	private String wrhsHm10;

	/**
	 * 수량
	 * */
	private int qntt;
	private int qntt1;
	private int qntt2;
	private int wrhsHmQntt1;
	private int wrhsHmQntt2;
	private int wrhsHmQntt3;
	private int wrhsHmQntt4;
	private int wrhsHmQntt5;
	private int wrhsHmQntt6;
	private int wrhsHmQntt7;
	private int wrhsHmQntt8;
	private int wrhsHmQntt9;
	private int wrhsHmQntt10;

	/**
	 * 중량
	 * */
	private double wght;
	private double wght1;
	private double wght2;
	private double wrhsHmWght1;
	private double wrhsHmWght2;
	private double wrhsHmWght3;
	private double wrhsHmWght4;
	private double wrhsHmWght5;
	private double wrhsHmWght6;
	private double wrhsHmWght7;
	private double wrhsHmWght8;
	private double wrhsHmWght9;
	private double wrhsHmWght10;

}

