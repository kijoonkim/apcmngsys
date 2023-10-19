package com.at.apcss.am.apc.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
public class ApcEvrmntStngVO extends ComVO{

	private String apcCd;
	private String regApcNm;
	private String ctpvNm;
	private String sigunNm;
	private String mbCd;
	private String regAddr;
	private String regZip;
	private String regTelno;
	private String apcNm;
	private String brno;
	private String bankCd;
	private String dpstr;
	private String actno;
	private String addr;
	private String zip;
	private String telno;
	private String fxno;

	private String cdVls;

	/**
	 * case id : CASE1 ~ CASE10
	 */
	private String authrtCaseId;

	/**
	 * APC구분코드
	 */
	private String apcSeCd;

	/**
	 * 정산기준
	 */
	private String clclnCrtrCd;

	private String wghMngYn;	// 계량정보관리유무			AM_001_001
	private String wghMblUseYn;	// 계량테블릿사용유무			AM_001_007
	private String wghIdntyDocPblcnYn;	// 계량확인서발행유무
	private String rawMtrWrhsMngYn;	// 원물입고관리유무			AM_001_002		AM_001_003
	private String rawMtrWrhsMblUseYn;	// 원물입고테블릿사용유무		AM_001_008		AM_001_003
	private String rawMtrIdentTagPblcnYn;	// 원물인식표발행유무
	private String pltBxMngYn;	// 팔레트박스정보관리유무		AM_001_004
	private String rawMtrWrhsPlanMngYn;	// 원물입고계획관리유무		AM_001_005
	private String gdsWrhsMngYn;	// 상품입고관리유무			AM_001_006
	private String sortCmndMngYn;	// 선별지시관리유무			AM_002_001	AM_002_002
	private String sortCmndDocPblcnYn;	// 선별지시서발행유무
	private String pckgCmndMngYn;	// 포장지시관리유무			AM_002_003	AM_002_004
	private String pckgCmndDocPblcnYn;	// 포장지시서발행유무
	private String sortMngYn;	// 선별관리유무				AM_003_001	AM_003_002
	private String sortMblUseYn;	// 선별테블릿사용유무			AM_003_003
	private String sortLabelPblcnYn;	// 선별라벨발행유무
	private String sortIdntyDocPblcnYn;	// 선별확인서발행유무
	private String pckgMngYn;	// 포장관리유무				AM_004_001	AM_004_002
	private String pckgMblUseYn;	// 포장테블릿사용유무			AM_004_003
	private String gdsLblPblcnYn;	// 상품라벨발행유무
	private String spmtCmndMngYn;	// 출하지시관리유무			AM_002_005	AM_002_006
	private String spmtCmndDocPblcnYn;	// 출하지시서발행유무
	private String spmtMngYn;	// 출하관리유무				AM_005_003	AM_005_005
	private String spmtMblUseYn;	// 출하테블릿사용유무			AM_005_004
	private String spmtDocPblcnYn;	// 송품장발행유무
	private String clclnMngYn;	// 정산관리유무				AM_008_001	AM_008_002
	private String outordrMngYn;	// 발주정보관리유무			AM_007_001	AM_007_002
	private String outordrAtmtcRcptnYn;	// 발주정보자동수신
	private String outordrPckgCmndLnkgYn;	// 발주정보포장지시연결유무
	private String trsmMngYn;	// 전송관리유무
	private String sortDataTrsmYn;	// 선별정보전송유무
	private String clclnDataTrsmYn;	// 정산자료전송유무
	private String oprtrUseYn;	// 생산작업자사용유무			AM_003_004
	private String oprtrSortPrfmncTrsmYn;	// 생산작업자선별실적전송유무
	private String oprtrPckgPrfmncTrsmYn;	// 생산작업자포장실적전송유무
}
