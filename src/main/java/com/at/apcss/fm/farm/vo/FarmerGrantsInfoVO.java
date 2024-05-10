package com.at.apcss.fm.farm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FarmerGrantsInfoVO extends ComVO{

	private String sn;
	private String frmerno;			//농업인 번호 FRMER_SN
	private String bizBgngYmd;		//사업 시작일 BSNS_BGNDE
	private String bizEndYmd;		//사업 종료일 BSNS_ENDDE
	private String cmptncInst;		//관할기관 CMPTINST
	private String bizCd;			//사업 코드 BSNS_CODE
	private String bizNm;			//사업 명 BSNS_NM
	private String rcfvrsNm;		//수혜자 명 RCVFVEN_NM
	private String govFnncng;		//국고 융자 NTNRS_FINANC
	private String lcLtExpndFnncng;	//지방비 융자 LLX_FINANC
	private String govSbsds;		//국고 보조금 GOVSUBY
	private String lcltExpndSbsds;	//지방비 보조금 LLXSBSIDY
	private String prcsSys;			//처리 시스템 PROCESS_SYS

}
