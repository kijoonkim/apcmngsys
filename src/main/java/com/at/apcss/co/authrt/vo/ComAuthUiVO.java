package com.at.apcss.co.authrt.vo;

import com.at.apcss.co.menu.vo.ComUiVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComAuthUiVO extends ComUiVO {
	private String authrtId;
	private String authrtNm;
	private String authrtType;
	private String authrtRmrk;
	private String aplcnType;
	private String indctYn;
}
