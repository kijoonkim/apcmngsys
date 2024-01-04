package com.at.apcss.am.spmt.vo;

import java.util.List;
import java.util.stream.Collectors;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SpmtDocVO {
	
	private String apcCd;
	private String spmtno;
	private String whlslMrktCd;
	private String whlslMrktCorpCd;
	private String spmtMbType;
	private String spmtPrnmntYmd;
	private String spmtPlcNm;
	private String spmtPlcCttpc;
	private String spmtDclrno;
	private String spmtPlcBankCd;
	private String spmtPlcActno;
	private String spmtPlcDpstr;
	private String dlngShap;
	private String dlngSeCd;
	private String drvrNm;
	private String drvrCttpc;
	private String vhclno;
	private String trsprtCst;
	private String drvrBankCd;
	private String drvrActno;
	private String drvrDpstr;
	private String trsprtSttsCd;
	
	List<SpmtDocDtlVO> spmtDocDtlList;

	public List<SpmtDocDtlVO> getSpmtDocDtlList() {
		return spmtDocDtlList == null ? null : spmtDocDtlList.stream().collect(Collectors.toList());
	}

	public void setSpmtDocDtlList(List<SpmtDocDtlVO> spmtDocDtlList) {
		this.spmtDocDtlList = spmtDocDtlList == null ? null : spmtDocDtlList.stream().collect(Collectors.toList());
	}
	
}
