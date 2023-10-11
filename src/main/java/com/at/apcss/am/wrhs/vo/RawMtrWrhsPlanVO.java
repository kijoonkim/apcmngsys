package com.at.apcss.am.wrhs.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : RawMtrWrhsPlanVO.java
 * @Description : 원물입고계획등록  대한 VO 클래스
 * @author 김호
 * @since 2023.08.08
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.08     김호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class RawMtrWrhsPlanVO extends ComVO{
	/*
	 * APC코드
	 * */
	private String apcCd;
	/*
	 * 계획번호
	 * */
	private String planno;
	/*
	 * 계획시작일자
	 * */
	private String planYmdFrom;
	/*
	 * 계획종료일자
	 * */
	private String planYmdTo;
	/*
	 * 계획일자
	 * */
	private String planYmd;
	/*
	 * 계획시간
	 * */
	private String planHr;
	/*
	 * 생산자코드
	 * */
	private String prdcrCd;
	/*
	 * 생산자명
	 * */
	private String prdcrNm;
	/*
	 * 품목코드
	 * */
	private String itemCd;
	/*
	 * 품목명
	 * */
	private String itemNm;
	/*
	 * 품종코드
	 * */
	private String vrtyCd;
	/*
	 * 품종명
	 * */
	private String vrtyNM;
	/*
	 * 상품구분코드
	 * */
	private String gdsSeCd;
	/*
	 * 상품구분명
	 * */
	private String gdsSeNM;
	/*
	 * 입고구분코드
	 * */
	private String wrhsSeCd;
	/*
	 * 입고구분명
	 * */
	private String wrhsSeNM;
	/*
	 * 운송구분코드
	 * */
	private String trsprtSeCd;
	/*
	 * 운송구분명
	 * */
	private String trsprtSeNM;
	/*
	 * 창고구분코드
	 * */
	private String warehouseSeCd;
	/*
	 * 창고구분명
	 * */
	private String warehouseSeNM;
	/*
	 * 계획수량
	 * */
	private String planQntt;
	/*
	 * 계획중량
	 * */
	private String planWght;

	/*
	 * 비고
	 * */
	private String rmrk;

}
