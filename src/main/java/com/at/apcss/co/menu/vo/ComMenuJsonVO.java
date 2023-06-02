package com.at.apcss.co.menu.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComMenuJsonVO {
	private String id;
	private String pid;
	private int order;
	private String text;
	private String link;
	private String value;
	private String topMenuNm;
	private String url;
}
