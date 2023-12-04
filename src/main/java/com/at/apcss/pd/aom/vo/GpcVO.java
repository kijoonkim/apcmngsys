package com.at.apcss.pd.aom.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GpcVO extends ComVO{
	private String apoCd;			//산지유통조직코드
	private String apoSe;			//산지유통조직구분
	private String brno;			//사업자번호
	private String corpNm;			//법인명
	private String crno;			//법인등록번호

	private String yr;				//년도
	private String sttgUpbrItemSe;	//품목구분(전문품목,육성품목)
	private String ctgryCd;			//분류코드
	private String ctgryNm;			//분류명
	private String itemCd;			//품목코드
	private String itemNm;			//품목명
	private String rmrk;			//비고



	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;


}

