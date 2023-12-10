package com.at.apcss.pd.isom.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class InvShipOgnPurSalMngVO extends ComVO{
	private String yr;
	private String apoCd;
	private String apoSe;
	private String brno;
	private String ccCode;
	private String crno;
	private String ctgryCd;
	private String itemCd;
	private String ctgryNm;
	private String itemNm;

	private String prchsTrstVlm;
	private String prchsTrstAmt;
	private String prchsEmspapVlm;
	private String prchsEmspapAmt;

	private String slsTrstVlm;
	private String slsTrstAmt;
	private String slsEmspapVlm;
	private String slsEmspapAmt;

	private String ddcExprtVlm;
	private String ddcExprtAmt;
	private String ddcVlm;
	private String ddcAmt;
	private String ddcArmyDlvgdsVlm;
	private String ddcArmyDlvgdsAmt;
	private String ddcMlsrVlm;
	private String ddcMlsrAmt;

	private String ajmtVlm;
	private String ajmtAmt;

	private String rmrk;

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;


}
