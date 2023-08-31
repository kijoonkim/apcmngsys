package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltGdsMchnInfoVO extends ComVO{

	private String trgtYr;
	private String apcCd;
	private int sn;
	private String sortMchnItemCd;
	private String sortMchnCd;
	private String sortMchnSpcfct;
	private String sortMchnHldYn;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;
	@Override
	public String toString() {
		return "FcltGdsMchnInfoVO [trgtYr=" + trgtYr + ", apcCd=" + apcCd + ", sn=" + sn + ", sortMchnItemCd="
				+ sortMchnItemCd + ", sortMchnCd=" + sortMchnCd + ", sortMchnSpcfct=" + sortMchnSpcfct
				+ ", sortMchnHldYn=" + sortMchnHldYn + ", msgKey=" + msgKey + ", msgCn=" + msgCn + ", msgKnd=" + msgKnd
				+ ", msgKndNm=" + msgKndNm + ", rmrk=" + rmrk + "]";
	}

	}






