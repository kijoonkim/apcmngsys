package com.at.apcss.am.wrhs.vo;

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
public class ComRawMtrWrhsDsctnTotVO extends ComVO {

	private String apcCd;
	private String wrhsYmdFrom;
	private String wrhsYmdTo;
	private String itemCd;
	private String prdcrCd;
	private String wrhsYmd;
	private String vrtyCd;

	private String itemNm;
	private String vrtyNm;
	private String prdcrNm;
	private String bxQntt1;
	private String bxQntt2;
	private String bxQntt3;
	private String bxQntt4;
	private String bxQntt5;
	private String wrhsWght1;
	private String wrhsWght2;
	private String wrhsWght3;
	private String wrhsWght4;
	private String wrhsWght5;
	private String qnttTot;
	private String wrhsTot;








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
