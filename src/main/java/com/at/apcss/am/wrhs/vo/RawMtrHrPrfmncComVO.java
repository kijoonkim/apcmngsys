package com.at.apcss.am.wrhs.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Class Name : RawMtrHrPrfmncComVO.java
 * @Description : 원물입고시간실적공통에 대한 VO 클래스
 * @author 김호
 * @since 2025.07.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.07.10  김호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class RawMtrHrPrfmncComVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	private String apcNm;

	/**
	* 입고일자
	* */
	private String wrhsYmd;
	private String wrhsYmdFrom;
	private String wrhsYmdTo;

	/**
	 * 시간
	 * */
	private String wrhsHmCd;
	private String wrhsHmNm;

	/**
	 * 비고
	 * */
	private String rmrk;


	private List<RawMtrHrPrfmncDtlVO> rawMtrHrPrfmncDtlList;

	public List<RawMtrHrPrfmncDtlVO> getRawMtrHrPrfmncDtlList() {
		return this.rawMtrHrPrfmncDtlList == null ? null : rawMtrHrPrfmncDtlList.stream().collect(Collectors.toList());
	}

	public void setRawMtrHrPrfmncDtlList(List<RawMtrHrPrfmncDtlVO> rawMtrHrPrfmncDtlList) {
		this.rawMtrHrPrfmncDtlList = rawMtrHrPrfmncDtlList == null ? null : rawMtrHrPrfmncDtlList.stream().collect(Collectors.toList());
	}
}
