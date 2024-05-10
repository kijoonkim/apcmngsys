package com.at.apcss.fm.farm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NonCompliantFarmerInfoRegVO extends ComVO{

	private String sn;

	private String frmerno;			//농업인 번호 FRMER_SN
	private String bizYr;			//사업 년도 BSNS_YEAR
	private String bizNm;			//사업 명 BSNS_NM
	private String vltnCn;			//위반 내용 VIOLT_CN
	private String sncnsBgngYr;		//제재 시작 년도 PUNSH_BEGIN_DT
	private String sncnsEndYr;		//제재 종료 년도 PUNSH_END_DT
	private String rdmPrgrsCd;		//환수 진행 코드 REDEMP_PROGRS_DTLS
	private String rdmTrgtPrncpl;	//환수 대상 원금 REDEMP_TRGET_PRNCPAL
	private String rdmTrgtAmt;		//환수 대상 금액 REDEMP_TRGET_AMOUNT

}
