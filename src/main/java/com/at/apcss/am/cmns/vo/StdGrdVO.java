package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

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
public class StdGrdVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	/*
	 * 품목코드
	 * */
	private String itemCd;
	private String itemNm;
	
	private String vrtyCd;
	private String vrtyNm;
	/*
	 * 등급구분코드
	 * */
	private String grdSeCd;
	private String grdSeNm;
	/*
	 * 등급종류
	 * */
	private String grdKnd;
	/*
	 * 등급종류명
	 * */
	private String grdKndNm;
	/*
	 * 가산비율
	 */
	private int adtnRt;
	/*
	 * 순번
	 * */
	private int sn;

	/**
	 * 표준등급유형
	 */
	private String stdGrdType;

	/**
	 * 등록 수
	 */
	private int cnt;
	/**
	 * 삭제 불가능 사유
	 */
	private String delible;
}
