package com.at.apcss.fm.spmt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SpmtEnggtInfoMngVO extends ComVO{

	private String apcCd;
	private String apcNm;
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
	private String prdcrNm;
	private String spmtCmndno;
	private int cltvtnArea;
	private String spmtType;
	private String trmtType;
	private String spmtStrDt;
	private String spmtEndDt;
	private String rmrk;
	private String delYn;

	//0921추가
	private String dtlMttr;
	private String qltGrd;
	private int prc;
	private String prcPblnt;
	private String unit;
	private String prcGiveDt;
	private String spclMttr;
	private int advncPay;
	private String apcCd2;
	private String apcNm2;
	private String apcCd3;
	private String apcNm3;

    private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;

}

