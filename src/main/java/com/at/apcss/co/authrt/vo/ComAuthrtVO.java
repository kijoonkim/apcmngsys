package com.at.apcss.co.authrt.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComAuthrtVO extends ComVO {
	
	private String authrtId;
	private String authrtNm;
	private String authrtType;
	private String authrtRmrk;
	private String entyId;
	private String entyType;
	
	private List<String> authMenuIdList;
	private List<String> authUserIdList;
	
	
	public List<String> getAuthMenuIdList() {
		return this.authMenuIdList == null ? null : authMenuIdList.stream().collect(Collectors.toList());
	}
	
	public void setAuthMenuIdList(List<String> authMenuIdList) {
		this.authMenuIdList = authMenuIdList == null ? null : authMenuIdList.stream().collect(Collectors.toList());
	}
}
