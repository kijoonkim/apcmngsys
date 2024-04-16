package com.at.apcss.am.apc.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApcLinkVO  extends ComVO{

	private String linkKnd;		// W: 계량, R:입고, S:선별, P:포장, D:출하
	private String linkStts;	//  
	
	private String groupId;		// 연계그룹id
	
	private String rtnCd;
	private String rtnMsg;
	
	private String apcCd;
	private String apcKey;
	
	private String trsmMatSttsCd;
	private String sttsIdntyDt;

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
	
	private String trsmMatSttsColor;
	private String wghSttsColor;
	private String wrhsSttsColor;
	private String sortSttsColor;
	private String pckgSttsColor;
	private String spmtSttsColor;
	
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
	
}
