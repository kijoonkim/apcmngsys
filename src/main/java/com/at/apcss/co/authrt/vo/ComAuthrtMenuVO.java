package com.at.apcss.co.authrt.vo;

import com.at.apcss.co.menu.vo.ComMenuVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComAuthrtMenuVO extends ComMenuVO {
	private String authrtId;
	private String authrtNm;
	private String useYn;
}
