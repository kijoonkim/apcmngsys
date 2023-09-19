package com.at.apcss.fm.spmt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SpmtEnggtInfoMngVO extends ComVO{

	private String apcCd;
	private String spmtNo;
	private String pckgNo;
	private int    pckgSn;
	private String itemCd;
	private String itemNm;
	private String vrtyCd;
	private String vrtyNm;
	private String gdsSeCd;
	private String spcfctCd;
	private int    prdctnQntt;
	private int    spmtQntt;
	private int    spmtWght;
	private String pckgSeCd;
	private String brndCd;
	private String gdsCd;
	private String prdcrCd;
	private String spmtCmndno;
	private int cltvtnArea;
	private String spmtType;
	private String trmtType;
	private String spmtStrDt;
	private String spmtEndDt;
	private String rmrk;
	private String delYn;

    private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;

}

