package com.at.apcss.pd.pom.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TbEvFrmhsApoVO extends ComVO{
	//생산자조직 TB_EV_FRMHS_APO
	private String yr;
	private String apoCd;
	private String apoSe;
	private String brno;
	private String crno;
	private String corpNm;

	private String sttgUpbrItemSe;
	private String ctgryCd;
	private String ctgryNm;
	private String itemCd;
	private String itemNm;
	private String trmtType;
	private String prdcrOgnzSn;
	private String prdcrOgnzCd;
	private String prdcrOgnzNm;
	private String rmrk;

	private String ecSpmtPlanVlmTot;
	private String ecSpmtVlmTot;
	private String ecSpmtRate;
	private String spmtPrcTot;
	private String cnt;

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;


}
