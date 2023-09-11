package com.at.apcss.am.pckg.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : PckgPrfmncVO.java
 * @Description : 포장실적에 대한 VO 클래스
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
public class PckgPrfmncVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 포장번호
	 */
	private String pckgno;

	/**
	 * 포장순번
	 */
	private int pckgSn;

	/**
	 * 포장일자
	 */
	private String pckgYmd;

	/**
	 * 투입일자
	 */
	private String inptYmd;

	/**
	 * 설비코드
	 */
	private String fcltCd;

	/**
	 * 대표생산자코드
	 */
	private String rprsPrdcrCd;
	private String rprsPrdcrNm;

	/**
	 * 생산자코드
	 */
	private String prdcrCd;

	/**
	 * 품목코드
	 */
	private String itemCd;

	/**
	 * 품종코드
	 */
	private String vrtyCd;
	private String vrtyNm;

	/**
	 * 규격코드
	 */
	private String spcfctCd;
	private String spcfctNm;

	/**
	 * 등급코드
	 */
	private String grdCd;

	/**
	 * 상품등급
	 */
	private String gdsGrd;
	private String gdsGrdNm;

	/**
	 * 창고구분코드
	 */
	private String warehouseSeCd;
	private String warehouseSeNm;

	/**
	 * 상품구분코드
	 */
	private String gdsSeCd;

	/**
	 * 입고구분코드
	 */
	private String wrhsSeCd;

	/**
	 * 출하포장단위코드
	 */
	private String spmtPckgUnitCd;
	/**
	 * 포장수량
	 */
	private int pckgQntt;

	/**
	 * 포장중량
	 */
	private double pckgWght;

	/**
	 * 포장지시번호
	 */
	private String pckgCmndno;

	/**
	 * 선별번호
	 */
	private String sortno;

	/**
	 * 선별순번
	 */
	private int sortSn;

	/**
	 * 비고
	 */
	private String rmrk;

	/**
	 * 포장투입실적 변경 여부
	 */
	private String needsInptChgYn;

	/*출하수량*/
	private String spmtQntt;

	/*춣하중량*/
	private String spmtWght;

	/*포장일자*/
	private String fromPckgYmd;
	private String toPckgYmd;

	/*품목코드*/
	private String itmeCd;

	/*저장창고*/
	private String strgWarehouse;

	/*대표생산자*/
	private String prdcrNm;

	/*포장내역명*/
	private String fcltNm;
}
