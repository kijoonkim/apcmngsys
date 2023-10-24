package com.at.apcss.am.spmt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SpmtCmndVO.java
 * @Description : 출고지시에 대한 VO 클래스
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
public class SpmtCmndVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * APC구분코드
	 */
	private String apcSeCd;

	/**
	 * 출하지시번호
	 */
	private String spmtCmndno;

	/**
	 * 출하지시순번
	 */
	private int spmtCmndSn;

	/**
	 * 지시일자
	 */
	private String cmndYmd;

	/**
	 * 지시일자 시작일
	 */
	private String cmndYmdFrom;

	/**
	 * 지시일자 종료일
	 */
	private String cmndYmdTo;

	/**
	 * 거래처코드
	 */
	private String cnptCd;

	/**
	 * 거래처명
	 */
	private String cnptNm;

	/**
	 * 배송지
	 */
	private String dldtn;

	/**
	 * 운송회사코드
	 */
	private String trsprtCoCd;

	/**
	 * 운송회사명
	 */
	private String trsprtCoNm;

	/**
	 * 상품등급
	 */
	private String gdsGrd;

	/**
	 * 등급명
	 */
	private String grdNm;

	/**
	 * 상품등급명
	 */
	private String gdsGrdNm;

	/**
	 * 출하수량
	 */
	private int spmtQntt;
	/**
	 * 출하중량
	 */
	private int spmtWght;
	/**
	 * 지시수량
	 */
	private int cmndQntt;

	/**
	 * 지시중량
	 */
	private int cmndWght;

	/**
	 * 포장단위코드
	 */
	private int pckgSeCd;

	/**
	 * 포장단위
	 */
	private int pckgSe;

	/**
	 * 출하포장단위코드
	 */
	private String spmtPckgUnitCd;
	/**
	 * 출하포장단위명
	 */
	private String spmtPckgUnitNm;

	/**
	 * 발주번호
	 */
	private String outordrno;

	/**
	 * 품목코드
	 */
	private String itemCd;

	/**
	 * 품목명
	 */
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
	 * 상품코드
	 */
	private String gdsCd;

	/**
	 * 상품명
	 */
	private String gdsNm;

	/**
	 * 비고
	 */
	private String rmrk;
	/**
	 * 납기일자
	 */
	private String wrhsYmd;
}
