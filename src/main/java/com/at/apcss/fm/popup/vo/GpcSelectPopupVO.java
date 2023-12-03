package com.at.apcss.fm.popup.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GpcSelectPopupVO extends ComVO{

	private String ctgryCd;//분류코드
	private String ctgryNm;//분류명
	private String itemCd;//품목코드
	private String itemNM;//품목명
	private String rmrk;//비고
}
