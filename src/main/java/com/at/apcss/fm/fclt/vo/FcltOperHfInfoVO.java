package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltOperHfInfoVO extends ComVO{

	private String trgtYr;
	private String apcCd;
	private int sn;
	private String hireSeCd;
	private String ctznFrgnrSeCd;
	private int hireNope;
	private int hireNope2;
	private int hireNope3;
	private int hireNope4;
	private int hireNope0;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;
	@Override
	public String toString() {
		return "FcltOperHfInfoVO [trgtYr=" + trgtYr + ", apcCd=" + apcCd + ", sn=" + sn + ", hireSeCd=" + hireSeCd
				+ ", ctznFrgnrSeCd=" + ctznFrgnrSeCd + ", hireNope=" + hireNope + ", hireNope2=" + hireNope2
				+ ", hireNope3=" + hireNope3 + ", hireNope4=" + hireNope4 + ", hireNope0=" + hireNope0 + ", msgKey="
				+ msgKey + ", msgCn=" + msgCn + ", msgKnd=" + msgKnd + ", msgKndNm=" + msgKndNm + ", rmrk=" + rmrk
				+ "]";
	}

}




