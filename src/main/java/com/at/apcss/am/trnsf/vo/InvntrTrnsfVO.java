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
	private String apcNm;

	/**
	 * 이송일자
	 */
	private String trnsfYmd;
	private String trnsfYmdFrom;
	private String trnsfYmdTo;

	/**
	 * 이송순번
	 */
	private int trnsfSn;

	/**
	 * 재고구분코드
	 */
	private String invntrSeCd;
	private String invntrSeNm;

	/**
	 * 이송APC코드
	 */
	private String trnsfApcCd;
	private String trnsfApcNm;

	/**
	 * 입고번호
	 */
	private String wrhsno;

	/**
	 * 선별번호
	 */
	private String sortno;
	/**
	 * 선별순번
	 */
	private int sortSn;

	/**
	 * 등급코드
	 */
	private String grdCd;
	private String grdNm;

	/**
	 * 포장번호
	 */
	private String pckgno;

	/**
	 * 포장순번
	 */
	private int pckgSn;
	/**
	 * 확정여부
	 */
	private String cfmtnYn;

	/**
	 * 이송수량
	 */
	private int trnsfQntt;

	/**
	 * 이송중량
	 */
	private double trnsfWght;
	/**
	 * 재고수량
	 */
	private int invntrQntt;

	/**
	 * 재고중량
	 */
	private double invntrWght;

	/*
	 * 입고일자
	 * */
	private String wrhsYmd;

	/*
	 * 품목코드
	 * */
	private String itemCd;
	private String itemNm;
	/*
	 * 품종코드
	 * */
	private String vrtyCd;
	private String vrtyNm;
	/*
	 * 규격코드
	 * */
	private String spcfctCd;
	private String spcfctNm;
	/*
	 * 생산자코드
	 * */
	private String prdcrCd;
	private String prdcrNm;
	/*
	 * 상품구분코드
	 * */
	private String gdsSeCd;
	private String gdsSeNm;
	/*
	 * 입고구분코드
	 * */
	private String wrhsSeCd;
	private String wrhsSeNm;
	/*
	 * 운송코드
	 * */
	private String trsprtSeCd;
	private String trsprtSeNm;
	/*
	 * 창고코드
	 * */
	private String warehouseSeCd;
	private String warehouseSeNm;
	/*
	 * 확정여부
	 * */
	private String cfmtnCd;
	private String cfmtnNm;

	private String prcsno;
	private int prcsSn;

}
