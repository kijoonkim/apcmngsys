package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : WrhsVhclVO.java
 * @Description : 입고차량 정보에 대한 VO 클래스
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
@EqualsAndHashCode(callSuper = false)
public class WrhsVhclVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * 차량번호
	 */
	private String vhclno;
	/**
	 * 기사명
	 */
	private String drvrNm;
	/**
	 * 은행코드
	 */
	private String bankCd;
	/**
	 * 은행명
	 */
	private String bankNm;
	/**
	 * 계좌번호
	 */
	private String actno;
	/**
	 * 예금주명
	 */
	private String dpstrNm;
	/**
	 * 비고
	 */
	private String rmrk;
}
