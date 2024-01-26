package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : CmnsItemVO.java
 * @Description : 품목정보에 대한 VO 클래스
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
public class CmnsItemVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * 품목코드
	 */
	private String itemCd;
	/**
	 * 품목명
	 */
	private String itemNm;

	/**
	 * 등록품종수
	 */
	private String vrtrCnt;
	/**
	 * 등록규격수
	 */
	private String spcfctCnt;
	/**
	 * 등록등급수
	 */
	private String grdCnt;
	/**
	 * 농협APC코드
	 */
	private String nhApcCd;
	/**
	 * 농협품목명
	 */
	private String nhItemNm;

	/**
	 * 부류명
	 */
	private String clsNm;
	/**
	 * 원물감량률
	 */
	private double rawMtrRdcdRt;
	/**
	 * 선별감량률
	 */
	private double sortRdcdRt;
	/**
	 * 포장감량률
	 */
	private double pckgRdcdRt;

	/**
	 * 등록 수
	 */
	private int cnt;
	/**
	 * 삭제 불가능 사유
	 */
	private String delible;
}
