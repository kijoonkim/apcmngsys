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
	private String itemNm;//품목명
	private String rmrk;//비고
	private String brno;//사업자등록번호
	private String corpNm;//법인명
	private String selType;//조회 타입
	private String yr;//등록년도
	//20241202 추가
	private String clsfCd;//신규 부류코드
	private String sttgUpbrItemSe;//전문/육성 구분
	private String sttgUpbrItemNm;//전문/육성 구분
}
