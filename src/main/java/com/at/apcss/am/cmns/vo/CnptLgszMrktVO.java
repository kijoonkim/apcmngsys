package com.at.apcss.am.cmns.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : CnptVO.java
 * @Description : 거래처정보에 대한 VO 클래스
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
public class CnptLgszMrktVO extends ComVO {

	// 거래처
	private List<CnptVO> cnptList;

	public List<CnptVO> getCnptList() {
		return cnptList == null ? null : cnptList.stream().collect(Collectors.toList());
	}

	public void setCnptList(List<CnptVO> cnptList) {
		this.cnptList = cnptList == null ? null : cnptList.stream().collect(Collectors.toList());
	}

	// 대형마켓
	private List<LgszMrktVO> lgszMrkttList;

	public List<LgszMrktVO> getLgszMrktList() {
		return lgszMrkttList == null ? null : lgszMrkttList.stream().collect(Collectors.toList());
	}

	public void setLgszMrktList(List<LgszMrktVO> lgszMrkttList) {
		this.lgszMrkttList = lgszMrkttList == null ? null : lgszMrkttList.stream().collect(Collectors.toList());
	}

}
