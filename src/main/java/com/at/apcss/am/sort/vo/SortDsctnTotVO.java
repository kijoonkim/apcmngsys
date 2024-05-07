package com.at.apcss.am.sort.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.am.invntr.vo.RawMtrStdGrdVO;
import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : RawMtrWrhsVO.java
 * @Description : 원물입고에 대한 VO 클래스
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
public class SortDsctnTotVO extends ComVO {

	private String apcCd;
	private String inptYmdFrom;
	private String inptYmdTo;
	private String itemCd;
	private String prdcrCd;
	private String inptYmd;

	private String grd;
	private String prdcrNm;
	private String red2Xl;
	private String redXl;
	private String redL;
	private String redM;
	private String redS;
	private String redSs;
	private String redTot;
	private String ylw2Xl;
	private String ylwXl;
	private String ylwL;
	private String ylwM;
	private String ylwS;
	private String ylwSs;
	private String ylwTot;
	private String org2Xl;
	private String orgXl;
	private String orgL;
	private String orgM;
	private String orgS;
	private String orgSs;
	private String red2XlP;
	private String redXlP;
	private String redLP;
	private String redMP;
	private String redSP;
	private String redSsP;
	private String redTotP;
	private String ylw2XlP;
	private String ylwXlP;
	private String ylwLP;
	private String ylwMP;
	private String ylwSP;
	private String ylwSsP;
	private String ylwTotP;
	private String org2XlP;
	private String orgXlP;
	private String orgLP;
	private String orgMP;
	private String orgSP;
	private String orgSsP;
	private String orgTot;
	private String orgTotP;
	private String tot;
	private String grdGubun;
	private String rk;
	private String grdRedSum;
	private String grdYlwSum;
	private String grdOrgSum;
	private String red2XlTot;
	private String redXlTot;
	private String redLTot;
	private String redMTot;
	private String redSTot;
	private String redSsTot;
	private String ylw2XlTot;
	private String ylwXlTot;
	private String ylwLTot;
	private String ylwMTot;
	private String ylwSTot;
	private String ylwSsTot;
	private String org2XlTot;
	private String orgXlTot;
	private String orgLTot;
	private String orgMTot;
	private String orgSTot;
	private String orgSsTot;
	private String dsctnYn;
	private String totOver;
	private String redTotOver;
	private String ylwTotOver;
	private String orgTotOver;

	/**
	 * 표준등급 목록
	 */
	private List<RawMtrStdGrdVO> stdGrdList;

	public List<RawMtrStdGrdVO> getStdGrdList() {
		return stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}

	public void setStdGrdList(List<RawMtrStdGrdVO> stdGrdList) {
		this.stdGrdList = stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}

}
