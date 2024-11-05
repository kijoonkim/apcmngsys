package com.at.apcss.co.ognz.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class UntyOgnzVO extends ComVO {

	
	private String superUserYn;
	private String authrtMngrYn;
	
	private String untyOgnzId;
	private String untyOgnzType;
	private String untyOgnzCd;
	private String untyOgnzNm;
	private String upUntyOgnzId;
	private String upUntyOgnzNm;
	private String untyOgnzLinkCd;
	private String ctpv;
	private String sgg;
	
	private String ctpvNm;
	private String sggNm;
	private String sggExpln;
	
	private int indctSeq;
	private int untyOgnzLvl;
	
	
	private String apcCd;
	private String apcNm;
	private String brno;
	private String crno;
	private String addr;
	
	private String aprvYn;
	private String aprvDt;
	private String aplyYn;
	private String aplyDt;
	
	private String ognzCd;
	private String ognzNm;
	private String ognzSeCd;
	
	private String filterKey;
	
	private String userId;
	private String userNm;
	
	private String jbps;
	private String mblTelno;
	private String telno;
	private String coTelno;
	private String eml;
	

	private List<UntyOgnzApcUserVO> apcUserList;

	public List<UntyOgnzApcUserVO> getApcUserList() {
		return apcUserList == null ? null : apcUserList.stream().collect(Collectors.toList());
	}

	public void setApcUserList(List<UntyOgnzApcUserVO> apcUserList) {
		this.apcUserList = apcUserList == null ? null : apcUserList.stream().collect(Collectors.toList());
	}
	
}
