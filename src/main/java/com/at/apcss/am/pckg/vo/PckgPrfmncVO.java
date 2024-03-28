package com.at.apcss.am.pckg.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.am.invntr.vo.GdsStdGrdVO;
import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : PckgPrfmncVO.java
 * @Description : 포장실적에 대한 VO 클래스
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
public class PckgPrfmncVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 포장번호
	 */
	private String pckgno;
	/**
	 * 포장순번
	 */
	private int pckgSn;

	/**
	 * 포장번호 표시
	 */
	private String pckgnoIndct;

	/**
	 * 포장일자
	 */
	private String pckgYmd;
	private String pckgYmdFrom;
	private String pckgYmdTo;

	/**
	 * 투입일자
	 */
	private String inptYmd;

	/**
	 * 설비코드
	 */
	private String fcltCd;
	private String fcltNm;

	/**
	 * 대표생산자코드
	 */
	private String rprsPrdcrCd;
	private String rprsPrdcrNm;

	/**
	 * 생산자코드
	 */
	private String prdcrCd;
	private String prdcrNm;

	/**
	 * 품목코드
	 */
	private String itemCd;
	private String itemNm;

	/**
	 * 품종코드
	 */
	private String vrtyCd;
	private String vrtyNm;

	private String vrtyCds;
	/**
	 * 규격코드
	 */
	private String spcfctCd;
	private String spcfctNm;

	/**
	 * 등급코드
	 */
	private String grdCd;

	/**
	 * 상품등급
	 */
	private String gdsGrd;
	private String gdsGrdNm;

	/**
	 * 창고구분코드
	 */
	private String warehouseSeCd;
	private String warehouseSeNm;
	private String warehouseSeCdFrom;

	/**
	 * 상품구분코드
	 */
	private String gdsSeCd;
	private String gdsSeNm;

	/**
	 * 입고구분코드
	 */
	private String wrhsSeCd;

	/**
	 * 출하포장단위코드
	 */
	private String spmtPckgUnitCd;
	private String spmtPckgUnitNm;

	/**
	 * 포장지시번호
	 */
	private String pckgCmndno;

	/**
	 * 선별번호
	 */
	private String sortno;
	/**
	 * 선별순번
	 */
	private int sortSn;

	
	private String pckgSortno;
	
	private int pckgSortSn;
	
	
	/**
	 * 비고
	 */
	private String rmrk;

	/**
	 * 포장투입실적 변경 여부
	 */
	private String needsInptChgYn;

	/**
	 * 포장수량
	 */
	private int pckgQntt;
	/**
	 * 포장중량
	 */
	private double pckgWght;

	/**
	 * 잔여수량
	 */
	private int rmnQntt;
	/**
	 * 잔여중량
	 */
	private double rmnWght;
	
	/**
	 * 재고수량
	 */
	private int invntrQntt;
	/**
	 * 재고중량
	 */
	private double invntrWght;

	/**
	 * 출하수량
	 */
	private int spmtQntt;
	/**
	 * 춣하중량
	 */
	private double spmtWght;

	/**
	 * 생산연도
	 */
	private String prdctnYr;

	/**
	 * 산지코드
	 */
	private String plorCd;

	/**
	 * 상품코드
	 */
	private String gdsCd;

	/**
	 * 표준등급
	 */
	private String stdGrd;
	private String stdGrdCd;

	/**
	 * 표준등급
	 */
	private List<GdsStdGrdVO> stdGrdList;

	public List<GdsStdGrdVO> getStdGrdList() {
		return stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}

	public void setStdGrdList(List<GdsStdGrdVO> stdGrdList) {
		this.stdGrdList = stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}

}
