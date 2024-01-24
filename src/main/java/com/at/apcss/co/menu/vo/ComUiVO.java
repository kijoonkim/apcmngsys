package com.at.apcss.co.menu.vo;

import java.util.List;
import java.util.stream.Collectors;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComUiVO extends ComMenuVO {
	private String entyId;
	private String entyNm;
	private String entyType;
	private String entyTypeNm;
	
	private List<ComMenuVO> menuInfoList;
	public List<ComMenuVO> getMenuInfoList() {
		return this.menuInfoList == null ? null : menuInfoList.stream().collect(Collectors.toList());
	}	
	public void setMenuInfoList(List<ComMenuVO> menuInfoList) {
		this.menuInfoList = menuInfoList == null ? null : menuInfoList.stream().collect(Collectors.toList());
	}
}
