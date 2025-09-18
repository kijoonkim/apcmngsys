package com.at.apcss.am.cmns.vo;


import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : CnptSpmtPckgUnitVO.java
 * @Description : 거래처 출하상품정보에 대한 VO 클래스
 * @author 김은총
 * @since 2025.09.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.09.01  김은총        최초 생성
 * </pre>
 */

@Getter
@Setter
public class CnptSpmtPckgUnitVO extends CnptVO{

	/**
	 * 품목코드
	 */
	private String itemCd;
	/**
	 * 품목명
	 */
	private String itemNm;
	/**
	 * 품종코드
	 */
	private String vrtyCd;
	/**
	 * 품종명
	 */
	private String vrtyNm;
	/**
	 * 출하포장단위코드
	 */
	private String spmtPckgUnitCd;
	/**
	 * 출하포장단위명
	 */
	private String spmtPckgUnitNm;
	/**
	 * 규격코드
	 * */
	private String spcfctCd;
	/**
	 * 규격명
	 * */
	private String spcfctNm;
}
