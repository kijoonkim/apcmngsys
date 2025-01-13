
package com.at.apcss.pd.hisPopup.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class IsoSpItmPurSalVO extends ComVO{

	private String yr;//등록년도
	//조직 정보
	private String apoCd;
	private String apoSe;
	private String apoSeNm;
	private String brno;
	private String crno;
	private String corpNm;
	private String uoBrno;
	private String uoCorpNm;
	private String aprv;
	private String aprvNm;

	//품목 에 속하는 정보
	private String itemCd;
	private String itemNm;
	private String ctgryCd;
	private String ctgryNm;
	private String clsfCd;
	private String clsfNm;
	private String sttgUpbrItemSe;
	private String sttgUpbrItemNm;
	private String trmtType;
	private String trmtTypeNm;

	//전문품목 매입매출 정보
	private String seNm;
	private String seDtlNm;
	private String prchsNm;
	private String flnm;
	private String slsCnsgnPrchsAmt;
	private String uoSpmtAmt;
	private String uoOtherSpmtAmt;
	private String SpmtAmtTot;

	private String slsCnsgnPrchsVlm;
	private String uoSpmtVlm;
	private String uoOtherSpmtVlm;
	private String SpmtVlmTot;

	private String rmrk;

	private String typeSeNoNm;

	private String isoBrno;
	private String prdcrOgnzSn;
	private String prdcrOgnzCd;
	private String prdcrOgnzNm;
	private String cltvtnLandSn;

	private String stbltYn; // 적합여부
	private String ognzStbltYn; // 조직 적합여부
	private String lastStbltYn; // 선정여부

	private String typeSe; //실적 구분  1~6
	private String typeSeNo; //실적 구분 상세 출자출하조직 brno , 생산자조직 sn 값 적용
}
