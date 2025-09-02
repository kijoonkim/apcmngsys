package com.at.apcss.fm.fclt.vo;

import java.util.ArrayList;
import java.util.List;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FcltOperInfoVO extends ComVO{

	//private String apcCd;
	//private String apcBrno;
	//private String apcNm;
	//private String operOgnzBrno;
	//private String operOgnzNm;

	private String trgtYr;
	private String msgKey;
	private String msgCn;
	private String msgKnd;
	private String msgKndNm;
	private String operOgnzAddr1;
	private String operOgnzAddr2;
	private String apcRgnCd;
	private String apcAddr;
	private String psnOgnzNm;
	private String psnOgnzBrno;
	private String operOgnzCd;
	private String operOgnzPic;
	private String operOgnzDeptCd;
	private String operOgnzDeptNm;
	private String operOgnzTrmtItemCd;
	private String operOgnzTrmtItemCd2;
	private String operOgnzTrmtItemCd3;
	private String operOgnzTrmtItemCd4;
	private String operOgnzTrmtItemCn;
	private String operOgnzTrmtItemCn2;
	private String operOgnzTrmtItemCn3;
	private String operOgnzTrmtItemCn4;
	private String apcTrmtItemCd;
	private String apcTrmtItemCd2;
	private String apcTrmtItemCd3;
	private String apcTrmtItemCd4;
	private String apcTrmtItemCn;
	private String apcTrmtItemCn2;
	private String apcTrmtItemCn3;
	private String apcTrmtItemCn4;

	/* 테이블 변경 으로 인한 변경 */
	private String crtrYr;
	private String apcCd;
	private String apcNm;
	private String apcBrno;

	private String operOgnzNm;
	private String operOgnzBrno;
	private String rprsv;
	private String loctn;
	private String loctnDtl;
	private String ctpvCd;
	private String ctpvNm;
	private String sigunCd;
	private String sigunNm;
	private String ognzType;
	private String ognzTypeCd;

	private String itemNm1;
	private String itemNm2;
	private String itemNm3;
	private String itemNm4;
	private String itemPrfmnc1;
	private String itemPrfmnc2;
	private String itemPrfmnc3;
	private String itemPrfmnc4;
	private String jgmtOgnzType;

	private String operOgnzCrno;
	private String apcCrno;
	private String operOgnzBmno;
	private String operOgnzSlno;
	private String operOgnzRoadNmCd;
	private String operOgnzAdmCd;
	private String operOgnzZip;
	private String apcLoctn;
	private String apcLoctnDtl;
	private String apcBmno;
	private String apcSlno;
	private String apcRoadNmCd;
	private String apcAdmCd;
	private String apcZip;

	private String prgrsYn;//진척도 갱신 여부
	private String tmprStrgYn;//임시저장 여부

	private String itemCd;
	private String itemNm;
	private String srchLclsfCd;


	private String userId;//계정 정보 확인 용도
	private String userType;//계정 정보 확인 용도
	private String memberInfoYn;//회원정보 여부

	/**
	 * 처리종류 : 이력용
	 */
	private String hstryPrcsKnd;

	/**
	 * 이력 순번
	 */
	private int hstrySn;

	private String rtnCd;
	private String rtnMsg;

	/**
	 * 전년도
	 */
	private String py;

	/**
	 * 주체
	 */
	private String mb;

	/**
	 * 전년도 주체
	 */
	private String pyMb;

	/**
	 * 전년도 조직유형 코드
	 */
	private String pyOgnzTypeCd;

	/**
	 * 전년도 조직유형 코드
	 */
	private String pyOgnzTypeNm;

	/**
	 * 유형코드
	 */
	private String typeCd;

	/**
	 * 전년도 유형코드
	 */
	private String pyTypeCd;

	/**
	 * 전년도 유형코드
	 */
	private String pyTypeNm;

	/**
	 * 유형명
	 */
	private String typeNm;

	/**
	 * 소유자
	 */
	private String ownr;

	/**
	 * 담당자
	 */
	private String pic;

	/**
	 * 담당자직위
	 */
	private String picJbps;

	/**
	 * 연락처
	 */
	private String cttpc;

	/**
	 * 이메일
	 */
	private String eml;

	/**
	 * 총취급액
	 */
	private String totTrmtAmt;

	/**
	 * 정부지원유무
	 */
	private String gvrmntSprtYn;

	/**
	 * 비고
	 */
	private String rmrk;

	/**
	 * 집계현황여부
	 */
	private String totSttnYn;

	/**
	 * 통합조직선정여부
	 */
	private String uoSlctnYn;

	/**
	 * 출자출하조직선정여부
	 */
	private String isoSlctnYn;

	/**
	 * 출하출하조직여부
	 */
	private String isoYn;

	/**
	 * 통합조직명
	 */
	private String uoNm;

	/**
	 * 통합조직사업자번호
	 */
	private String uoBrno;

	/**
	 * 엑셀 조직 유형
	 */
	private String excelOgnzType;

	/**
	 * 입력조직유형코드
	 */
	private String oldOgnzTypeCd;

	/**
	 * 입력조직유형
	 */
	private String oldOgnzType;

	/**
	 * 중복 여부
	 */
	private String dupYn;

	/**
	 * 통합조직여부(탈락여부포함)
	 */
	private String uoFailInclYn;




	/**
	 * 품목리스트
	 */
	private List<FcltItemVO> itemList;


	public List<FcltItemVO> getItemList() {
		return itemList = itemList == null ? null : new ArrayList<>(itemList);
	}

	public void setItemList(List<FcltItemVO> itemList) {
		this.itemList = itemList == null ? null : new ArrayList<>(itemList);
	}

}











