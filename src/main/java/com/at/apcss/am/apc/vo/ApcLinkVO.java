package com.at.apcss.am.apc.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApcLinkVO extends ComVO {

	private String groupId;    // 연계그룹id
	
	private String rtnCd;
	private String rtnMsg;
	
	private String apcCd;
    private String apcNm;
	private String apcKey;
	
	private String trsmMatId;
	private String trsmMatNm;
	private String trsmMatSttsCd;
	private String sttsIdntyDt;
	
	private String sttsColor;
	
	private String linkKnd;    // W: 계량, R: 입고, S: 선별, P: 포장, D: 출하
	private String linkKndNm;
	private String linkStts;
	private String linkSttsNm;
	private String linkSttsColor;
	
	private String linkUseYn;
	private String reqYn;
	private String reqDt;
	private String reqCncltnDt;
	private String sndDt;
	private String sndCmptnDt;
	private String prcsDt;
	private String prcsCmptnDt;
	
	private String wghSttsCd;
	private String wrhsSttsCd;
	private String sortSttsCd;
	private String pckgSttsCd;
	private String spmtSttsCd;
	
	private String trsmMatSttsNm;
	private String wghSttsNm;
	private String wrhsSttsNm;
	private String sortSttsNm;
	private String pckgSttsNm;
	private String spmtSttsNm;
	
	private String wghDspDt;
	private String wrhsDspDt;
	private String sortDspDt;
	private String pckgDspDt;
	private String spmtDspDt;

	private String wghTrsmSttsCd;
	private String wrhsTrsmSttsCd;
	private String sortTrsmSttsCd;
	private String pckgTrsmSttsCd;
	private String spmtTrsmSttsCd;

	private String wghTrsmSttsNm;
	private String wrhsTrsmSttsNm;
	private String sortTrsmSttsNm;
	private String pckgTrsmSttsNm;
	private String spmtTrsmSttsNm;

	private String wghTrsmDspDt;
	private String wrhsTrsmDspDt;
	private String sortTrsmDspDt;
	private String pckgTrsmDspDt;
	private String spmtTrsmDspDt;
	
	private String trsmMatSttsColor;
	private String wghSttsColor;
	private String wrhsSttsColor;
	private String sortSttsColor;
	private String pckgSttsColor;
	private String spmtSttsColor;

	private String wghTrsmSttsColor;
	private String wrhsTrsmSttsColor;
	private String sortTrsmSttsColor;
	private String pckgTrsmSttsColor;
	private String spmtTrsmSttsColor;
	
	private String wghReqYn;
	private String wghReqDt;
	private String wghReqCncltnDt;
	private String wghSndDt;
	private String wghSndCmptnDt;
	private String wghPrcsDt;
	private String wghPrcsCmptnDt;
	private String wghLinkStts;
	private String wrhsReqYn;
	private String wrhsReqDt;
	private String wrhsReqCncltnDt;
	private String wrhsSndDt;
	private String wrhsSndCmptnDt;
	private String wrhsPrcsDt;
	private String wrhsPrcsCmptnDt;
	private String wrhsLinkStts;
	private String sortReqYn;
	private String sortReqDt;
	private String sortReqCncltnDt;
	private String sortSndDt;
	private String sortSndCmptnDt;
	private String sortPrcsDt;
	private String sortPrcsCmptnDt;
	private String sortLinkStts;
	private String pckgReqYn;
	private String pckgReqDt;
	private String pckgReqCncltnDt;
	private String pckgSndDt;
	private String pckgSndCmptnDt;
	private String pckgPrcsDt;
	private String pckgPrcsCmptnDt;
	private String pckgLinkStts;
	private String spmtReqYn;
	private String spmtReqDt;
	private String spmtReqCncltnDt;
	private String spmtSndDt;
	private String spmtSndCmptnDt;
	private String spmtPrcsDt;
	private String spmtPrcsCmptnDt;
	private String spmtLinkStts;

	private String wghTrsmReqYn;
	private String wghTrsmReqDt;
	private String wghTrsmReqCncltnDt;
	private String wghTrsmSndDt;
	private String wghTrsmSndCmptnDt;
	private String wghTrsmPrcsDt;
	private String wghTrsmPrcsCmptnDt;
	private String wghTrsmLinkStts;
	private String wrhsTrsmReqYn;
	private String wrhsTrsmReqDt;
	private String wrhsTrsmReqCncltnDt;
	private String wrhsTrsmSndDt;
	private String wrhsTrsmSndCmptnDt;
	private String wrhsTrsmPrcsDt;
	private String wrhsTrsmPrcsCmptnDt;
	private String wrhsTrsmLinkStts;
	private String sortTrsmReqYn;
	private String sortTrsmReqDt;
	private String sortTrsmReqCncltnDt;
	private String sortTrsmSndDt;
	private String sortTrsmSndCmptnDt;
	private String sortTrsmPrcsDt;
	private String sortTrsmPrcsCmptnDt;
	private String sortTrsmLinkStts;
	private String pckgTrsmReqYn;
	private String pckgTrsmReqDt;
	private String pckgTrsmReqCncltnDt;
	private String pckgTrsmSndDt;
	private String pckgTrsmSndCmptnDt;
	private String pckgTrsmPrcsDt;
	private String pckgTrsmPrcsCmptnDt;
	private String pckgTrsmLinkStts;
	private String spmtTrsmReqYn;
	private String spmtTrsmReqDt;
	private String spmtTrsmReqCncltnDt;
	private String spmtTrsmSndDt;
	private String spmtTrsmSndCmptnDt;
	private String spmtTrsmPrcsDt;
	private String spmtTrsmPrcsCmptnDt;
	private String spmtTrsmLinkStts;
	
	
	private String wghLinkUseYn;
	private String wrhsLinkUseYn;
	private String sortLinkUseYn;
	private String pckgLinkUseYn;
	private String spmtLinkUseYn;

	private String wghTrsmLinkUseYn;
	private String wrhsTrsmLinkUseYn;
	private String sortTrsmLinkUseYn;
	private String pckgTrsmLinkUseYn;
	private String spmtTrsmLinkUseYn;


	private String wrhsYmd;
	
}
