package com.at.apcss.am.clcln.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : ClclnPrfmncVO.java
 * @Description : 정산실적에 대한 VO 클래스
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
public class ClclnPrfmncVO extends ComVO {
	
	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * 정산일자
	 */
	private String clclnYmd;
	/**
	 * 정산순번
	 */
	private String clclnSeqNo;
	/**
	 * 생산자코드
	 */
	private String prdcrCd;
	/**
	 * 생산자명
	 */
	private String prdcrNm;
	/**
	 * 입고구분코드
	 */
	private String wrhsSeCd;
	/**
	 * 상품구분코드
	 */
	private String gdsSeCd;
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
	 * 등급1
	 */
	private int grd1;
	/**
	 * 등급2
	 */
	private int grd2;
	/**
	 * 등급3
	 */
	private int grd3;
	/**
	 * 등급4
	 */
	private int grd4;
	/**
	 * 등급5
	 */
	private int grd5;
	/**
	 * 수량
	 */
	private int qntt;
	/**
	 * 중량
	 */
	private double wght;
	/**
	 * 계산금액
	 */
	private double rkngAmt;
	/**
	 * 확정유무
	 */
	private String cfmtnYn;
	/**
	 * 확정금액
	 */
	private double cfmtnAmt;
}
