package com.at.apcss.pd.pcom.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ItemUoStbltYnVO extends ComVO{
	private String yr;
	private String slctnYr;

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
	private String corpSeNm;
	private String corpDtlSeCd;
	private String corpDtlSeNm;

	private String itemNm;
	private String itemCd;

	private String ctgryNm;
	private String ctgryCd;

	private String sttgUpbrItemSe;
	private String sttgUpbrItemNm;
	private String aprv;
	private String aprvNm;

	private String slsCnsgnSlsAmt;
	private String slsCnsgnSlsAmtTot;
	private String slsCnsgnSlsAmtRt;

	/*예외*/
	private String chkItemA; /*CTGRY_CD 2*/
	private String chkItemB; /*CTGRY_CD 3*/

	/* 총취급액 최저 금액 */
	private String chkAmtTotAA;
	private String chkAmtTotAB;
	private String chkAmtTotAC;

	private String chkAmtTotBA;
	private String chkAmtTotBB;
	private String chkAmtTotBC;

	private String chkAmtTotCA;
	private String chkAmtTotCB;
	private String chkAmtTotCC;

	/* 총취급액 전속 취급률 기준 금액 */
	private String chkAA;
	private String chkAB;
	private String chkAC;

	private String chkBA;
	private String chkBB;
	private String chkBC;

	/*전속취급률 */
	private String chkRtAA;
	private String chkRtAB;
	private String chkRtAC;

	private String chkRtBA;
	private String chkRtBB;
	private String chkRtBC;

	private String chkRtC;

	private String stbltYn;
	private String orgStbltYn;

	private String actnMttr;

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;

}
