package com.at.apcss.am.sls.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SlsPrfmncVO.java
 * @Description : 매출실적에 대한 VO 클래스
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
public class SlsPrfmncVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 매출일자
	 */
	private String slsYmd;

	/**
	 * 매출시작일자
	 */
	private String slsYmdFrom;

	/**
	 * 매출종료일자
	 */
	private String slsYmdTo;

	/**
	 * 매출순번
	 */
	private int slsSn;

	/**
	 * 거래처코드
	 */
	private String cnptCd;

	/**
	 * 거래처명
	 */
	private String cnptNm;

	/**
	 * 상품코드
	 */
	private String gdsCd;

	/**
	 * 상품명
	 */
	private String gdsNm;

	/**
	 * 품목코드
	 */
	private String itemCd;
	private String itemNm;

	/**
	 * 품종코드
	 */
	private String vrtyCd;

	/**
	 * 품종명
	 */
	private String vrtyNm;

	/**
	 * 규격코드
	 */
	private String spcfctCd;

	/**
	 * 규격명
	 */
	private String spcfctNm;

	/**
	 * 등급코드
	 */
	private String grdCd;
	private String grdNm;

	/**
	 * 브랜드코드
	 */
	private String brndCd;
	private String brndNm;

	/**
	 * 출하일자
	 */
	private String spmtYmd;

	/**
	 * 수량
	 */
	private int qntt;

	/**
	 * 중량
	 */
	private double wght;

	/**
	 * 총수량
	 */
	private int totQntt;

	/**
	 * 총중량
	 */
	private double totWght;

	/**
	 * 매출단가
	 */
	private double slsUntprc;

	/**
	 * 계산금액
	 */
	private double rkngAmt;

	/**
	 * 확정금액
	 */
	private double cfmtnAmt;

	/**
	 * 확정금액합계
	 */
	private double totCfmtnAmt;

	/**
	 * 확정여부
	 */
	private String cfmtnYn;

	/*
	 * 프로시저 실패 리턴 결과
	 * */
	private String rtnCd;

	/*
	 * 프로시저 실패 리턴 메시지
	 * */
	private String rtnMsg;
}
