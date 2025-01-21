package com.at.apcss.am.invntr.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : InvntrVO.java
 * @Description : 재고정보에 대한 VO 클래스
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
public class InvntrMngVO extends ComVO {

	/**
	APC코드
	**/
	private String apcCd;

	/**
	삭제유무
	**/
	private String delYn;
	/**
	상품구분코드
	**/
	private String gdsSeCd;
	/**
	등급코드
	**/
	private String grdCd;

	/**
	등급종류
	**/
	private String grdKnd;

	/**
	등급명
	**/
	private String grdNm;

	/**
	등급종류
	**/
	private String stdGrdCd;

	/**
	등급종류
	**/
	private String stdGrd;



	/**
	품목코드
	**/
	private String itemCd;
	/**
	산지코드
	**/
	private String plorCd;
	/**
	팔레트번호
	**/
	private String pltno;
	/**
	처리번호
	**/
	private String prcsNo;
	/**
	처리수량
	**/
	private double prcsQntt;
	/**
	처리유형
	**/
	private String prcsType;
	/**
	처리중량
	**/
	private double prcsWght;
	/**
	생산자코드
	**/
	private String prdcrCd;
	/**
	생산연도
	**/
	private String prdctnYr;
	/**
	비고
	**/
	private String rmrk;
	/**
	원물규격 코드
	**/
	private String spcfctCd;
	/**
	저장위치
	**/
	private String strgLoctnCd;

	/**
	운송구분코드
	**/
	private String trsprtSeCd;
	/**
	품종코드
	**/
	private String vrtyCd;
	/**
	창고구분코드
	**/
	private String warehouseSeCd;
	/**
	재고번호
	**/
	private String invntrno;
	/**
	입고수량
	**/
	private double wrhsQntt;
	/**
	입고구분코드
	**/
	private String wrhsSeCd;
	/**
	입고중량
	**/
	private double wrhsWght;
	/**
	입고일자
	**/
	private String wrhsYmd;



	/**
	품목품종
	**/
	private String itemVrtyCd;

	/**
	재고유형
	**/
	private String invntrType;

	/**
	순번
	**/
	private int sn;

	/**
	 * 원물표준등급
	 */
	private List<RawMtrStdGrdVO> rawMtrstdGrdList;

	public List<RawMtrStdGrdVO> getRawMtrstdGrdList() {
		return rawMtrstdGrdList == null ? null : rawMtrstdGrdList.stream().collect(Collectors.toList());
	}

	public void setRawMtrstdGrdList(List<RawMtrStdGrdVO> stdGrdList) {
		this.rawMtrstdGrdList = stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}

	/**
	 * 선별표준등급
	 */
	private List<SortStdGrdVO> sortStdGrdList;

	public List<SortStdGrdVO> getSortStdGrdList() {
		return sortStdGrdList == null ? null : sortStdGrdList.stream().collect(Collectors.toList());
	}

	public void setSortStdGrdList(List<SortStdGrdVO> stdGrdList) {
		this.sortStdGrdList = stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}

	/**
	 * 상품 표준등급
	 */
	private String gdsGrd;

	private List<GdsStdGrdVO> gdsStdGrdList;

	public List<GdsStdGrdVO> getGdsStdGrdList() {
		return gdsStdGrdList == null ? null : gdsStdGrdList.stream().collect(Collectors.toList());
	}

	public void setGdsStdGrdList(List<GdsStdGrdVO> gdsStdGrdList) {
		this.gdsStdGrdList = gdsStdGrdList == null ? null : gdsStdGrdList.stream().collect(Collectors.toList());
	}

}
