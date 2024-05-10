package com.at.apcss.fm.farm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FarmLandGrantsInfoVO extends ComVO{

	private String sn;

	private String frmerno;		//농업인 번호 FRMER_SN
	private String pnuCd;		//PNU 코드 PNU_CODE
	private String bizBgngYmd;	//사업 시작일 BSNS_BGNDE
	private String bizEndYmd;	//사업 종료일 BSNS_ENDDE
	private String bizCd;		//사업 코드 BSNS_CODE
	private String bizNm;		//사업 명 BSNS_NM
	private String stts;		//상태 STTUS
	private String aplcntNm;	//신청인 명 APPLCNT_NM
	private String ldgrSe;		//대장구분 LDGRFL
	private String frlnAddr;	//농지주소 FRLND_ADRES
	private String stdgCd;		//법정동 코드 LEGALDONG_CODE
	private String mno;			//본번 MNNM
	private String sno;			//부번 SLNO
	private String aplySfc;		//신청면적 REQST_AR

}
