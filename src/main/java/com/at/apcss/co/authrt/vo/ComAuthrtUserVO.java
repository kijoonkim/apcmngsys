package com.at.apcss.co.authrt.vo;

import com.at.apcss.co.user.vo.ComUserVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComAuthrtUserVO extends ComUserVO {
	private String authrtId;
	private String authrtNm;
	private String authrtType;
	private String flfmtTaskSeCd;
	private int authrtFg;
	private int sn;
}
