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
	private String orgTot;
	private String tot;








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
