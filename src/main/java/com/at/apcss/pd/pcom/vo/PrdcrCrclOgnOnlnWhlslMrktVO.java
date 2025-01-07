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
	private String aprv;
	private String brno;
	private String crno;
	private String corpNm;

	private String chk;

	private String itemNmList;

	private String trgtTrmtAmt;
	private String consignTrgtAmt;
	private String consignCrtdTrgtAmt;
	private String totTrgtTrmtAmt;
	private String uoTotTrgtTrmtAmt;
	private String trgtTrmtRt;

}
