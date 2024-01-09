package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : PrdcrVO.java
 * @Description : 생산자 정보에 대한 VO 클래스
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
public class PrdcrVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * APC명
	 */
	private String apcNm;
	/**
	 * 생산자코드
	 */
	private String prdcrCd;
	/**
	 * 생산자명
	 */
	private String prdcrNm;
	/**
	 * 생산자초성
	 */
	private String prdcrFrstNm;
	/**
	 * 대표품목코드
	 */
	private String rprsItemCd;
	/**
	 * 대표품목명
	 */
	private String rprsItemNm;
	/**
	 * 대표품종코드
	 */
	private String rprsVrtyCd;
	/**
	 * 대표품종명
	 */
	private String rprsVrtyNm;
	/**
	 * 상품구분코드
	 */
	private String gdsSeCd;
	/**
	 * 상품구분명
	 */
	private String gdsSeNm;
	/**
	 * 입고구분코드
	 */
	private String wrhsSeCd;
	/**
	 * 입고구분명
	 */
	private String wrhsSeNm;
	/**
	 * 운송구분코드
	 */
	private String trsprtSeCd;
	/**
	 * 운송구분명
	 */
	private String trsprtSeNm;
	/**
	 * 차량번호
	 */
	private String vhclno;
	/**
	 * 전화번호
	 */
	private String telno;
	/**
	 * 산지코드
	 */
	private String plorCd;
	/**
	 * 생산자연계코드
	 */
	private String prdcrLinkCd;
	/**
	 * 생산자인식번호
	 */
	private int prdcrIdentno;
	/**
	 * 비고
	 */
	private String rmrk;

	/**
	 * 정산기준
	 */
	private String clclnCrtrCd;
	/**
	 * 정산기준명
	 */
	private String clclnCrtrNm;

	/**
	 * 농업인 번호
	 */
	private String frmerno;
	/**
	 * 경영체등록번호(연계번호)
	 */
	private String mngmstRegno;
	/**
	 * 경영주 및 경영주와의 관계
	 */
	private String admstOwnrRel;
	/**
	 * 경영주 법인 명
	 */
	private String admstOwnrCorpNm;
	/**
	 * 경영주 주민등록 주소
	 */
	private String admstOwnrRgdtAddr;
	/*
	 * 경영주 실거주 주소
	 * */
	private String admstOwnrActlHbtnAddr;
	/*
	 * 경영주 실거주 도로명 주소
	 * */
	private String admstOwnrDaddr;
	/*
	 * 마을 명
	 * */
	private String vlgNm;
	/*
	 * 개인 법인 구분코드명
	 * */
	private String prsnaCorpSeCd;
	/*
	 * 내외국인 구분코드명
	 * */
	private String ctznFngnrSeCd;
	/*
	 * 휴대전화번호
	 * */
	private String mblTelno;
	/*
	 * 팩스번호
	 * */
	private String fxno;
	/*
	 * 이메일 주소
	 * */
	private String emlAddr;
	/*
	 * 영농 시작 일자
	 * */
	private String agrcBgngYmd;
	/*
	 * 농업시작형태
	 * */
	private String frmngBgngShap;
	/*
	 * 농업종사형태
	 * */
	private String frmngEnggShap;
	/*
	 * 설립연도
	 * */
	private String fndnYr;
	/*
	 * 사업자등록번호
	 * */
	private String brno;
	/*
	 * 대표자명
	 * */
	private String rprsvNm;
	/*
	 * 대표자 주소
	 * */
	private String rprsvAddr;
	/*
	 * 생년월일
	 * */
	private String brdt;
	/*
	 * 성별
	 * */
	private String sxdc;
	/*
	 * 등록구분
	 * */
	private String regSeCd;
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
