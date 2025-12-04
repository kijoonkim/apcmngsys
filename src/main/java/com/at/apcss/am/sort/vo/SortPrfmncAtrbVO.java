package com.apcmngsys.apcss.am.sort.vo;

import com.apcmngsys.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Class Name : SortPrfmncAtrbVO.java
 * @Description : 선별실적속성정보에 대한 VO 클래스
 * @author 김호
 * @since 2025.09.18
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.09.18  김호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class SortPrfmncAtrbVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 선별번호
	 */
	private String sortno;

	/**
	 * 정렬속성코드
	 * */
	private String sortAtrbCd;

	/**
	 * 수량
	 * */
	private int qntt;
	/**
	 * 무게
	 * */
	private int wght;

	/**
	 * 단가
	 * */
	private int untprc;

	/**
	 * 금액
	 * */
	private int amt;

}
