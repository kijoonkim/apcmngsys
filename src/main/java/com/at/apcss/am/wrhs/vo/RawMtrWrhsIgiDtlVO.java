package com.at.apcss.am.wrhs.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : WrhsMngVO.java
 * @Description : 입고에 대한 VO 클래스
 * @author 김호
 * @since 2025.07.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.07.10  김호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class RawMtrWrhsIgiDtlVO extends RawMtrWrhsIgiVO {


	/**
	* 검수등급코드
	* */
	private String igiGrdCd;
	/**
	 * 검수등급수량
	 * */
	private int igiGrdQntt;
	/**
	 * 검수등급비율
	 * */
	private int igiGrdRt;
}
