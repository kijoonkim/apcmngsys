package com.at.apcss.am.cmns.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : RgnTrsprtCstVO.java
 * @Description : 지역별 운임비 정보에 대한 VO 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
public class RgnTrsprtCstVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * 운송지역코드
	 */
	private String trsprtRgnCd;
	/**
	 * 운송지역명
	 */
	private String trsprtRgnNm;
	/**
	 * 운임비용
	 */
	private int trsprtCst;
	/**
	 * 비고
	 */
	private String rmrk;

	/**
	 * 차량정보 목록
	 */
	private List<WrhsVhclVO> wrhsVhclList;

	public List<WrhsVhclVO> getWrhsVhclList() {
		return wrhsVhclList == null ? null : wrhsVhclList.stream().collect(Collectors.toList());
	}

	public void setWrhsVhclList(List<WrhsVhclVO> wrhsVhclList) {
		this.wrhsVhclList = wrhsVhclList == null ? null : wrhsVhclList.stream().collect(Collectors.toList());
	}

	/**
	 * 운송지역별 운임비 목록
	 */
	private List<RgnTrsprtCstVO> rgnTrsprtCstList;

	public List<RgnTrsprtCstVO> getRgnTrsprtCstList() {
		return rgnTrsprtCstList == null ? null : rgnTrsprtCstList.stream().collect(Collectors.toList());
	}

	public void setRgnTrsprtCstList(List<RgnTrsprtCstVO> rgnTrsprtCstList) {
		this.rgnTrsprtCstList = rgnTrsprtCstList == null ? null : rgnTrsprtCstList.stream().collect(Collectors.toList());
	}

	/**
	 * 등록 수
	 */
	private int cnt;
	/**
	 * 삭제 불가능 사유
	 */
	private String delible;
}
