package com.at.apcss.am.cmns.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : OrdrGdsVO.java
 * @Description : 대형마트 발주 상품정보에 대한 VO 클래스
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
public class OrdrGdsVO extends CmnsGdsVO {

	/**
	 * 대형마켓코드
	 */
	private String lgszMrktCd;
	/**
	 * 원상품코드
	 */
	private String orgnGdsCd;
	/**
	 * 원상품명
	 */
	private String orgnGdsNm;
	/**
	 * 적용일자
	 */
	private String aplcnYmd;
}
