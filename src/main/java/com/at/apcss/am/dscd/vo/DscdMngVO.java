package com.at.apcss.am.dscd.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Class Name : DscdMngVO.java
 * @Description : 폐기관리에 대한 VO 클래스
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
public class DscdMngVO extends ComVO {
    /**
     * APC 코드
     */
	private String apcCd;

    /**
     * 폐기 기준 타입
     */
	private String dscdCrtrType;

    /**
     * 기준 코드
     */
	private String crtrCd;
	
	/**
	 * 폐기 기준 목록
	 */
	private List<DscdCrtrVO> dscdCrtrList;

	public List<DscdCrtrVO> getDscdCrtrList() {
		return dscdCrtrList == null ? null : dscdCrtrList.stream().collect(Collectors.toList());
	}

	public void setDscdCrtrList(List<DscdCrtrVO> dscdCrtrList) {
		this.dscdCrtrList = dscdCrtrList == null ? null : dscdCrtrList.stream().collect(Collectors.toList());
	}

	/**
	 * 폐기 기준 상세 목록
	 */
	private List<DscdCrtrVO> dscdCrtrDtlList;

	public List<DscdCrtrVO> getDscdCrtrDtlList() {
		return dscdCrtrDtlList == null ? null : new ArrayList<>(dscdCrtrDtlList);
	}

	public void setDscdCrtrDtlList(List<DscdCrtrVO> dscdCrtrDtlList) {
		this.dscdCrtrDtlList = dscdCrtrDtlList == null ? null : new ArrayList<>(dscdCrtrDtlList);
	}
}
