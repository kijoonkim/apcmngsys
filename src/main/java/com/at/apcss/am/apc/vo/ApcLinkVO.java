package com.at.apcss.am.apc.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApcLinkVO  extends ComVO{

	private String linkKnd;

	private String apcCd;
	private String apcKey;
	private String wghReqYn;
	private String wghReqDt;
	private String wghPrcsDt;
	private String wrhsReqYn;
	private String wrhsReqDt;
	private String wrhsPrcsDt;
	private String sortReqYn;
	private String sortReqDt;
	private String sortPrcsDt;
	private String pckgReqYn;
	private String pckgReqDt;
	private String pckgPrcsDt;
	private String spmtReqYn;
	private String spmtReqDt;
	private String spmtPrcsDt;
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
	
}
