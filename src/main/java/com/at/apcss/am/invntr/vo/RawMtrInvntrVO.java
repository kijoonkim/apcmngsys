package com.at.apcss.am.invntr.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : RawMtrInvntrVO.java
 * @Description : 원물재고정보에 대한 VO 클래스
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
public class RawMtrInvntrVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 입고번호
	 */
	private String wrhsno;

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
	 * 등급코드
	 */
	private String grdCd;
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
	private String trsptSeCd;

	/**
	 * 창고구분코드
	 */
	private String warehouseSeCd;

	/**
	 * 박스종류
	 */
	private String bxKnd;

	/**
	 * 입고수량
	 */
	private int wrhsQntt;

	/**
	 * 입고중량
	 */
	private double wrhsWght;

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
	 * 운송구분
	 */
	private String trsprtSeCd;

	/**
	 * apc명
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
	 * 상품구분명
	 */
	private String gdsSeNm;

	/**
	 * 입고구분명
	 */
	private String wrhsSeNm;

	/**
	 * 창고구분명
	 */
	private String warehouseSeNm;
	/**
	 * 운송구분명
	 */
	private String trsprtSeNm;

	/**
	 * 박스종류명
	 */
	private String bxKndNm;

	/**
	 * 등급명
	 */
	private String grdNm;

	/**
	 * 선별지시번호
	 */
	private String sortCmndno;

	/**
	 * 지시수량
	 */
	private int cmndQntt;

	/**
	 * 지시중량
	 */
	private double cmndWght;

}
