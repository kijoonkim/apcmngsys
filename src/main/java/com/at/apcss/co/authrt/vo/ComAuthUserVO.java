package com.at.apcss.co.authrt.vo;

import com.at.apcss.co.user.vo.ComUserVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComAuthUserVO extends ComUserVO {
	private String authrtId;
	private String authrtNm;
}
