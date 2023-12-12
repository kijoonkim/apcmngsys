package com.at.apcss.am.ordr.vo;

import java.util.List;
import java.util.stream.Collectors;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : OrdrRcvHomeplusVO.java
 * @Description : 홈플러스 발주 수신 정보에 대한 VO 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class OrdrHomeplusMVO {
	
	private String buyerNm;
	private String canprint;
	private String companyCode;
	private String companyNm;
	private String docKindName;
	private String ediDocCode;
	private String ediDocFilename;
	private String ediDocSize;
	private String ediRecvDate;
	private String ediRecvStatus;
	private String ediRecvStatusNm;
	private String ediRecvTime;
	private String ediRefNo;
	private String ediSendDate;
	private String ediSendTime;
	private String goChg;
	private String grDate;
	private String grKind;
	private String grType;
	private String houseCode;
	private String noticeFlag;
	private String orderFlag;
	private String oriTbl;
	private String poAmtSum;
	private String poDate;
	private String poNo;
	private String rownum;
	private String uniKey;
	private String userId;
	private String uuid;
	private String vendorCode;
	private String vendorNm;
	private String virtualWarehouseCode;
	private String virtualWarehouseNm;
	private String virtualWarehouseText;
	private String warehouseCode;
	private String warehouseNm;
	
	List<OrdrHomeplusSVO> ordrDtlList;

	public List<OrdrHomeplusSVO> getOrdrDtlList() {
		return ordrDtlList == null ? null : ordrDtlList.stream().collect(Collectors.toList());
	}

	public void setOrdrDtlList(List<OrdrHomeplusSVO> ordrDtlList) {
		this.ordrDtlList = ordrDtlList == null ? null : ordrDtlList.stream().collect(Collectors.toList());;
	}	
}