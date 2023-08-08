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
	private String pckgSn;
	
	/**
	 * 포장일자
	 */
	private String pckgYmd;
	
	/**
	 * 설비코드
	 */
	private String fcltCd;
	
	/**
	 * 대표생산자코드
	 */
	private String rprsPrdcrCd;
	
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
	
	/**
	 * 규격코드
	 */
	private String spcfctCd;
	
	/**
	 * 창고구분코드
	 */
	private String warehouseSeCd;
	
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
	 * 비고
	 */
	private String rmrk;
}
