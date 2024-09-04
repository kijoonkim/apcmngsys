package com.at.apcss.am.wrhs.vo;

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
public class FrmhsExpctWrhsDtlVO extends ComVO {
	/*
	 * APC코드
	 * */
	private String apcCd;
	/*
	 * 생산자코드
	 * */
	private String prdcrCd;
	/*
	 * 농가예상입고번호
	 * */
    private String frmhsExpctWrhsNo;
    /*
     * 기준연월
     * */
    private String crtrYm;
    /*
     * 기준연도
     * */
    private String crtrYr;
    /*
     * 기준월
     * */
    private String crtrMm;
    /*
     * 일자
     * */
    private String ymd;
    /*
     * 일자
     * */
    private int qntt;
}
