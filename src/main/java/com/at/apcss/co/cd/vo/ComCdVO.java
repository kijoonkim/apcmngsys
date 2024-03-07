package com.at.apcss.co.cd.vo;


import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * 공통코드 VO
 * @author FINEVT 개발팀 김호
 * @since 2023.05.18
 * @version 1.0
 * @see
 *
 * <pre>
 * 공통코드
 *
 *  수정일      수정자      수정내용
 *  -------            --------        ---------------------------
 *  2023.05.18  김호       최초 생성
 *
 *  </pre>
 */
@Getter
@Setter
public class ComCdVO extends ComVO {

	private String cdId;
	private String cdNm;
	private String cdExpln;
	private String cdType;
	private String cdVl;
	private String cdVlNm;
	private String cdVlExpln;
    private String indctSeq;
	private String delYn;
	private String apcCd;
	private String apcNm;
	private String upCdVl;
	private String cdNumVl;
	private String cdChrVl;
	private String useYn;
	private String rmrk;
	private String extrnlLnkgCd;

	/**
	 * 공통코드 목록
	 */
	private List<ComCdVO> comCdList;

	public List<ComCdVO> getComCdList() {
		return comCdList == null ? null : comCdList.stream().collect(Collectors.toList());
	}

	public void setComCdList(List<ComCdVO> comCdList) {
		this.comCdList = comCdList == null ? null : comCdList.stream().collect(Collectors.toList());
	}

	/**
	 * 공통코드상세 목록
	 */
	private List<ComCdVO> comCdDtlList;

	public List<ComCdVO> getComCdDtlList() {
		return comCdDtlList == null ? null : comCdDtlList.stream().collect(Collectors.toList());
	}

	public void setComCdDtlList(List<ComCdVO> comCdDtlList) {
		this.comCdDtlList = comCdDtlList == null ? null : comCdDtlList.stream().collect(Collectors.toList());
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
