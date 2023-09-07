package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltInfoVO extends ComVO{

	private String trgtYr;
	private String apcCd;
	private String fcltCd;
	private String fcltNm;
	private String fcltArea;
	private String fcltArea2;
	private String fcltArea3;
	private String fcltArea4;
	private String fcltArea5;
	private String fcltArea6;
	private String fcltArea7;
	private String fcltArea8;
	private String fcltArea9;
	private String fcltArea10;
	private String fcltArea0;
	private String fcltRmrk;
	private String fcltRmrk2;
	private String fcltRmrk3;
	private String fcltRmrk4;
	private String fcltRmrk5;
	private String fcltRmrk6;
	private String fcltRmrk7;
	private String fcltRmrk8;
	private String fcltRmrk9;
	private String fcltRmrk10;
	private String fcltRmrk0;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	@Override
	public String toString() {
		return "FcltInfoVO [trgtYr=" + trgtYr + ", apcCd=" + apcCd +  ", fcltCd=" + fcltCd + ", fcltNm="
				+ fcltNm + ", fcltArea=" + fcltArea + ", rMRK=" + fcltRmrk + ", msgKey=" + msgKey + ", msgCn=" + msgCn
				+ ", msgKnd=" + msgKnd + ", msgKndNm=" + msgKndNm + "]";
	}
}
