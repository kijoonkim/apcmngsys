package com.at.apcss.pd.pcom.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrdcrCrclOgnSpItmPurSalNMngVO extends ComVO{
	private String seNm;
	private String seDtlNm;
	private String prchsNm;
	private String uoSeNm;
	private String flnm;
	private String slsCnsgnPrchsAmt;
	private String slsCnsgnSlsAmt;
	private String uoSpmtAmt;
	private String uoOtherSpmtAmt;
	private String SpmtAmtTot;

	private String slsCnsgnPrchsVlm;
	private String slsCnsgnSlsVlm;
	private String uoSpmtVlm;
	private String uoOtherSpmtVlm;
	private String SpmtVlmTot;

	private String rmrk;

	private String apoCd;
	private String apoSe;
	private String brno;
	private String uoBrno;
	private String crno;
	private String yr;
	private String clsfCd;
	private String clsfNm;
	private String ctgryCd;
	private String ctgryNm;
	private String itemCd;
	private String itemNm;
	private String isoBrno;
	private String prdcrOgnzSn;
	private String prdcrOgnzCd;
	private String prdcrOgnzNm;
	private String cltvtnLandSn;
	private String trmtType;
	private String trmtTypeNm;
	private String sttgUpbrItemSe;
	private String sttgUpbrItemNm;

	private String stbltYn; // 적합여부
	private String ognzStbltYn; // 조직 적합여부
	private String lastStbltYn; // 선정여부

	private String typeSe; //실적 구분  1~6
	private String typeSeNo; //실적 구분 상세 출자출하조직 brno , 생산자조직 sn 값 적용

	private String sysFrstInptUserIdNm;
	private String sysLastChgUserIdNm;
	private String sysFrstInptDtYmd;
	private String sysLastChgDtYmd;

	/* 20250117 임시저장 추가 */
	private String tmprStrgYn;
	private String tmprStrgRsn;
	private String tmprStrgDt;

}
