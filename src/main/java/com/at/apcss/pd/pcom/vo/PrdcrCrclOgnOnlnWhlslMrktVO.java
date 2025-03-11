package com.at.apcss.pd.pcom.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrdcrCrclOgnOnlnWhlslMrktVO extends ComVO{
	private String yr;
	private String apoCd;
	private String apoSe;
	private String apoSeNm;
	private String aprv;
	private String aprvNm;
	private String brno;
	private String uoBrno;
	private String crno;
	private String corpNm;
	private String uoCorpNm;

	private String chk;

	private String itemNmList;

	private String trgtTrmtAmt;
	private String consignTrgtAmt;
	private String consignCrtdTrgtAmt;
	private String totTrgtTrmtAmt;
	private String uoTotTrgtTrmtAmt;
	private String trgtTrmtRt;

	private String itemCd;
	private String itemNm;
	private String ctgryCd;
	private String ctgryNm;
	private String clsfCd;
	private String clsfNm;

	private String trmtAmt;
	private String consignTrmtAmt;

	private String trmtAmtTot;
	private String consignTrmtAmtTot;

	private String crtrAmt;

}
