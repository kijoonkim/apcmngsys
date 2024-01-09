package com.at.apcss.fm.popup.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ItemSelectPopupVO extends ComVO{

	private String itemCd;//품목코드
	private String itemNm;//품목명
	private String ctgryCd;//분류코드
	private String ctgryNm;//분류명
	private String brno;//사업자번호
	private String corpNm;//사업자번호
	private String yr;//년도

	private String sttgUpbrItemSe;//품목구분

}

