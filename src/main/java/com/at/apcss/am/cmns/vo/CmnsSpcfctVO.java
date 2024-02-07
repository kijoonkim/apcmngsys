package com.at.apcss.am.cmns.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : CmnsSpcfctVO.java
 * @Description : 규격정보에 대한 VO 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 *      </pre>
 */
@Getter
@Setter
public class CmnsSpcfctVO extends CmnsItemVO {

	/**
	 * 규격코드
	 */
	private String spcfctCd;
	/**
	 * 규격명
	 */
	private String spcfctNm;

	/**
	 * 단위
	 */
	private String unitCd;

	/**
	 * 포장구분
	 */
	private String pckgSttsCd;
	/**
	 * 평균입수
	 */
	private String bxGdsQntt;
	/**
	 * 단중
	 */
	private double wght;

	/**
	 * 순번
	 */
	private String sn;

	/**
	 * 품목규격코드
	 */
	private String itemSpcfctCd;
}
