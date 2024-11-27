package com.at.apcss.am.wrhs.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
/**
 * @Class Name : FrmhsExpctWrhsVO.java
 * @Description : 농가예상입고에 대한 VO 클래스
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
public class FrmhsExpctWrhsVO extends ComVO {
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
	 * 대표품목코드
	 * */
	private String rprsItemCd;
	/*
	 * 대표품종코드
	 * */
	private String rprsVrtyCd;
	/*
	 * 농가주소
	 * */
	private String frmhsAddr;
	/*
	 * 농가연락처
	 * */
	private String frmhsTelno;
	/*
	 * 농가지역
	 * */
	private String frmhsCtpvNm;
	private String frmhsCtpv;
	/*
	 * 농가계약면적
	 * */
	private int plntngPrcl;
	/*
	 * 농가예상입고번호
	 * */
    private String frmhsExpctWrhsNo;
    /*
     * 기준연월
     * */
    private String crtrYm;
    /*
     * 본사/외부구분
     * */
    private String hdofcExtrnlSeCd;
    /*
     * 외부창고코드
     * */
    private String extrnlWarehouseCd;
    /*
     * 수확일자
     * */
    private String hrvstYmd;
    /*
     * 예상양
     * */
    private int expctQntt;
    /*
     * 최종저장구분
     * */
    private String qltEvl;
    /*
     * 담당자
     * */
    private String pic;
    /*
     * 예상량대비
     * */
    private int expctVlmVrss;
    /*
     * 수매완료여부
     * */
    private String prchsCmptnYn;
    /*
     * 연도
     * */
    private String yr;
    /*
     * 비고
     * */
    private String rmrk;
    private int ymd1Qntt;
    private int ymd2Qntt;
    private int ymd3Qntt;
    private int ymd4Qntt;
    private int ymd5Qntt;
    private int ymd6Qntt;
    private int ymd7Qntt;
    private int ymd8Qntt;
    private int ymd9Qntt;
    private int ymd10Qntt;
    private int ymd11Qntt;
    private int ymd12Qntt;
    private int ymd13Qntt;
    private int ymd14Qntt;
    private int ymd15Qntt;
    private int ymd16Qntt;
    private int ymd17Qntt;
    private int ymd18Qntt;
    private int ymd19Qntt;
    private int ymd20Qntt;
    private int ymd21Qntt;
    private int ymd22Qntt;
    private int ymd23Qntt;
    private int ymd24Qntt;
    private int ymd25Qntt;
    private int ymd26Qntt;
    private int ymd27Qntt;
    private int ymd28Qntt;
    private int ymd29Qntt;
    private int ymd30Qntt;
    private int ymd31Qntt;
    private int tot;

    /*
     * 입고마감사용여부
     * */
    private String useYn;
    /*
     * 입고마감일자
     * */
    private String ddlnYmd;

    /*
	 * 농가예상입고상세
	 * */
	private List<FrmhsExpctWrhsDtlVO> frmhsExpctWrhsDtlList;


	public List<FrmhsExpctWrhsDtlVO> getFrmhsExpctWrhsDtlList() {
		return this.frmhsExpctWrhsDtlList == null ? null : frmhsExpctWrhsDtlList.stream().collect(Collectors.toList());
	}

	public void setFrmhsExpctWrhsDtlList(List<FrmhsExpctWrhsDtlVO> frmhsExpctWrhsDtlList) {
		this.frmhsExpctWrhsDtlList = frmhsExpctWrhsDtlList == null ? null : frmhsExpctWrhsDtlList.stream().collect(Collectors.toList());
	}

}
