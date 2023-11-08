package com.at.apcss.am.invntr.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SortInvntrVO.java
 * @Description : 선별재고정보에 대한 VO 클래스
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
public class SortInvntrVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 선별번호
	 */
	private String sortno;

	/**
	 * 선별순번
	 */
	private int sortSn;

	/**
	 * 선별번호 표시
	 */
	private String sortnoIndct;

	/**
	 * 등급코드
	 */
	private String grdCd;

	/**
	 * 등급명
	 */
	private String grdNm;

	/**
	 * 투입일자
	 */
	private String inptYmd;
	private String inptYmdFrom;
	private String inptYmdTo;

	/**
	 * 설비코드
	 */
	private String fcltCd;
	/**
	 * 지시설비코드
	 */
	private String pckgFcltCd;

	/**
	 * 대표생산자코드
	 */
	private String rprsPrdcrCd;

	/**
	 * 품목코드
	 */
	private String itemCd;

	/**
	 * 품종코드
	 */
	private String vrtyCd;

	/**
	 * 규격코드
	 */
	private String spcfctCd;

	/**
	 * 상품구분코드
	 */
	private String gdsSeCd;
	private String gdsSeNm;

	/**
	 * 입고구분코드
	 */
	private String wrhsSeCd;
	private String wrhsSeNm;

	/**
	 * 운송구분코드
	 */
	private String trsptSeCd;

	/**
	 * 창고구분코드
	 */
	private String warehouseSeCd;

	/**
	 * 선별수량
	 */
	private int sortQntt;

	/**
	 * 선별중량
	 */
	private double sortWght;

	/**
	 * 포장수량
	 */
	private int pckgQntt;

	/**
	 * 포장중량
	 */
	private double pckgWght;

	/**
	 * 재고수량
	 */
	private int invntrQntt;

	/**
	 * 재고중량
	 */
	private double invntrWght;
	/**
	 * 재고수량
	 */
	private int trnsfQntt;

	/**
	 * 재고중량
	 */
	private double trnsfWght;

	/**
	 * 투입수량
	 */
	private int inptQntt;
	/**
	 * 투입중량
	 */
	private double inptWght;

	/**
	 * 수량
	 */
	private int qntt;
	/**
	 * 중량
	 */
	private double wght;

	/**
	 * 투입진행수량
	 */
	private int inptPrgrsQntt;
	/**
	 * 투입진행중량
	 */
	private double inptPrgrsWght;

	/**
	 * 선별번호
	 */
	private String wghno;
	/*투입일자*/
	private String wghYmd;
	/*설비*/
	private String fcltNm;
	/*지시설비*/
	private String pckgFcltNm;
	/*생산자*/
	private String prdcrCd;
	private String prdcrNm;
	/*품목*/
	private String itemNm;
	/*품종*/
	private String vrtyNm;
	/*규격*/
	private String spcfctNm;
	/*창고*/
	private String warehouseSeNm;

	private String sortYmd;
	private String prdctnYr;
	private String apcNm;
	private String rprsPrdcrNm;
	private String pckgCmndno;
	private String cmndQntt;
	private String cmndWght;
	private String sortYmdFrom;
	private String sortYmdTo;
	private String sortFcltCd;
	private String pckgno;

	/*선별재고 내역*/
	/*기준일자*/
	private String crtrYmd;
	/*재고구분*/
	private String invntrySe;
	/*비고*/
	private String rmrk;


	/**
	 * 표준등급
	 */
	private String stdGrd;

	private String stdGrdCd;

	/*
	 * 변경이력 
	 */
	
	private int chgBfrQntt;
	private double chgBfrWght;
	private int chgAftrQntt;
	private double chgAftrWght;
	private String chgRsnCd;
	private String chgRmrk;
	
	/**
	 * 표준등급
	 */
	private List<SortStdGrdVO> stdGrdList;

	public List<SortStdGrdVO> getStdGrdList() {
		return stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}

	public void setStdGrdList(List<SortStdGrdVO> stdGrdList) {
		this.stdGrdList = stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}
}
