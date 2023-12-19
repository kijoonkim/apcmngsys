package com.at.apcss.am.wrhs.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : WrhsMngVO.java
 * @Description : 입고에 대한 VO 클래스
 * @author 신정철
 * @since 2023.10.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class RawMtrWrhsMngVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	private String wrhsYmd;

	private String wrhsno;

	private String prcsNo;	// 처리번호

	private List<RawMtrInvntrVO> rawMtrInvntrList;

	public List<RawMtrInvntrVO> getRawMtrInvntrList() {
		return rawMtrInvntrList == null ? null : rawMtrInvntrList.stream().collect(Collectors.toList());
	}

	public void setRawMtrInvntrList(List<RawMtrInvntrVO> rawMtrInvntrList) {
		this.rawMtrInvntrList = rawMtrInvntrList == null ? null : rawMtrInvntrList.stream().collect(Collectors.toList());
	}

	private List<RawMtrWrhsVO> rawMtrRePrcsList;

	public List<RawMtrWrhsVO> getRawMtrRePrcsList() {
		return rawMtrRePrcsList == null ? null : rawMtrRePrcsList.stream().collect(Collectors.toList());
	}

	public void setRawMtrRePrcsList(List<RawMtrWrhsVO> rawMtrRePrcsList) {
		this.rawMtrRePrcsList = rawMtrRePrcsList == null ? null : rawMtrRePrcsList.stream().collect(Collectors.toList());
	}


}
