package com.at.apcss.am.wrhs.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.am.cmns.vo.PrdcrVO;
import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
/**
 * @Class Name : CltvtnListVO.java
 * @Description : 재배이력에 대한 VO 클래스
 * @author 김  호
 * @since 2024.06.25
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.06.25  김  호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class CltvtnListVO extends ComVO {

	private PrdcrVO prdcrVO;
	private CltvtnBscInfoVO cltvtnBscInfoVO;
	/*
	 * 재배기본정보
	 * */
	private List<CltvtnBscInfoVO> cltvtnBscInfoList;
	/*
	 * 재배이력
	 * */
	private List<CltvtnHstryVO> cltvtnHstryList;


	public List<CltvtnBscInfoVO> getCltvtnBscInfoList() {
		return this.cltvtnBscInfoList == null ? null : cltvtnBscInfoList.stream().collect(Collectors.toList());
	}

	public void setCltvtnBscInfoList(List<CltvtnBscInfoVO> cltvtnBscInfoList) {
		this.cltvtnBscInfoList = cltvtnBscInfoList == null ? null : cltvtnBscInfoList.stream().collect(Collectors.toList());
	}

	public List<CltvtnHstryVO> getCltvtnHstryList() {
		return this.cltvtnHstryList == null ? null : cltvtnHstryList.stream().collect(Collectors.toList());
	}

	public void setCltvtnHstryList(List<CltvtnHstryVO> cltvtnHstryList) {
		this.cltvtnHstryList = cltvtnHstryList == null ? null : cltvtnHstryList.stream().collect(Collectors.toList());
	}
}
