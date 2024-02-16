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
public class RawMtrWrhsDsctnTotVO extends ComVO {

	private String apcCd;
	private String wrhsYmdFrom;
	private String wrhsYmdTo;
	private String itemCd;
	private String prdcrCd;
	private String wrhsYmd;


	private String prdcrNm;
	private String R1;
	private String R2;
	private String R3;
	private String R4;
	private String R5;
	private String RT;
	private String Y1;
	private String Y2;
	private String Y3;
	private String Y4;
	private String Y5;
	private String YT;
	private String O1;
	private String O2;
	private String O3;
	private String O4;
	private String O5;
	private String OT;
	private String TOT;






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
