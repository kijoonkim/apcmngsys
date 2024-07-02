package com.at.apcss.am.wrhs.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
/**
 * @Class Name : CltvtnHstryVO.java
 * @Description : 재배이력에 대한 VO 클래스
 * @author 김  호
 * @since 2024.06.25
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.06.25  김  호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class CltvtnHstryVO extends ComVO {

	/*
	 * APC코드
	 * */
	private String apcCd;
	/*
	 * 생산자코드
	 * */
	private String prdcrCd;
	/*
	 * 경영체등록번호
	 * */
	private String mngmstRegno;

	/*
	 * 농지정보순번
	 * */
	private String farmLandSn;
	/*
	 * 농지주소
	 * */
	private String frlnAddr;
	/*
	 * 법정도코드
	 * */
	private String stdgCd;
	/*
	 * 본번
	 * */
	private String frlnMno;
	/*
	 * 부번
	 * */
	private String frlnSno;
	/*
	 * 내용
	 * */
	private String cn;
	/*
	 * 비고
	 * */
	private String rmrk;

	/*
	 * 재배이력번호
	 * */
	private String cltvtnHstryNo;
}
