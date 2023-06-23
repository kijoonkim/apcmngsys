package com.at.apcss.am.cmns.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : CmnsVrtyVO.java
 * @Description : 품종정보에 대한 VO 클래스
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
public class CmnsVrtyVO extends CmnsItemVO {
	
	/**
	 * 품종코드
	 */
	private String vrtyCd;
	/**
	 * 품종명
	 */
	private String vrtyNm;
}
