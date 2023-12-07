package com.at.apcss.am.invntr.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : InvntrVO.java
 * @Description : 재고정보에 대한 VO 클래스
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
public class InvntrVO extends ComVO {

	private String apcCd;
	private String invntrKey;
	private String invntrYmd;
	
	private List<SortInvntrVO> sortInvntrList;

	public List<SortInvntrVO> getSortInvntrList() {
		return sortInvntrList == null ? null : sortInvntrList.stream().collect(Collectors.toList());
	}

	public void setSortInvntrList(List<SortInvntrVO> sortInvntrList) {
		this.sortInvntrList = sortInvntrList == null ? null : sortInvntrList.stream().collect(Collectors.toList());;
	}
	
	private List<GdsInvntrVO> gdsInvntrList;

	public List<GdsInvntrVO> getGdsInvntrList() {
		return gdsInvntrList == null ? null : gdsInvntrList.stream().collect(Collectors.toList());
	}

	public void setGdsInvntrList(List<GdsInvntrVO> gdsInvntrList) {
		this.gdsInvntrList = gdsInvntrList == null ? null : gdsInvntrList.stream().collect(Collectors.toList());;
	}
	
}
