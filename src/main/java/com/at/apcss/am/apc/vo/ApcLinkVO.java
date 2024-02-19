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

}
