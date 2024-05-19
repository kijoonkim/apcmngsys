package com.at.apcss.am.cmns.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : JgmtGrdVO.java
 * @Description : 등급정보에 대한 VO 클래스
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
public class StdGrdDtlVO extends StdGrdVO {

	private String itemGrdCd;
	
	private String itemGrdNm;
	
	/*
	 * 등급코드
	 * */
	private String grdCd;
	/*
	 * 등급명
	 * */
	private String grdNm;
	/*
	 * 등급값
	 * */
	private int grdVl;
	/*
	 * 순서
	 * */
	private int sn;

	/**
	 * 이후등급종류
	 */
	private String aftrGrdKnd;
	
	/**
	 * 이후등급코드
	 */
	private String aftrGrdCd;
	
	/**
	 * 연계등급코드
	 */
	private String linkGrdCd;
	
	private String mngType;
	/**
	 * 등급연계코드
	 */
	private String extrnlLnkgCd;
	/**
	 * 표시항목
	 */
	private String invntrInqAuCd;
}
