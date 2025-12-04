package com.apcmngsys.apcss.co.authrt.vo;

import com.apcmngsys.apcss.co.menu.vo.ComUiVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComAuthrtUiVO extends ComUiVO {
	private String userId;
	private String authrtId;
	private String authrtNm;
	private String authrtType;
	private String authrtExpln;

	private String aplcnType;
	private String aplcnTypeNm;
	private String indctYn;
	private String apcCd;
	private String useYn;
	
	private String accessUseYn;
	private String accessYn;
	private String indctUseYn;
	
	
}
