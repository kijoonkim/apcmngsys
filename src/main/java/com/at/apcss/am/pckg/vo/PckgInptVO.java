package com.at.apcss.am.pckg.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : PckgInptVO.java
 * @Description : 포장투입에 대한 VO 클래스
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
public class PckgInptVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 선별번호
	 */
	private String sortno;

	/**
	 * 선별순번
	 */
	private int sortSn;

	/**
	 * 투입순번
	 */
	private int inptSn;

	/**
	 * 등급코드
	 */
	private String grdCd;
	private String grdNm;

	/**
	 * 투입일자
	 */
	private String inptYmd;

	/**
	 * 설비코드
	 */
	private String fcltCd;
	private String fcltNm;

	/**
	 * 대표생산자코드
	 */
	private String rprsPrdcrCd;
	private String rprsPrdcrNm;

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
	 * 규격코드
	 */
	private String spcfctCd;
	private String spcfctNm;

	/**
	 * 수량
	 */
	private int qntt;

	/**
	 * 중량
	 */
	private double wght;

	/**
	 * 포장번호
	 */
	private String pckgno;

	/**
	 * 포장지시번호
	 */
	private String pckgCmndno;

	/**
	 * 비고
	 */
	private String rmrk;

	/**
	 * 창고코드
	 */
	private String warehouseSeCd;
	/**
	 * 창고명
	 */
	private String warehouseSeNm;

	private String pckgCmptnYn;

}
