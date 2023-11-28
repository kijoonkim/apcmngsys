package com.at.apcss.am.pckg.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.pckg.web.PckgInptController;
import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : PckgInptVO.java
 * @Description : 포장투입에 대한 VO 클래스
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
public class PckgMngVO extends ComVO {

	/**
	 * 투입등록 필요 여부
	 */
	private String needsInptRegYn;

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 선별번호
	 */
	private String sortno;

	/**
	 * 선별순번
	 */
	private int sortSn;

	/**
	 * 상품등급
	 */
	private String gdsGrd;

	/**
	 * 등급코드
	 */
	private String grdCd;

	/**
	 * 투입일자
	 */
	private String inptYmd;

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
	 * 수량
	 */
	private int qntt;

	/**
	 * 중량
	 */
	private double wght;

	/**
	 * 포장번호
	 */
	private String pckgno;

	/**
	 * 포장지시번호
	 */
	private String pckgCmndNo;

	/**
	 * 비고
	 */
	private String rmrk;

	private String pckgKey;
	
	private List<PckgInptVO> pckgInptList;

	/**
	 * 선별재고 목록
	 */
	private List<SortInvntrVO> sortInvntrList;

	/**
	 * 포장실적 목록
	 */
	private List<PckgPrfmncVO> pckgPrfmncList;

	public List<PckgInptVO> getPckgInptList() {
		return pckgInptList == null ? null : pckgInptList.stream().collect(Collectors.toList());
	}
	public void setPckgInptList(List<PckgInptVO> pckgInptList) {
		this.pckgInptList = pckgInptList == null ? null : pckgInptList.stream().collect(Collectors.toList());
	}

	public List<SortInvntrVO> getSortInvntrList() {
		return sortInvntrList == null ? null : sortInvntrList.stream().collect(Collectors.toList());
	}
	public void setSortCmndList(List<SortInvntrVO> sortInvntrList) {
		this.sortInvntrList = sortInvntrList == null ? null : sortInvntrList.stream().collect(Collectors.toList());
	}

	public List<PckgPrfmncVO> getPckgPrfmncList() {
		return pckgPrfmncList == null ? null : pckgPrfmncList.stream().collect(Collectors.toList());
	}
	public void setPckgPrfmncList(List<PckgPrfmncVO> pckgPrfmncList) {
		this.pckgPrfmncList = pckgPrfmncList == null ? null : pckgPrfmncList.stream().collect(Collectors.toList());
	}

}
