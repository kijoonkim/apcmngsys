package com.at.apcss.am.anls.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class AnlsCrtrVO extends ComVO {

	private String apcCd;
	private String anlsCrtrType;
	private String anlsCrtrTypeNm;
	private int crtrTypeSeq;
	private String crtrCd;
	private String crtrIndctNm;
	private double crtrVl;
	private int indctSeq;
	private String crtSchdlType;
	private String crtSchdlPt;
	
	private String useYn;

	private String crtrUseYn;
	private String anlsDtlType ;
	private int dtlSn;
	private String dtlCd;
	private double dtlVl;
	private String dtlType;
	private String dtlIndctNm;
	private String dtlCrtrCd;
	private String crtrDtlUseYn;
	private String crtrRmrk;
	
	private String seq;
	
	private int crtrSeq;
	private int crtrDtlSeq;
	
	private int maxDtlSn;
	private boolean needsInsert;
	
}
