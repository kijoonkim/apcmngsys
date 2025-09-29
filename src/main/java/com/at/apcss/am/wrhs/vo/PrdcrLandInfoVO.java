package com.at.apcss.am.wrhs.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
/**
 * @Class Name : PrdcrLandInfoVO.java
 * @Description : 생산자농지정보 대한 VO 클래스
 * @author 김  호
 * @since 2024.07.31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.31  김  호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class PrdcrLandInfoVO extends ComVO {
	/*
	 * 생산자코드
	 * */
	private String prdcrCd;
	private String prdcrNm;
	/*
	 * APC코드
	 * */
	private String apcCd;
	/*
	 * 품목코드
	 * */
	private String itemCd;
	private String itemNm;
	/*
	 * 생산자농지정보번호
	 * */
	private String prdcrLandInfoNo;
	/*
	 * 농지주소
	 * */
	private String frlnAddr;
	/*
	 * 법정동코드
	 * */
	private String stdgCd;
	/*
	 * 농지본번
	 * */
	private int frlnMno;
	/*
	 * 농지부번
	 * */
	private int frlnSno;
	/*
	 * 계약면적
	 * */
	private int crtrArea;
	private int ctrtar;
	/*
	 * 정식면적
	 * */
	private int plntngArea;

	/*
	 * 경영체등록번호
	 * */
	private String mngmstRegno;
	/*
	 * 농업인번호
	 * */
	private String frmerno;
	/*
	 * 연도
	 * */
	private String yr;


}
