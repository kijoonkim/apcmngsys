package com.at.apcss.am.invntr.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SortInvntrVO.java
 * @Description : 선별재고정보에 대한 VO 클래스
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
public class SortInvntrVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 선별번호
	 */
	private String sortno;

	/**
	 * 등급코드
	 */
	private String grdCd;

	/**
	 * 등급명
	 */
	private String grdNm;

	/**
	 * 투입일자
	 */
	private String inptYmd;

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
	 * 선별수량
	 */
	private int sortQntt;

	/**
	 * 선별중량
	 */
	private double sortWght;

	/**
	 * 포장수량
	 */
	private int pckgQntt;

	/**
	 * 포장중량
	 */
	private double pckgWght;

	/**
	 * 재고수량
	 */
	private int invntrQntt;

	/**
	 * 재고중량
	 */
	private double invntrWght;

	/**
	 * 투입수량
	 */
	private int inptQntt;
	/**
	 * 투입중량
	 */
	private double inptWght;

	/**
	 * 수량
	 */
	private int qntt;
	/**
	 * 중량
	 */
	private double wght;
	
	/*선별번호*/
	private String wghno;
	/*투입일자*/
	private String wghYmd;
	/*설비*/
	private String fcltNm;
	/*생산자*/
	private String prdcrCd;
	private String prdcrNm;
	/*품목*/
	private String itemNm;
	/*품종*/
	private String vrtyNm;
	/*규격*/
	private String spcfctNm;
	/*창고*/
	private String warehouseSeNm;

}
