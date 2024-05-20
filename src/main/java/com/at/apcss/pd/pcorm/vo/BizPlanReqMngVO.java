package com.at.apcss.pd.pcorm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BizPlanReqMngVO extends ComVO{
	private String yr;	//등록년도
	private String seq;	//순번
	private String brno;	//사업자번호
	private String corpNm;	//법인명
	private String apoCd;	//산지유통조직코드
	private String apoSe;	//산지유통조직구분
	private String crno;	//법인번호

	private String lastUldDt;	//최종업로드시간

	private String bizPlanSbmsnYn;	//사업계획서 제출여부
	private String bizPlanAprvYn;	//사업계획서 승인여부

	private String sgntrSbmsnYn;	//서명서 제출여부
	private String sgntrAprvYn;	//서명서 승인여부

	private String rmrk;	//비고

}
