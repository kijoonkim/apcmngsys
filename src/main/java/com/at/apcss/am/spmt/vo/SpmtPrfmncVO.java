package com.at.apcss.am.spmt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SpmtPrfmncVO.java
 * @Description : 출고실적에 대한 VO 클래스
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
public class SpmtPrfmncVO extends ComVO {
	
	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 출하번호
	 */
	private String spmtNo;

	/**
	 * 출하시작일자
	 */
	private String spmtYmdFrom;

	/**
	 * 출하종료일자
	 */
	private String spmtYmdTo;

	/**
	 * 출하일자
	 */
	private String spmtYmd;

	/**
	 * 거래처코드
	 */
	private String cnptCd;

	/**
	 * 거래처명
	 */
	private String cnptNm;

	/**
	 * 운송회사코드
	 */
	private String trsprtCoCd;
	
	/**
	 * 운송회사명
	 */
	private String trsprtCoNm;

	/**
	 * 운송회사명
	 */
	private String trsptCoNm;

	/**
	 * 차량번호
	 */
	private String vhclno;

	/**
	 * 배송지
	 */
	private String dldtn;

	/**
	 * 운임비용
	 */
	private double trsprtCst;

	/**
	 * 비고
	 */
	private String rmrk;

	/**
	 * 포장번호
	 */
	private String pckgNo;

	/**
	 * 포장순번
	 */
	private int pckgSn;

	/**
	 * 품목코드
	 */
	private String itemCd;

	/**
	 * 품종코드
	 */
	private String vrtyCd;
	
	/**
	 * 품종명
	 */
	private String vrtyNm;

	/**
	 * 상품구분코드
	 */
	private String gdsSeCd;

	/**
	 * 규격코드
	 */
	private String spcfctCd;
	
	/**
	 * 규격명
	 */
	private String spcfctNm;
	
	/**
	 * 창고구분코드
	 */
	private String warehouseSeCd;

	/**
	 * 출하수량
	 */
	private int spmtQntt;

	/**
	 * 출하중량
	 */
	private double spmtWght;

	/**
	 * 포장구분코드
	 */
	private String pckgSeCd;

	/**
	 * 브랜드코드
	 */
	private String brndCd;

	/**
	 * 상품코드
	 */
	private String gdsCd;
	
	/**
	 * 상품명
	 */
	private String gdsNm;

	/**
	 * 생산자코드
	 */
	private String prdcrCd;

	/**
	 * 출하지시번호
	 */
	private String spmtCmndNo;
}
