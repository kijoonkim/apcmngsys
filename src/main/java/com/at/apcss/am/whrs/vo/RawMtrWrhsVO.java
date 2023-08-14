package com.at.apcss.am.whrs.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : RawMtrWrhsVO.java
 * @Description : 원물입고에 대한 VO 클래스
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
public class RawMtrWrhsVO extends ComVO {
	
	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 입고번호
	 */
	private String wrhsno;

	/**
	 * 계량번호
	 */
	private String wghno;

	/**
	 * 팔레트번호
	 */
	private String pltno;

	/**
	 * 입고일자
	 */
	private String wrhsYmd;
	private String wrhsYmdFrom;
	private String wrhsYmdTo;
	
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
	 * 박스종류
	 */
	private String bxKnd;

	/**
	 * 박스수량
	 */
	private int bxQntt;

	/**
	 * 입고중량
	 */
	private double wrhsWght;
	
	/**
	 * 비고
	 */
	private String rmrk;

	/**
	 * 총중량
	 */
	private double wholWght;

	/**
	 * 공차중량
	 */
	private double emptVhclWght;
	
	/**
	 * 차량번호
	 */
	private String vhclno;

	/**
	 * 등급
	 */
	private String grdCd;
	/**
	 * 입고수량
	 */
	private int wrhsQntt;
	/**
	 * 투입수량
	 */
	private int inptQntt;
	/**
	 * 투입중량
	 */
	private double inptWght;
	/**
	 * 재고수량
	 */
	private int invntrQntt;
	/**
	 * 재고중량
	 */
	private double invntrWght;
	
	/**
	 * APC명
	 */
	private String apcNm;
	
	/**
	 * 품목명
	 */
	private String itemNm;
	
	/**
	 * 품종명
	 */
	private String vrtyNm;
	
	/**
	 * 등급명
	 */
	private String grdNm;
	
	/**
	 * 창고명
	 */
	private String warehouseSeNm;
	
	/**
	 * 박스종류명
	 */
	private String bxKndNm;
	
	/**
	 * 상품구분명
	 */
	private String gdsSeNm;
	
	/**
	 * 입고구분명
	 */
	private String wrhsSeNm;
	
	/**
	 * 운송구분명
	 */
	private String trsprtSeNm;
}
