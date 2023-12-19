package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : PrdcrDtlVO.java
 * @Description : 생산자 정보에 대한 VO 클래스
 * @author 하민우
 * @since 2023.12.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.12.11  하민우        최초 생성
 * </pre>
 */
@Getter
@Setter
public class PrdcrDtlVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * 생산자코드
	 */
	private String prdcrCd;
	/**
	 * 생산자명
	 */
	private String prdcrNm;
	/**
	 * 등록일자
	 */
	private String regYmd;
	/**
	 * 순번
	 */
	private String sn;
	/**
	 * 재배면적
	 */
	private double cltvtnSfc;
	/**
	 * 계약면적
	 */
	private double ctrtArea;
	/**
	 * 품종1
	 */
	private String vrtyCd1;
	/**
	 * 품종2
	 */
	private String vrtyCd2;
	/**
	 * 품종3
	 */
	private String vrtyCd3;
	/**
	 * 품종4
	 */
	private String vrtyCd4;
	/**
	 * 품종5
	 */
	private String vrtyCd5;
	/**
	 * 비고
	 */
	private String rmrk;
	/**
	 * 농가명
	 */
	private String frmhsNm;
	/**
	 * 농가 전화번호
	 */
	private String frmhsTelno;
	/**
	 * 농가 지역코드
	 */
	private String frmhsCtpv;
	/**
	 * 농가 주소
	 */
	private String frmhsAddr;
}
