package com.at.apcss.am.spmt.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SpmtPrfmncVO.java
 * @Description : 출고실적에 대한 VO 클래스
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
public class SpmtPrfmncComVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 출하번호
	 */
	private String spmtno;

	/**
	 * 출하일자
	 */
	private String spmtYmd;

	/**
	 * 거래처코드
	 */
	private String cnptCd;

	/**
	 * 거래처명
	 */
	private String cnptNm;

	/**
	 * 운송회사코드
	 */
	private String trsprtCoCd;

	/**
	 * 운송회사명
	 */
	private String trsprtCoNm;

	/**
	 * 차량번호
	 */
	private String vhclno;

	/**
	 * 배송지
	 */
	private String dldtn;

	/**
	 * 운임비용
	 */
	private String trsprtCst;

	/**
	 * 운임비용합계
	 */
	private String totTrsprtCst;

	/**
	 * 비고
	 */
	private String rmrk;

	
	/**
	 * 출하수량
	 */
	private int spmtQntt;

	/**
	 * 출하중량
	 */
	private double spmtWght;

	/**
	 * 총출하수량
	 */
	private int totSpmtQntt;

	/**
	 * 총출하중량
	 */
	private double totSpmtWght;

	/**
	 * 브랜드명
	 */
	private String brndNm;

	/**
	 * 출하구분코드
	 */
	private String spmtSeCd;
	/**
	 * 출하자신고번호
	 */
	private String spmtPrsnDclrno;
	/**
	 * 산지코드
	 */
	private String plorCd;
	
	/**
	 * 발주번호
	 */
	private String outordrno;

	/**
	 * 반품여부
	 */
	private String rtnGdsYn;
	private String rtnGdsNm;
	
	/**
	 * 반품수량
	 */
	private int rtnGdsQntt;
	/**
	 * 반품중량
	 */
	private double rtnGdsWght;
	/**
	 * 반품가능수량
	 */
	private int rtnPsbleyQntt;
	/**
	 * 반품가능중량
	 */
	private double rtnPsbleyWght;

	/*
	 * 기초재고수량
	 * */
	private int bssInvntrQntt;

	/*
	 * 팔레트박스코드
	 * */
	private String pltBxCd;
	/*
	 * 팔레트불출여부
	 * */
	private String pltSpmtYn;
	/*
	 * 팔레트입출고순번
	 * */
	private int sn;
	
	private List<SpmtPrfmncVO> spmtPrfmncList;

	public List<SpmtPrfmncVO> getSpmtPrfmncList() {
		return spmtPrfmncList == null ? null : spmtPrfmncList.stream().collect(Collectors.toList());
	}

	public void setSpmtPrfmncList(List<SpmtPrfmncVO> spmtPrfmncList) {
		this.spmtPrfmncList = spmtPrfmncList == null ? null : spmtPrfmncList.stream().collect(Collectors.toList());
	}
	
}
