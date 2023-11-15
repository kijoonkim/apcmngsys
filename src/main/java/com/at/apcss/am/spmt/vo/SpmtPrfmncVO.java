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
	private String spmtno;

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
	private String trsprtCst;

	/**
	 * 운임비용합계
	 */
	private String totTrsprtCst;

	/**
	 * 비고
	 */
	private String rmrk;

	/**
	 * 포장번호
	 */
	private String pckgno;

	/**
	 * 포장순번
	 */
	private int pckgSn;

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
	 * 총출하수량
	 */
	private int totSpmtQntt;

	/**
	 * 총출하중량
	 */
	private double totSpmtWght;

	/**
	 * 출하포장단위코드
	 */
	private String spmtPckgUnitCd;
	/**
	 * 출하포장단위코드
	 */
	private String spmtPckgUnitNm;

	/**
	 * 출하지시수량
	 */
	private String cmndQntt;

	/**
	 * 브랜드명
	 */
	private String brndNm;

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
	private String spmtCmndno;
	/**
	 * 출하구분코드
	 */
	private String spmtSeCd;
	/**
	 * 출하자신고번호
	 */
	private String spmtPrsnDclrno;
	/**
	 * 산지코드
	 */
	private String plorCd;
	/**
	 * 발주번호
	 */
	private String outordrno;

	/**
	 * 상품등급
	 */
	private String gdsGrd;
	/**
	 * 상품등급먕
	 */
	private String gdsGrdNm;
	/**
	 * 마감여부
	 */
	private String ddlnYn;
	/**
	 * 매출확정여부
	 */
	private String cfmtnYn;
	/**
	 * 반품여부
	 */
	private String rtnGdsYn;
	private String rtnGdsNm;
	/**
	 * 원출하번호
	 */
	private String orgnSpmtno;
	/**
	 * 원포장번호
	 */
	private String orgnPckgno;
	/**
	 * 원포장순번
	 */
	private int orgnPckgSn;
	/**
	 * 반품수량
	 */
	private int rtnGdsQntt;
	/**
	 * 반품중량
	 */
	private double rtnGdsWght;
	/**
	 * 반품가능수량
	 */
	private int rtnPsbleyQntt;
	/**
	 * 반품가능중량
	 */
	private double rtnPsbleyWght;
}
