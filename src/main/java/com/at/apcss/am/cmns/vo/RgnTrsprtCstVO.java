package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : RgnTrsprtCstVO.java
 * @Description : 지역별 운임비 정보에 대한 VO 클래스
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
public class RgnTrsprtCstVO extends ComVO {
	
	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * 운송지역코드
	 */
	private String trsprtRgnCd;
	/**
	 * 운송지역명
	 */
	private String trsprtRgnNm;
	/**
	 * 운임비용
	 */
	private String trsprtCst;
	/**
	 * 비고
	 */
	private String rmrk;
}
