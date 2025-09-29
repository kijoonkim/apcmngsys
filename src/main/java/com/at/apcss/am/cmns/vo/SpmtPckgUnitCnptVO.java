package com.at.apcss.am.cmns.vo;


import lombok.Getter;
import lombok.Setter;
/**
 * @Class Name : SpmtPckgUnitCnptVO.java
 * @Description : 출하상품거래처정보에 대한 VO 클래스
 * @author 김은총
 * @since 2025.09.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.09.01  김은총      최초 생성
 * </pre>
 */
@Getter
@Setter
public class SpmtPckgUnitCnptVO extends SpmtPckgUnitVO{
	/**
	 * 사용여부
	 */
	private String useYn;
	/**
	 * 거래처코드
	 */
	private String cnptCd;
	/**
	 * 비고
	 */
	private String rmrk;
}
