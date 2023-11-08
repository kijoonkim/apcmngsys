package com.at.apcss.co.authrt.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComAuthrtMenuVO extends ComVO {

	private String authrtId;
	private String authrtNm;
	private String useYn;
	private String entyList;
	private String menuId;
	private String upMenuId;
	private String topMenuId;
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
	private String userId;
	private String authrtType;
	private String authrtRmrk;
	private List<String> authrtIdList;
	private String prsnaInfoYn;

	public List<String> getAuthrtIdList() {
		return this.authrtIdList == null ? null : authrtIdList.stream().collect(Collectors.toList());
	}

	public void setAuthrtIdList(List<String> authrtIdList) {
		this.authrtIdList = authrtIdList == null ? null : authrtIdList.stream().collect(Collectors.toList());
	}
}
