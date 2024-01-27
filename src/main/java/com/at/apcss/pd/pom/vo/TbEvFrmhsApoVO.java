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
	private String uoCd;
	private String apoSe;
	private String brno;
	private String uoBrno;
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

	private String aprv;//승인형 육성형
	private String aprvNm;
	private String trmtTypeNm;
	private String ecSpmtPlanVlmTot;//전속(약정)출하계획량
	private String ecSpmtVlmTot;//전속(약정)출하량
	private String ecSpmtRate;//출하비율
	private String spmtPrcTot;//출하대금지급액
	private String cnt;//조직원수
	private String stbltYn;//적합여부

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;


}
