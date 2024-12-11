package com.at.apcss.am.anls.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AnlsMngVO extends ComVO {

	private String apcCd;
	
	private String anlsCrtrType;
	
	private String crtrCd;
	
	
	private List<AnlsCrtrVO> anlsCrtrList;
	
	private List<AnlsCrtrVO> anlsCrtrDtlList;

	public List<AnlsCrtrVO> getAnlsCrtrList() {
		
		return anlsCrtrList == null ? null : anlsCrtrList.stream().collect(Collectors.toList());
	}

	public void setAnlsCrtrList(List<AnlsCrtrVO> anlsCrtrList) {
		this.anlsCrtrList = anlsCrtrList == null ? null : anlsCrtrList.stream().collect(Collectors.toList());
	}

	public List<AnlsCrtrVO> getAnlsCrtrDtlList() {
		return anlsCrtrDtlList == null ? null : anlsCrtrDtlList.stream().collect(Collectors.toList());
	}

	public void setAnlsCrtrDtlList(List<AnlsCrtrVO> anlsCrtrDtlList) {
		this.anlsCrtrDtlList = anlsCrtrDtlList == null ? null : anlsCrtrDtlList.stream().collect(Collectors.toList());
	}
	
	
	
}
