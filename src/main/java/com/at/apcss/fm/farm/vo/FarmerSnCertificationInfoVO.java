package com.at.apcss.fm.farm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FarmerSnCertificationInfoVO extends ComVO{

	private String sn;
	private String frmerno;				//농업인 번호 FRMER_SN
	private String certNo;				//인증번호 CON_NUM
	private String certBgngYmd;			//인증시작일 EFFECTIVE_STRAT_DT
	private String certEndYmd;			//인증종료일 EFFECTIVE_END_DT
	private String certStts;			//인증정보 상태 STATE_NM
	private String ecfrdCertSeNm;		//친환경인증구분명 CONGB_NM
	private String ecfrdCertGroupSeNm;	//친환경인증그룹구분명 FARMERGB_NM
	private String grpNm;				//단체명 GROUPREQEN_NM
	private String ownrNm;				//농가주명 OWNER_NM
	private String certAddr;			//인증필지 CERT_ADDR
	private String sfc;					//면적 LAND_QTY

}
