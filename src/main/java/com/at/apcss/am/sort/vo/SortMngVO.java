package com.at.apcss.am.sort.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SortCmndVO.java
 * @Description : 선별지시정보에 대한 VO 클래스
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
public class SortMngVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;


	/**
	 * 투입등록 필요 여부
	 */
	private String needsInptRegYn;


	/**
	 * 포장등록 여부
	 */
	private String needsPckgRegYn;

	/**
	 * 원물재고 목록
	 */
	private List<RawMtrInvntrVO> rawMtrInvntrList;

	/**
	 * 선별지시 목록
	 */
	private List<SortCmndVO> sortCmndList;
	/**
	 * 선별투입실적 목록
	 */
	private List<SortInptPrfmncVO> sortInptPrfmncList;
	/**
	 * 선별실적 목록
	 */
	private List<SortPrfmncVO> sortPrfmncList;

	/**
	 * 선별지시 목록 get set
	 * @return
	 */
	public List<SortCmndVO> getSortCmndList() {
		return sortCmndList;
	}
	public void setSortCmndList(List<SortCmndVO> sortCmndList) {
		this.sortCmndList = sortCmndList;
	}

	public List<SortInptPrfmncVO> getSortInptPrfmncList() {
		return sortInptPrfmncList == null ? null : sortInptPrfmncList.stream().collect(Collectors.toList());
	}
	public void setSortInptPrfmncList(List<SortInptPrfmncVO> sortInptPrfmncList) {
		this.sortInptPrfmncList = sortInptPrfmncList == null ? null : sortInptPrfmncList.stream().collect(Collectors.toList());
	}

	public List<SortPrfmncVO> getSortPrfmncList() {
		return sortPrfmncList == null ? null : sortPrfmncList.stream().collect(Collectors.toList());
	}
	public void setSortPrfmncList(List<SortPrfmncVO> sortPrfmncList) {
		this.sortPrfmncList = sortPrfmncList == null ? null : sortPrfmncList.stream().collect(Collectors.toList());
	}
	public List<RawMtrInvntrVO> getRawMtrInvntrList() {
		return rawMtrInvntrList == null ? null : rawMtrInvntrList.stream().collect(Collectors.toList());
	}
	public void setRawMtrInvntrList(List<RawMtrInvntrVO> rawMtrInvntrList) {
		this.rawMtrInvntrList = rawMtrInvntrList == null ? null : rawMtrInvntrList.stream().collect(Collectors.toList());
	}

}
