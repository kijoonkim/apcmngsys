package com.at.apcss.am.wrhs.vo;

import com.at.apcss.am.cmns.vo.ComAtchflVO;
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
	private String prdcrNm;
	/*
	 * 생산자농지정보번호
	 * */
	private String prdcrLandInfoNo;

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

	/*
	 * 첨부파일VO
	 * */
	private ComAtchflVO comAtchflVO;

	/*
	 * 첨부파일번호
	 * */
	private String atchflNo;
	/*
	 * 첨부파일 경로
	 * */
	private String filePath;
	/*
	 * 첨부파일 원본명
	 * */
	private String atchflOrgnNm;
    /*
     * 연도
     * */
    private String yr;
	/*
	 * 확정일자
	 * */
	private String cfmtnYmd;
	private String cfmtnYmdFrom;
	private String cfmtnYmdTo;
    /*
     * 기반비료일자
     * */
    private String baseFrtlzrYmd;
    /*
     * 파종일자
     * */
    private String sdngYmd;
    /*
     * 정식일자
     * */
    private String plntngYmd;
    /*
     * 추비1차일자
     * */
    private String cmptYmdCycl1;
    /*
     * 추비2차일자
     * */
    private String cmptYmdCycl2;
	/*
	 * 농가지역
	 * */
	private String frmhsCtpv;
	/*
	 * 파일부모번호
	 * */
	private String prntsTblNo;
	/*
	 * 담당자
	 * */
	private String pic;
	/*
	 * 계약면적(평)
	 * */
	private String crtrArea;
	/*
	 * 정식면적(평)
	 * */
	private String plntngArea;

}
