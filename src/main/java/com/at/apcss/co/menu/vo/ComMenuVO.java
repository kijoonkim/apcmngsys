package com.at.apcss.co.menu.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComMenuVO extends ComVO {

	private String menuId;
	private String upMenuId;
	private String menuNm;
	private String menuType;
	private String menuTypeNm;
	private String pageUrl;
	private int indctSeq;
	private String userType;
	private String apcCd;
	private String sysId;
	private String upMenuNm;
	private int menuSeq;
	private int menuLvl;
	private String prsnaInfoYn;
	private String authrtType;
	
	private List<String> authrtTypeList;
	public List<String> getAuthrtTypeList() {
		return this.authrtTypeList == null ? null : authrtTypeList.stream().collect(Collectors.toList());
	}	
	public void setAuthrtTypeList(List<String> authrtTypeList) {
		this.authrtTypeList = authrtTypeList == null ? null : authrtTypeList.stream().collect(Collectors.toList());
	}
}
