package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltOperInfoVO extends ComVO{

	private String trgtYr;
	private String apcCd;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String daddr;
	private String apcBrno;
	private String apcRgnCd;
	private String apcNm;
	private String apcAddr;
	private String psnOgnzNm;
	private String psnOgnzBrno;
	private String operOgnzCd;
	private String operOgnzPic;
	private String operOgnzNm;
	private String operOgnzBrno;
	private String operOgnzDeptCd;
    private String operOgnzDeptNm;
    private String operOgnzTrmtItemCd;
    private String operOgnzTrmtItemCn2;
    private String operOgnzTrmtItemCn3;
    private String operOgnzTrmtItemCn4;
    private String operOgnzTrmtItemCn;
    private String apcTrmtItemCd;
    private String apcTrmtItemCn2;
    private String apcTrmtItemCn3;
    private String apcTrmtItemCn4;
    private String apcTrmtItemCn;
	@Override
	public String toString() {
		return "FcltOperInfoVO [trgtYr=" + trgtYr + ", apcCd=" + apcCd + ", msgKey=" + msgKey + ", msgCn=" + msgCn
				+ ", msgKnd=" + msgKnd + ", msgKndNm=" + msgKndNm + ", daddr=" + daddr + ", apcBrno=" + apcBrno
				+ ", apcRgnCd=" + apcRgnCd + ", apcNm=" + apcNm + ", apcAddr=" + apcAddr + ", psnOgnzNm=" + psnOgnzNm
				+ ", psnOgnzBrno=" + psnOgnzBrno + ", operOgnzCd=" + operOgnzCd + ", operOgnzNm=" + operOgnzNm
				+ ", operOgnzBrno=" + operOgnzBrno + ", operOgnzDeptCd=" + operOgnzDeptCd + ", operOgnzDeptNm="
				+ operOgnzDeptNm + ", operOgnzTrmtItemCd=" + operOgnzTrmtItemCd + ", operOgnzTrmtItemCn="
				+ operOgnzTrmtItemCn + ", apcTrmtItemCd=" + apcTrmtItemCd + ", apcTrmtItemCn=" + apcTrmtItemCn + "]";
	}

}











