package com.at.apcss.am.sort.vo;

import com.at.apcss.am.cmns.vo.StdGrdVO;
import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Class Name : SortPrfmncVO.java
 * @Description : 육안선별(현장용)에 대한 List VO 클래스
 * @author 김  호
 * @since 2024.05.14
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.05.14  김  호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class SortBffaList extends ComVO {

	private List<WrhsSortGrdVO> wrhsSortGrdList;
	private List<SortBffaVO> sortBffaVOList;


	public List<WrhsSortGrdVO> getWrhsSortGrdList() {
		return this.wrhsSortGrdList == null ? null : wrhsSortGrdList.stream().collect(Collectors.toList());
	}

	public void setWrhsSortGrdList(List<WrhsSortGrdVO> wrhsSortGrdList) {
		this.wrhsSortGrdList = wrhsSortGrdList == null ? null : wrhsSortGrdList.stream().collect(Collectors.toList());
	}

	public List<SortBffaVO> getsSortBffaVOList() {
		return this.sortBffaVOList == null ? null : sortBffaVOList.stream().collect(Collectors.toList());
	}

	public void setSortBffaVOList(List<SortBffaVO> sortBffaVOList) {
		this.sortBffaVOList = sortBffaVOList == null ? null : sortBffaVOList.stream().collect(Collectors.toList());
	}


}
