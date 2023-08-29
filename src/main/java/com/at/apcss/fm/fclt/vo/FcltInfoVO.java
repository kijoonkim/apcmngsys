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
	private String rmrk;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	@Override
	public String toString() {
		return "FcltInfoVO [trgtYr=" + trgtYr + ", apcCd=" + apcCd +  ", fcltCd=" + fcltCd + ", fcltNm="
				+ fcltNm + ", fcltArea=" + fcltArea + ", rMRK=" + rmrk + ", msgKey=" + msgKey + ", msgCn=" + msgCn
				+ ", msgKnd=" + msgKnd + ", msgKndNm=" + msgKndNm + "]";
	}
}
