
package com.at.apcss.pd.hisPopup.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UoSpItmPurSalVO extends ComVO{

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

	//생산자조직 정보
	private String prdcrOgnzCd;
	private String prdcrOgnzNm;

	private String ecSpmtPlanVlmTot;//전속(약정)출하계획량
	private String ecSpmtVlmTot;//전속(약정)출하량
	private String ecSpmtRate;//출하비율
	private String ecSpmtRateA;//출하비율A
	private String ecSpmtRateB;//출하비율B
	private String spmtPrcTot;//출하대금지급액
	private String prdctnVlmTot;//생산량(결과)
	private String cnt;//조직원수
	private String orgStbltYn;//적합여부
	private String lastStbltYn;//최종 선정여부
	private String exclYn;//제외 여부

	private String cltvtnLandSn;
	private String flnm;
	private String cltvtnLandAddr;

	private String joinDay;
	private String whdwlDay;

	private String cltvtnSfc;//cltvtnArea -> cltvtnSfc 컬럼 표준화로 변경됨
	private String ecCltvtnSfc;
	private String avgYrPrdctnVlm;
	private String cltvtnAreaRmrk;

	private String prdctnPlanVlm;
	private String ecSpmtPlanVlm;
	private String planRmrk;
	private String prdctnVlm;
	private String ecSpmtVlm;
	private String spmtPrc;
	private String spmtRmrk;

	private String rmrk;
}
