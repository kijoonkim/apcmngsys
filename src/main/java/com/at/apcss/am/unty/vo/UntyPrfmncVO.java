package com.at.apcss.am.unty.vo;

import com.at.apcss.am.invntr.vo.PltWrhsSpmtVO;
import com.at.apcss.am.pckg.vo.PckgInptVO;
import com.at.apcss.am.pckg.vo.PckgPrfmncVO;
import com.at.apcss.am.sort.vo.SortInptPrfmncVO;
import com.at.apcss.am.sort.vo.SortPrfmncAtrbVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;
import com.at.apcss.am.wgh.vo.WghPrfmncVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;
import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Class Name : UntyPrfmncVO.java
 * @Description : 통합 실적에 대한 VO 클래스
 * @author 김호
 * @since 2025.08.18
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.08.18  김호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class UntyPrfmncVO extends ComVO {

	private String apcCd;
	private String wrhsno;
	private String wrhsYmd;
	private String wrhsYmdFrom;
	private String wrhsYmdTo;
	private int bxQntt;
	private String prdcrCd;

	private int tot;
	private int grdCd01;
	private int grdCd02;
	private int grdCd03;
	private int grdCd04;
	private int grdCd05;
	private int grdCd06;
	private int grdCd07;
	private int grdCd08;
	private int grdCd09;
	private int grdCd10;
	private int grdCd11;
	private int grdCd12;
	private int grdCd13;
	private int grdCd14;
	private int grdCd15;
	private int grdCd16;
	private int grdCd17;
	private int grdCd18;
	private int grdCd19;
	private int grdCd20;

	private int sortAtrbQntt1;
	private int SortAtrbUntprc1;
	private String sortno;
	private String pckgno;
	private String pltno;
	private String spmtno;
	private int pltBxQntt;

	private String untyPrfmncType;
	private String sortPrfmncAtrbYn;
	private String pltWrhsSpmtYn;

	private RawMtrWrhsVO rawMtrWrhsVO;
	private WghPrfmncVO wghPrfmncVO;
	private SortPrfmncVO sortPrfmncVO;
	private PckgPrfmncVO pckgPrfmncVO;
	private SpmtPrfmncVO spmtPrfmncVO;
	private SortInptPrfmncVO sortInptPrfmncVO;
	private PckgInptVO pckgInptVO;

	/**
	 * 계량실적
	 * */
	private List<WghPrfmncVO> wghPrfmncList;

	public List<WghPrfmncVO> getWghPrfmncList() {
		return this.wghPrfmncList == null ? null : wghPrfmncList.stream().collect(Collectors.toList());
	}

	public void setWghPrfmncList(List<WghPrfmncVO> wghPrfmncList) {
		this.wghPrfmncList = rawMtrWrhsList == null ? null : wghPrfmncList.stream().collect(Collectors.toList());
	}

	/**
	 * 입고실적
	 * */
	private List<RawMtrWrhsVO> rawMtrWrhsList;

	public List<RawMtrWrhsVO> getRawMtrWrhsList() {
		return this.rawMtrWrhsList == null ? null : rawMtrWrhsList.stream().collect(Collectors.toList());
	}

	public void setRawMtrWrhsList(List<RawMtrWrhsVO> rawMtrWrhsList) {
		this.rawMtrWrhsList = rawMtrWrhsList == null ? null : rawMtrWrhsList.stream().collect(Collectors.toList());
	}

	/**
	 * 팔레트박스입출정보
	 * */
	private List<PltWrhsSpmtVO> pltWrhsSpmtList;

	public List<PltWrhsSpmtVO> getPltWrhsSpmtList() {
		return this.pltWrhsSpmtList == null ? null : pltWrhsSpmtList.stream().collect(Collectors.toList());
	}

	public void setPltWrhsSpmtList(List<PltWrhsSpmtVO> pltWrhsSpmtList) {
		this.pltWrhsSpmtList = pltWrhsSpmtList == null ? null : pltWrhsSpmtList.stream().collect(Collectors.toList());
	}


	/**
	 * 선별실적
	* */
	private List<SortPrfmncVO> sortPrfmncList;

	public List<SortPrfmncVO> getSortPrfmncList() {
		return this.sortPrfmncList == null ? null : sortPrfmncList.stream().collect(Collectors.toList());
	}

	public void setSortPrfmncList(List<SortPrfmncVO> sortPrfmncList) {
		this.sortPrfmncList = sortPrfmncList == null ? null : sortPrfmncList.stream().collect(Collectors.toList());
	}

	/**
	 * 선별투입실적
	 * */
	private List<SortInptPrfmncVO> sortInptPrfmncList;

	public List<SortInptPrfmncVO> getSortInptPrfmncList() {
		return this.sortInptPrfmncList == null ? null : sortInptPrfmncList.stream().collect(Collectors.toList());
	}

	public void setSortInptPrfmncList(List<SortInptPrfmncVO> sortInptPrfmncList) {
		this.sortInptPrfmncList = sortInptPrfmncList == null ? null : sortInptPrfmncList.stream().collect(Collectors.toList());
	}

	/**
	 * 선별실적속성
	 * */
	private List<SortPrfmncAtrbVO> sortPrfmncAtrbList;

	public List<SortPrfmncAtrbVO> getSortPrfmncAtrbList() {
		return this.sortPrfmncAtrbList == null ? null : sortPrfmncAtrbList.stream().collect(Collectors.toList());
	}

	public void setSortPrfmncAtrbList(List<SortPrfmncAtrbVO> sortPrfmncAtrbList) {
		this.sortPrfmncAtrbList = sortPrfmncAtrbList == null ? null : sortPrfmncAtrbList.stream().collect(Collectors.toList());
	}

	/**
	 * 포장실적
	 * */
	private List<PckgPrfmncVO> pckgPrfmncList;

	public List<PckgPrfmncVO> getPckgPrfmncList() {
		return this.pckgPrfmncList == null ? null : pckgPrfmncList.stream().collect(Collectors.toList());
	}

	public void setPckgPrfmncList(List<PckgPrfmncVO> pckgPrfmncList) {
		this.pckgPrfmncList = pckgPrfmncList == null ? null : pckgPrfmncList.stream().collect(Collectors.toList());
	}

	/**
	 * 포장투입실적
	 * */
	private List<PckgInptVO> pckgInptPrfmncList;

	public List<PckgInptVO> getPckgInptPrfmncList() {
		return this.pckgInptPrfmncList == null ? null : pckgInptPrfmncList.stream().collect(Collectors.toList());
	}

	public void setPckgInptPrfmncList(List<PckgInptVO> pckgInptPrfmncList) {
		this.pckgInptPrfmncList = pckgInptPrfmncList == null ? null : pckgInptPrfmncList.stream().collect(Collectors.toList());
	}

	/**
	 * 출하실적
	 * */
	private List<SpmtPrfmncVO> spmtPrfmncList;

	public List<SpmtPrfmncVO> getSpmtPrfmncList() {
		return this.spmtPrfmncList == null ? null : spmtPrfmncList.stream().collect(Collectors.toList());
	}

	public void setSpmtPrfmncList(List<SpmtPrfmncVO> spmtPrfmncList) {
		this.spmtPrfmncList = spmtPrfmncList == null ? null : spmtPrfmncList.stream().collect(Collectors.toList());
	}
}
