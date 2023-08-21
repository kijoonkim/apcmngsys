package com.at.apcss.fm.spmt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SpmtEnggtInfoMngVO extends ComVO{

	private String apcCd;
	private String SPMTNO;
	private String PCKGNO;
	private int    pckgSn;
	private String vrtyCd;
	private String gdsSeCd;
	private String spcfctCd;
	private int    spmtQntt;
	private int    spmtWght;
	private String pckgSeCd;
	private String brndCd;
	private String gdsCd;
	private String prdcrCd;
	private String spmtCmndno;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;
}

