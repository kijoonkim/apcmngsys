package com.at.apcss.am.ordr.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MrktOrdrVO extends ComVO {

	private String rtnCd;
	private String rtnMsg;
	
	private String ordrApcCd;
	private String wrhsYmd;
	private long ordrSeq;
	private String ordrCrtDt;
	private String ordrPrcsCd;
	private String ordrPrcsDt;
	private String ordrPrcsMsg;
	private String uniKey;	
	private String lgszMrktCd;
	private String outordrno;
	private long outordrAmt;
	private long txamt;
	
	private String outordrYmd;
	private String mrktWrhsKnd;
	private String mrktWrhsType;
	private String trsmYmd;
	private String trsmTm;
	private String rcptnYmd;
	private String rcptnTm;
	private String rcptnYn;
	private String ordrr;
	private String cntrCd;
	private String cntrNm;
	private String splrCd;
	private String splrNm;
	private String userId;
	private String bplcCd;
	private String coCd;
	private String coNm;
	private String vrWarehouseCd;
	private String vrWarehouseTxt;
	private String vrWarehouseNm;
	private String warehouseCd;
	private String warehouseTxt;
	private String warehouseNm;
	private String ordrDsctn;
	
	
	private List<MrktOrdrDtlVO> dtlList;

	public List<MrktOrdrDtlVO> getDtlList() {
		return dtlList == null ? null : dtlList.stream().collect(Collectors.toList());
	}

	public void setDtlList(List<MrktOrdrDtlVO> dtlList) {
		this.dtlList = dtlList == null ? null : dtlList.stream().collect(Collectors.toList());
	}
}
