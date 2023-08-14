package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : DdlnVO.java
 * @Description : 마감 정보에 대한 VO 클래스
 * @author 하민우
 * @since 2023.08.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.10  하민우        최초 생성
 * </pre>
 */
@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
public class DdlnVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * 기준연도
	 */
	private String crtrYr;
	/**
	 * 기준월
	 */
	private String crtrMm;
	/**
	 * 마감여부
	 */
	private String ddlnYn;
	/**
	 * 등록일시
	 */
	private String regDt;
}
