package com.at.apcss.pd.pcom.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrdcrCrclOgnPurSalMngVO extends ComVO{
	private String yr;
	private String apoCd;
	private String apoSe;
	private String aprv;
	private String brno;
	private String corpNm;
	private String ccCode;
	private String crno;
	private String ctgryCd;
	private String itemCd;
	private String ctgryNm;
	private String itemNm;
	private String sttgUpbrItemSe;
	private String sttgUpbrItemNm;

	private String prchsSlsSe;
	private String prchsSlsSeNm;
	//매입
	private String prchsTrstVlm;
	private String prchsTrstAmt;
	private String prchsEmspapVlm;
	private String prchsEmspapAmt;

	private String prchsTotVlm;
	private String prchsTotAmt;
	private String orgPrchsTotAmt;

	//매출
	private String slsCprtnSortTrstVlm;
	private String slsCprtnSortTrstAmt;
	private String slsCprtnTrstVlm;
	private String slsCprtnTrstAmt;
	private String slsCprtnSortEmspapVlm;
	private String slsCprtnSortEmspapAmt;
	private String slsSmplTrstVlm;
	private String slsSmplTrstAmt;
	private String slsSmplEmspapVlm;
	private String slsSmplEmspapAmt;

	private String slsTotVlm;
	private String slsTotAmt;
	private String orgSlsTotAmt;

	private String slsTrstVlm;
	private String slsTrstAmt;
	private String slsEmspapVlm;
	private String slsEmspapAmt;

	private String ddcVlm;
	private String ddcAmt;

	/*출하실적*/

	private String pblcWhlslMrktVlm;//공영 도매시장 물량
	private String pblcWhlslMrktAmt;//공영 도매시장 금액

	private String onlnWhlslMrktVlm;//온라인 도매시장 물량
	private String onlnWhlslMrktAmt;//온라인 도매시장 금액

	private String lgszRtlVlm;//대형 유통업체 물량
	private String lgszRtlAmt;//대형 유통업체 금액

	private String armyDlvgdsVlm;//군납 물량
	private String armyDlvgdsAmt;//군납 금액

	private String eatoutMtrlMlsrVlm;//외식 식자재 및 단체급식 물량
	private String eatoutMtrlMlsrAmt;//외식 식자재 및 단체급식 금액

	private String mnfcRtlVlm;//가공업체 물량
	private String mnfcRtlAmt;//가공업체 금액

	private String exprtVlm;//수출 물량
	private String exprtAmt;//수출 금액

	private String onlnDlngPrfmncVlm;//온라인 거래실적 (e커머스, TV홈쇼핑 등 포함) 물량
	private String onlnDlngPrfmncAmt;//온라인 거래실적 (e커머스, TV홈쇼핑 등 포함) 금액

	private String etcVlm;//기타 물량
	private String etcAmt;//기타 금액

	private String rmrk;

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;


}
