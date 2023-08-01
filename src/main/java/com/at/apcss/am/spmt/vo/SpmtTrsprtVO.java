package com.at.apcss.am.spmt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
/**
 * @Class Name : SpmtTrsprtVO.java
 * @Description : 출하운송회사정보 대한 VO 클래스
 * @author 김호
 * @since 2023.07.13
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.13  김호        최초 생성
 * </pre>
 */
@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
public class SpmtTrsprtVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 운송회사코드
	 */
	private String trsprtCoCd;

	/**
	 * 운송회사명
	 */
	private String trsprtCoNm;

	/**
	 * 전화번호
	 */
	private String telno;

	/**
	 * FAX번호
	 */
	private String fxno;

	/**
	 * 비고
	 */
	private String rmrk;

}
