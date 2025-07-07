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

	/*인정여부 추가*/
	private String rcgnYn;
	private String rcgnTrmtAmtTot;
	private String rmrk;

	/**
	 * 선정년도
	 */
	private String slctnYr;

	/**
	 * 총 취급실적 대비 온라인 도매시장 금액 취급률
	 */
	private double trmtAmtRt;

	/**
	 * 총 취급실적 대비 온라인 도매시장 물량 취급률
	 */
	private double trmtVlmRt;

	/**
	 * 취급물량
	 */
	private int trmtVlm;

	/**
	 * 위탁판매취급물량
	 */
	private int cnsgnNtslTrmtVlm;

	/**
	 * 통합조직 총 매출현황 물량 합계
	 */
	private int slsTotVlm;

	/**
	 * 통합조직 총 매출현황 금액 합계
	 */
	private int slsTotAmt;

	/**
	 * 품목구분(전문품목,육성품목)
	 */
	private String sttgUpbrItemSe;

	/**
	 * 품목구분명
	 */
	private String sttgUpbrItemSeNm;

	/**
	 * 물량 소계
	 */
	private String trmtVlmTot;
}
