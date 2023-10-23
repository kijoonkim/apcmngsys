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
	 * 정산기준
	 */
	private String clclnCrtrCd;
	private String clclnCrtrNm;
	
	
	/**
	 * 정산일자
	 */
	private String clclnYmd;
	/**
	 * 정산시작일자
	 */
	private String clclnYmdFrom;
	/**
	 * 정산종료일자
	 */
	private String clclnYmdTo;
	/**
	 * 정산순번
	 */
	private String clclnSn;
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
	private String wrhsSeNm;
	/**
	 * 입고구분
	 */
	private String wrhsSe;
	/**
	 * 상품구분코드
	 */
	private String gdsSeCd;
	private String gdsSeNm;
	/**
	 * 상품구분
	 */
	private String gdsSe;
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
	 * 브랜드
	 */
	private String brndCd;
	private String brndNm;
	/**
	 * 등급코드
	 */
	private String grdCd;
	private String grdNm;
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
	 * 계산금액
	 */
	private double rkngAmt;
	/**
	 * 계산금액합계
	 */
	private double totRkngAmt;
	/**
	 * 확정유무
	 */
	private String cfmtnYn;
	/**
	 * 확정금액
	 */
	private double cfmtnAmt;
	/**
	 * 확정금액합계
	 */
	private double totCfmtnAmt;
	
	private String prfmncYmdFrom;
	private String prfmncYmdTo;
	
	private String rtnCd;
	
	private String rtnMsg;
}
