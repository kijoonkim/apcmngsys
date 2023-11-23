package com.at.apcss.am.cmns.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StdGrdListVO extends ComVO {

	private List<StdGrdVO> stdGrdList;
	private List<StdGrdDtlVO> stdGrdDtlList;
	private List<StdGrdJgmtVO> stdGrdJgmtList;


	public List<StdGrdVO> getStdGrdList() {
		return this.stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}

	public void setStdGrdList(List<StdGrdVO> stdGrdList) {
		this.stdGrdList = stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}

	public List<StdGrdDtlVO> getStdGrdDtlList() {
		return this.stdGrdDtlList == null ? null : stdGrdDtlList.stream().collect(Collectors.toList());
	}

	public void setStdGrdDtlList(List<StdGrdDtlVO> stdGrdDtlList) {
		this.stdGrdDtlList = stdGrdDtlList == null ? null : stdGrdDtlList.stream().collect(Collectors.toList());
	}

	public List<StdGrdJgmtVO> getStdGrdJgmtList() {
		return this.stdGrdJgmtList == null ? null : stdGrdJgmtList.stream().collect(Collectors.toList());
	}

	public void setStdGrdJgmtList(List<StdGrdJgmtVO> stdGrdJgmtList) {
		this.stdGrdJgmtList = stdGrdJgmtList == null ? null : stdGrdJgmtList.stream().collect(Collectors.toList());
	}

}
