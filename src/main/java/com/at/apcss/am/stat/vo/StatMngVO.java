package com.at.apcss.am.stat.vo;

import com.at.apcss.am.tot.vo.TotCrtrVO;
import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class StatMngVO extends ComVO {

	/**
	APC코드
	**/
	private String apcCd;

	/**
	통계기준유형코드
	**/
	private String statsCrtrType;

	private String crtrCd;

	private List<StatCrtrVO> crtrList;

	private List<StatCrtrVO> crtrDtlList;

	public List<StatCrtrVO> getCrtrList() {
		return crtrList == null ? null : new ArrayList<>(crtrList);
	}

	public void setCrtrList(List<StatCrtrVO> crtrList) {
		this.crtrList = crtrList == null ? null : new ArrayList<>(crtrList);
	}

	public List<StatCrtrVO> getCrtrDtlList() {
		return crtrDtlList == null ? null : new ArrayList<>(crtrDtlList);
	}

	public void setCrtrDtlList(List<StatCrtrVO> crtrDtlList) {
		this.crtrDtlList = crtrDtlList == null ? null : new ArrayList<>(crtrDtlList);
	}
}
