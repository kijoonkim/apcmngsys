package com.apcmngsys.apcss.fm.popup.vo;

import com.apcmngsys.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApcSelectPopupVO extends ComVO{

	private String apcCd;//apc코드
	private String apcNm;//apc명

	private String userId;
	private String userType;

}
