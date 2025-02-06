package com.at.apcss.am.shpgot.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class ShpgotMngVO extends ComVO {

	private String apcCd;

	private String shpgotCrtrType;

	private String crtrCd;

	private String shpgotYmd;

	private String trsprtCoCd;
	private String vhclno;
	private double trsprtCst;

	private String rmrk;


	private List<ShpgotCrtrVO> crtrList;

	private List<ShpgotCrtrVO> crtrDtlList;

	private List<ShpgotRsltVO> rsltList;

	public List<ShpgotCrtrVO> getCrtrList() {
		return crtrList == null ? null : new ArrayList<>(crtrList);
	}

	public void setCrtrList(List<ShpgotCrtrVO> crtrList) {
		this.crtrList = crtrList == null ? null : new ArrayList<>(crtrList);
	}

	public List<ShpgotCrtrVO> getCrtrDtlList() { return crtrDtlList == null ? null : new ArrayList<>(crtrDtlList); }

	public void setCrtrDtlList(List<ShpgotCrtrVO> crtrDtlList) {
		this.crtrDtlList = crtrDtlList == null ? null : new ArrayList<>(crtrDtlList);
	}

	public List<ShpgotRsltVO> getRsltList() {
		return rsltList == null ? null : new ArrayList<>(rsltList);
	}

	public void setRsltList(List<ShpgotRsltVO> rsltList) {
		this.rsltList = rsltList == null ? null : new ArrayList<>(rsltList);
	}


}
