package com.at.apcss.pd.pcom.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrdcrCrclOgnGenalTblMngVO extends ComVO{
	private String yr;
	private String apoCd;
	private String uoCd;
	private String apoSe;
	private String brno;
	private String uoBrno;
	private String crno;
	private String corpNm;
	private String ctpv;
	private String sgg;
	private String cmptnInst;
	private String corpSeCd;
	private String corpDtlSeCd;

	private String aprv;

	private String stbltYn;

	private String itemNm;
	private String itemCd;

	private String sttgUpbrItemSe;
	private String sttgUpbrItemNm;

	private String ctgryCd;
	private String ctgryNm;

	private String totTrmtPrfmnc;//통합조직총취급액(A)
	private String totSpmtPrfmnc;//생산자조직 전속출하액
	private String totTrmtRt;//전속취급률

	private String prfmncCorpDdlnYn;//실적 법인체 마감

	private String actnMttr;//조치사항

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;

}
