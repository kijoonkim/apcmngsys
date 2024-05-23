package com.at.apcss.am.spmt.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SpmtPrfmncVO.java
 * @Description : 출고실적에 대한 VO 클래스
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
public class SpmtGdsVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	private String pckgno;
	private String pckgSn;
	
	private int spmtQntt;
	private double spmtWght;
}
