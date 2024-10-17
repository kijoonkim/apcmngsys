package com.at.apcss.fm.fclt.vo;

import java.util.List;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltDtaMngInfoVO extends ComVO{

	private String trgtYr;
	//private String apcCd;
	//private String apcNm;
	private int sn;
	private String fcltSysInstlCd;
	private String fcltSysHldYn;
	private String fcltSysLinkCd;
	private String fcltSysMngCd;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String rmrk;
	private String fcltSysHldYn2;
	private String fcltSysHldYn3;
	private String fcltSysHldYn4;
	private String fcltSysHldYn5;
	private String fcltSysHldYn6;
	private String fcltMng ;
	private String fcltMng2;
	private String fcltMng3;
	private String fcltMng4;
	private String fcltMng5;
	private String fcltMng6;

	/* 테이블 변경으로 추가 */
	private String prgrsYn;//진척도 갱신 여부
	private String tmprStrgYn;//임시저장 여부
	private String apcCd;
	private String apcNm;
	private String crtrYr;
	private String prdctnInfoLinkSttn;
	private String prdctnInfoMngMthd;
	private String wrhsInfoLinkSttn;
	private String wrhsInfoMngMthd;
	private String sortInfoLinkSttn;
	private String sortInfoMngMthd;
	private String strgInfoLinkSttn;
	private String strgInfoMngMthd;
	private String pckgInfoLinkSttn;
	private String pckgInfoMngMthd;
	private String spmtInfoLinkSttn;
	private String spmtInfoMngMthd;
	/* 20240828 작업정보 추가 */
	private String jobInfoLinkSttn;
	private String jobInfoMngMthd;

	private String prdctnDtl;
	private String wrhsDtl;
	private String sortDtl;
	private String strgDtl;
	private String pckgDtl;
	private String jobDtl;
	private String spmtDtl;

	private String prdctnDtlEtc;
	private String wrhsDtlEtc;
	private String sortDtlEtc;
	private String strgDtlEtc;
	private String pckgDtlEtc;
	private String jobDtlEtc;
	private String spmtDtlEtc;

	private String userId;
	private String userType;

	/* 데이터 항목 리스트 */
	private List<FcltDataMngVO> fcltDataMngVOList;

	private String ctpvCd;
	private String ctpvNm;
	private String sigunCd;
	private String sigunNm;
}








