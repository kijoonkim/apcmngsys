package com.at.apcss.pd.isom.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InvShipOgnGenalTblMngVO extends ComVO{
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

	private String itemNm;
	private String itemCd;

	private String sttgUpbrItemSe;
	private String aprv;

	private String uoSpmtAmt;
	private String uoSpmtAmtOther;
	private String uoOtherSpmtAmt;
	private String uoOtherSpmtAmtOther;

	private String uoSpmtAmtRt;
	private String uoSpmtAmtTotRt;
	private String uoSpmtAmtTot;

	private String stbltYn;

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;


}
