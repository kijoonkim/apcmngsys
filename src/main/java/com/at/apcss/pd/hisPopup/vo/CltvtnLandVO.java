
package com.at.apcss.pd.hisPopup.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CltvtnLandVO extends ComVO{

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
	//생산자조직
	private String prdcrOgnzSn;
	private String prdcrOgnzCd;
	private String prdcrOgnzNm;

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

	//농가 정보
	private String flnm;
	private String cltvtnLandAddr;
	private String cltvtnSfc;
	private String avgYrPrdctnVlm;
	private String ecCltvtnSfc;
	private String ecSpmtPlanVlm;
	private String ecSpmtVlm;
	private String spmtPrc;
	private String joinDay;
	private String cltvtnAreaRmrk;

	private String prdctnPlanVlm;
	private String prdctnVlm;

	private String rmrk;

}
