package com.at.apcss.am.clcln.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : ClclnUntprcVO.java
 * @Description : 정산단가에 대한 VO 클래스
 * @author 신정철
 * @since 2023.10.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class ClclnUntprcVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	
	
	/**
	 * 상품구분코드
	 */
	private String gdsSeCd;
	private String gdsSeNm;
	
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
	 * 등급코드
	 */
	private String grdCd;
	private String grdNm;
	
	/**
	 * 정산단가
	 */
	private double clclnUntprc;
	
	/**
	 * 정산단중
	 */
	private double clclnUnitWght;
	
	/**
	 * 정산기준코드
	 */
	private String clclnCrtrCd;
	private String clclnCrtrNm;
	
	
}
