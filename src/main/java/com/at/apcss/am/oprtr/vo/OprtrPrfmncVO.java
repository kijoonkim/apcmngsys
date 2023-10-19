package com.at.apcss.am.oprtr.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : OprtrPrfmncVO.java
 * @Description : 작업자실적등록 프로그램에 대한 VO 클래스
 * @author 김호
 * @since 2023.10.17
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.17      김호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class OprtrPrfmncVO extends ComVO{

	/*
	 * APC코드
	 * */
	private String apcCd;
	/*
	 * 포장번호
	 * */
	private String pckgno;
	/*
	 * 선별번호
	 * */
	private String sortno;
	/*
	 * 실적순번
	 * */
	private int prfmncSn;
	/*
	 * 생년월일
	 * */
	private String brdt;
	/*
	 * 성명
	 * */
	private String flnm;
	/*
	 * 작업일자
	 * */
	private String jobYmd;

	/*
	 * 작업시작시간
	 * */
	private String jobBgngHr;

	/*
	 * 작업종료시간
	 * */
	private String jobEndHr;

	/*
	 * 작업시간
	 * */
	private int jobHr;

	/*
	 * 실적번호
	 * */
	private String prfmncno;

	/*
	 * 작업구분
	 * */
	private String prfmncSeCd;
	private String prfmncSeNm;
	/*
	 * 작업일자
	 * */
	private String prfmncYmd;

	/*
	 * 설비코드/명
	 * */
	private String fcltCd;
	private String fcltNm;

	/*
	 * 규격코드/명
	 * */
	private String spcfctCd;
	private String spcfctNm;

	/*
	 * 품목코드/명
	 * */
	private String itemCd;
	private String itemNm;

	/*
	 * 비고
	 * */
	private String rmrk;

	/*
	 * 작업자수
	 * */
	private int oprtrQntt;

	/*
	 * 실적 수량
	 * */
	private int qntt;
	/*
	 * 실적 중량
	 * */
	private int wght;
}
