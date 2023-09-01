package com.at.apcss.am.invntr.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : PltWrhsSpmtVO.java
 * @Description : 팔레트 입출고에 대한 VO 클래스
 * @author 신정철
 * @since 2023.06.26
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
public class PltWrhsSpmtVO extends ComVO {
	
	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 작업일자
	 */
	private String jobYmd;

	/**
	 * 입출고 구분코드
	 */
	private String wrhsSpmtSeCd;

	/**
	 * 입출고 구분명
	 */
	private String wrhsSpmtSeNm;

	/**
	 * 팔레트/박스 구분코드
	 */
	private String pltBxSeCd;
	/**
	 * 팔레트/박스 구분명
	 */
	private String pltBxSeNm;

	/**
	 * 팔레트/박스 코드
	 */
	private String pltBxCd;

	/**
	 * 생산자코드
	 */
	private String prdcrCd;
	/**
	 * 생산자이름
	 */
	private String prdcrNm;

	/**
	 * 순번
	 */
	private int seqNo;

	/**
	 * 팔레트명칭
	 */
	private String pltNm;

	/**
	 * 단중
	 */
	private double unitWght;

	/**
	 * 수량
	 */
	private int qntt;

	/**
	 * 중량
	 */
	private double wght;
	/**
	 * 비고
	 */
	private String rmrk;
}
