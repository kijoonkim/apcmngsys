package com.at.apcss.am.wgh.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.am.invntr.vo.RawMtrStdGrdVO;
import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : WghPrfmncDtlVO.java
 * @Description : 계량실적상세에 대한 VO 클래스
 * @author 신정철
 * @since 2023.07.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class WghPrfmncDtlVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 계량번호
	 */
	private String wghno;

	/**
	 * 계량순번
	 */
	private int wghSn;

	/**
	 * 등급코드
	 */
	private String grdCd;
	/**
	 * 등급명
	 */
	private String grdNm;

	/**
	 * 팔레트번호
	 */
	private String pltno;

	/**
	 * 식별번호
	 */
	private String sn;

	/**
	 * 입고번호
	 */
	private String wrhsno;

	/**
	 * 팔레트 종류
	 */
	private String pltKnd;
	/**
	 * 팔레트 종류명
	 */
	private String pltKndNm;


	/**
	 * 팔레트 수량
	 */
	private int pltQntt;

	/**
	 * 팔레트 중량
	 */
	private double pltWght;

	/**
	 * 박스 종류
	 */
	private String bxKnd;
	/**
	 * 박스 종류명
	 */
	private String bxKndNm;

	/**
	 * 박스 수량
	 */
	private int bxQntt;

	/**
	 * 박스 중량
	 */
	private double bxWght;

	/**
	 * 입고중량
	 */
	private double wrhsWght;

	/**
	 * 품목
	 */
	private String itemCd;
	/**
	 * 품종
	 */
	private String vrtyCd;
	/**
	 * 상품구분
	 */
	private String gdsSeCd;
	/**
	 * 입고구분
	 */
	private String wrhsSeCd;
	/**
	 * 운송구분
	 */
	private String trsprtSeCd;

	private double pltUnitWght;
	private double bxUnitWght;

	/**
	 * 표준등급
	 */
	private String stdGrd;
	private String stdGrdCd;

	/**
	 * 표준등급 목록
	 */
	private List<RawMtrStdGrdVO> stdGrdList;

	public List<RawMtrStdGrdVO> getStdGrdList() {
		return stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}

	public void setStdGrdList(List<RawMtrStdGrdVO> stdGrdList) {
		this.stdGrdList = stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}
}
