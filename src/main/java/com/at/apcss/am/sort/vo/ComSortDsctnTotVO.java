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
public class ComSortDsctnTotVO extends ComVO {

	private String apcCd;
	private String inptYmdFrom;
	private String inptYmdTo;
	private String itemCd;
	private String rprsPrdcrCd;
	private String vrtyCd;

	private String sortYmd;
	private String inptYmd;
	private String itemNm;
	private String vrtyNm;
	private String prdcrNm;
	private String sortQntt1;
	private String sortQntt2;
	private String sortQntt3;
	private String sortQntt4;
	private String sortQntt5;
	private String sortWght1;
	private String sortWght2;
	private String sortWght3;
	private String sortWght4;
	private String sortWght5;









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
