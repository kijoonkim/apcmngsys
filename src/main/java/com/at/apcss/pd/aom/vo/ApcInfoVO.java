package com.at.apcss.pd.aom.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApcInfoVO extends ComVO{

	private String brno;

	private String apcCd;
	private String crtrYr;
	private String rprsv;
	private String apcLoctn;
	private String apcLoctnDtl;

	private String apcTrmtVlmTot;
	private String apcTrmtAmtTot;

	private String apcItemNm1;
	private String apcItemNm2;
	private String apcItemNm3;

}

