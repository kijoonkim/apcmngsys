package com.at.apcss.am.sort.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : WrhsSortGrdVO.java
 * @Description : 육안선별(현장용)에 대한 VO 클래스
 * @author 김  호
 * @since 2024.05.14
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.05.14  김  호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class WrhsSortGrdVO extends ComVO {
	/*
	 * APC코드
	 * */
	private String apcCd;
	/*
	 * 사전입고번호
	 * */
	private String bffaWrhsno;
	/*
	 * 품목코드
	 * */
	private String itemCd;
	/*
	 * 등급종류
	 * */
	private String grdKnd;
	/*
	 * 등급코드
	 * */
	private String grdCd;
	/*
	 * 등급수지
	 * */
	private String grdNv;
	/*
	 * 수량
	 * */
	private int grdQntt;
	/*
	 * 중량
	 * */
	private Double grdWght;
}
