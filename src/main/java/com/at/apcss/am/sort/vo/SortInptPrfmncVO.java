package com.at.apcss.am.sort.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SortInptPrfmncVO.java
 * @Description : 선별투입실적정보에 대한 VO 클래스
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
public class SortInptPrfmncVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 입고번호
	 */
	private String wrhsno;

	/**
	 * 팔레트 번호
	 */
	private String pltno;
	
	/**
	 * 입고일자
	 */
	private String wrhsYmd;
	
	/**
	 * 투입순번
	 */
	private int inptSn;

	/**
	 * 투입일자
	 */
	private String inptYmd;

	/**
	 * 품목코드
	 */
	private String itemCd;

	private String itemNm;
	/**
	 * 품종코드
	 */
	private String vrtyCd;
	private String vrtyNm;

	/**
	 * 생산자코드
	 */
	private String prdcrCd;
	private String prdcrNm;

	/**
	 * 수량
	 */
	private int qntt;

	/**
	 * 중량
	 */
	private double wght;

	/**
	 * 선별번호
	 */
	private String sortno;

	/**
	 * 선별지시번호
	 */
	private String sortCmndno;

	/**
	 * 비고
	 */
	private String rmrk;
	
	/**
	 * 설비코드
	 */
	private String fcltCd;
	private String fcltNm;
	
	/**
	 * 박스종류
	 */
	private String bxKnd;	
	private String bxKndNm;
	
	/**
	 * 선별완료유무
	 */
	private String sortCmptnYn;
	
	/**
	 * 창고코드
	 */
	private String warehouseSeCd;
	/**
	 * 창고명
	 */
	private String warehouseSeNm;
	
	/**
	 * 등급코드
	 */
	private String grdCd;
	private String grdNm;
	
}
