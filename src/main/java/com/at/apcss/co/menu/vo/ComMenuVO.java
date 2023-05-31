package com.at.apcss.co.menu.vo;

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
	private String pageUrl;
	private String indctSeq;
	private String userType;
	private String apcCd;
	private String sysId;
	private String upMenuNm;
	private int menuSeq;
	private int menuLvl;
}
