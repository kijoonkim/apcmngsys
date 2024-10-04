package com.at.apcss.am.clcln.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : ClclnMngVO.java
 * @Description : 정산관리에 대한 VO 클래스
 * @author 신정철
 * @since 2024.09.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.09.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class ClclnMngVO extends ComVO {

	private String apcCd;
	
	private String clclnYr;
	
	private int clclnSn;

	private String clclnCrtrType;
	
	private String crtrCd;
	
	/**
	 * 정산기준 목록
	 */
	private List<ClclnCrtrVO> clclnCrtrList;

	public List<ClclnCrtrVO> getClclnCrtrList() {
		return clclnCrtrList == null ? null : clclnCrtrList.stream().collect(Collectors.toList());
	}

	public void setClclnCrtrList(List<ClclnCrtrVO> clclnCrtrList) {
		this.clclnCrtrList = clclnCrtrList == null ? null : clclnCrtrList.stream().collect(Collectors.toList());
	}

	/**
	 * 정산기준 목록
	 */
	private List<ClclnCrtrVO> clclnCrtrDtlList;

	public List<ClclnCrtrVO> getClclnCrtrDtlList() {
		return clclnCrtrDtlList == null ? null : clclnCrtrDtlList.stream().collect(Collectors.toList());
	}

	public void setClclnCrtrDtlList(List<ClclnCrtrVO> clclnCrtrDtlList) {
		this.clclnCrtrDtlList = clclnCrtrDtlList == null ? null : clclnCrtrDtlList.stream().collect(Collectors.toList());
	}
	
	/**
	 * 정산단가 목록
	 */
	private List<ClclnUntprcVO> clclnUntprcList;
	
	public List<ClclnUntprcVO> getClclnUntprcList() {
		return clclnUntprcList == null ? null : clclnUntprcList.stream().collect(Collectors.toList());
	}

	public void setClclnUntprcList(List<ClclnUntprcVO> clclnUntprcList) {
		this.clclnUntprcList = clclnUntprcList == null ? null : clclnUntprcList.stream().collect(Collectors.toList());
	}


	/**
	 * 정산결과 목록
	 */
	private List<ClclnRsltVO> clclnRsltList;
	
	public List<ClclnRsltVO> getClclnRsltList() {
		return clclnRsltList == null ? null : clclnRsltList.stream().collect(Collectors.toList());
	}

	public void setClclnRsltList(List<ClclnRsltVO> clclnRsltList) {
		this.clclnRsltList = clclnRsltList == null ? null : clclnRsltList.stream().collect(Collectors.toList());
	}
}
