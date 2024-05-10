package com.at.apcss.fm.farm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FarmerEducationInfoRegVO extends ComVO{

	private String frmerno;			//농업인 번호 FRMER_SN
	private String mngmstRegno;		//경영체등록번호 BZOB_RGNO
	private String crclmCd;			//교육과정코드 EDU_COS_CD
	private String flNm;			//성명 NAME
	private String ednstNm;			//교육기관명 EDU_ORG_NM
	private String crclmNm;			//교육과정명 EDU_COS_NM
	private String eduBgngYmd;		//교육시작일자 EDU_STR_DT
	private String eduEndYmd;		//교육종료일자 EDU_END_DT
	private String idntyYn;			//확인여부 CNFM_YN

}
