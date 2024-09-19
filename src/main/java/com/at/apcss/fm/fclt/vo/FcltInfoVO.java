package com.at.apcss.fm.fclt.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltInfoVO extends ComVO{

	private String trgtYr;
	private String apcCd;
	private String apcNm;

	private String fcltCd;
	private String fcltNm;
	private String fcltAreaTot;
	private String fcltArea01;
	private String fcltArea02;
	private String fcltArea03;
	private String fcltArea04;
	private String fcltArea05;
	private String fcltArea06;
	private String fcltArea07;
	private String fcltArea08;
	private String fcltArea09;
	private String fcltArea10;
	private String fcltRmrkTot;
	private String fcltRmrk01;
	private String fcltRmrk02;
	private String fcltRmrk03;
	private String fcltRmrk04;
	private String fcltRmrk05;
	private String fcltRmrk06;
	private String fcltRmrk07;
	private String fcltRmrk08;
	private String fcltRmrk09;
	private String fcltRmrk10;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;

	//테이블 변경으로 추가
	private String prgrsYn;//진척도 갱신 여부
	private String tmprStrgYn;//임시저장 여부
	private String crtrYr;
	private String cspTotArea;
	private String cspTotRmrk;
	private String cspCfppArea;
	private String cspCfppRmrk;
	private String cspClnOprtngPrcsArea;
	private String cspClnOprtngPrcsRmrk;
	private String cspDtpArea;
	private String cspDtpRmrk;
	private String cspNgdsFcltArea;
	private String cspNgdsFcltRmrk;
	private String strgPlcPrcPlcArea;
	private String strgPlcPrcPlcRmrk;
	private String strgPlcLwtpStrgArea;
	private String strgPlcLwtpStrgRmrk;
	private String strgPlcCaStrgPlcArea;
	private String strgPlcCaStrgPlcRmrk;
	private String strgPlcCurnArea;
	private String strgPlcCurnRmrk;
	private String strgPlcGnrlStrgArea;
	private String strgPlcGnrlStrgRmrk;
	private String strgPlcEtcArea;
	private String strgPlcEtcRmrk;

	private String userId;
	private String userType;
}
