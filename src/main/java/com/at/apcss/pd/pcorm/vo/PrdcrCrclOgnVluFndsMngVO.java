package com.at.apcss.pd.pcorm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrdcrCrclOgnVluFndsMngVO extends ComVO{
	private String yr;
	private String seq;//순번
	private String brno;
	private String corpNm;

	private String computWayCd;//산출식 코드
	private String computWayDtl;//산출식 상세
	private String computWayRslt;//산출식 상세
	private String fundArtcl;//항목
	private String fundArtclNm;//항목
	private String alt;//배점
	private String scr;//점수
	private String useYn;//사용유무
	private String rmrk;//비고

	private String ctgryCd;//부류
	private String ctgryNm;//부류
	private String slsTotAmt;//전문품목 총취급액
	private String slsTotAmtTot;//총취급액
	private String slsTotAmtRt;//전속취급율
	private String totPercCont;//기준총취급액
	private String rtPercCont;//기준전속취급율

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;

}
