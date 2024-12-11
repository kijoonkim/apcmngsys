package com.at.apcss.am.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
public class FcltVO extends ComVO {

	/*
	 * APC코드
	 * */
	private String apcCd;

	/*
	 * 창고
	 * */
	private String warehouseSeCd;
	private String warehouseSeNm;

	/*
	 * 저장위치
	 * */
	private String strgLoctnCd;
	private String strgLoctnCol;
	private String strgLoctnRow;

	/*
	 * 생산자
	 * */
	private String prdcrCd;
	private String prdcrNm;
	private String aaPrdcrNm;
	private String bbPrdcrNm;
	private String ccPrdcrNm;
	private String ddPrdcrNm;
	private String eePrdcrNm;
	private String ffPrdcrNm;

	/*
	 * 입고일자
	 * */
	private String wrhsYmd;
	private String aaWrhsYmd;
	private String bbWrhsYmd;
	private String ccWrhsYmd;
	private String ddWrhsYmd;
	private String eeWrhsYmd;
	private String ffWrhsYmd;

	/*
	 * 수량
	 * */
	private int invntrQntt;
	private int aaQntt;
	private int bbQntt;
	private int ccQntt;
	private int ddQntt;
	private int eeQntt;
	private int ffQntt;

	/*
	 * 합계
	 * */
	private int aaSum;
	private int bbSum;
	private int ccSum;
	private int ddSum;
	private int eeSum;
	private int ffSum;

	/*
	 * 중량
	 * */
	private double invntrWght;
	private double aaWght;
	private double bbWght;
	private double ccWght;
	private double ddWght;
	private double eeWght;
	private double ffWght;


}
