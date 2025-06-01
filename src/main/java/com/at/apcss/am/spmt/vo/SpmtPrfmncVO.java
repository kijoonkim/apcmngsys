package com.at.apcss.am.spmt.vo;

import java.util.ArrayList;
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
public class SpmtPrfmncVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 출하번호
	 */
	private String spmtno;

	/**
	 * 출하시작일자
	 */
	private String spmtYmdFrom;

	/**
	 * 출하종료일자
	 */
	private String spmtYmdTo;

	/**
	 * 출하일자
	 */
	private String spmtYmd;

	/**
	 * 포장시작일자
	 */
	private String pckgYmdFrom;

	/**
	 * 포장종료일자
	 */
	private String pckgYmdTo;

	/**
	 * 포장일자
	 */
	private String pckgYmd;

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
	 * 포장번호
	 */
	private String pckgno;

	/**
	 * 포장순번
	 */
	private int pckgSn;
	/**
	 * 출하순번
	 * */
	private int spmtSn;

	/**
	 * 품목코드
	 */
	private String itemCd;
	private String itemNm;

	/**
	 * 품종코드
	 */
	private String vrtyCd;

	/**
	 * 품종명
	 */
	private String vrtyNm;

	/**
	 * 상품구분코드
	 */
	private String gdsSeCd;

	/**
	 * 규격코드
	 */
	private String spcfctCd;

	/**
	 * 규격명
	 */
	private String spcfctNm;

	/**
	 * 창고구분코드
	 */
	private String warehouseSeCd;

    /**
     * 규격중량
     */
    private double spcfctWght;

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
	 * 출하포장단위코드
	 */
	private String spmtPckgUnitCd;
	/**
	 * 출하포장단위코드
	 */
	private String spmtPckgUnitNm;

	/**
	 * 출하지시수량
	 */
	private String cmndQntt;

	/**
	 * 브랜드명
	 */
	private String brndNm;

	/**
	 * 상품코드
	 */
	private String gdsCd;

	/**
	 * 상품명
	 */
	private String gdsNm;

	/**
	 * 생산자코드
	 */
	private String prdcrCd;
	
	/**
	 * 생산자명
	 */
	private String prdcrNm;

	/**
	 * 출하지시번호
	 */
	private String spmtCmndno;
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
	 * 거래형태코드
	 */
	private String dlngShapCd;
	/**
	 * 매매방법코드
	 */
	private String dlngMthdCd;

	/**
	 * 상품등급
	 */
	private String gdsGrd;
	/**
	 * 등급코드
	 */
	private String grdCd;
	
	/**
	 * 상품등급명
	 */
	private String gdsGrdNm;
	
	/**
	 * 선별등급
	 */
	private String sortGrdCd;
	/**
	 * 선별등급명
	 */
	private String sortGrdNm;

	/**
	 * 이후등급
	 */
	private String aftrGrdCd;
	
	/**
	 * 생산자식별번호
	 */
	private String prdcrIdentno;
	
	/**
	 * 마감여부
	 */
	private String ddlnYn;
	/**
	 * 매출확정여부
	 */
	private String cfmtnYn;
	/**
	 * 반품여부
	 */
	private String rtnGdsYn;
	private String rtnGdsNm;
	/**
	 * 원출하번호
	 */
	private String orgnSpmtno;
	/**
	 * 원포장번호
	 */
	private String orgnPckgno;
	/**
	 * 원포장순번
	 */
	private int orgnPckgSn;
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
	/*
	 * 팔레트불출여부
	 * */
	private String blwInvntrAprv;
	/*
	 * 선별일자기준여부
	 * */
	private String sortDsctnYn;
	/*
	 * 물류기기
	 * */
	private String lgstcsMat;
	/*
	 * 출하번호 + 생산자번호
	 * */
	private String spmtIndct;
	private String spmtInvId;

	private int rmnSpmtQntt;
	private double rmnSpmtWght;
	private int crynQntt;
	private double crynWght;
	private String crynYn;


	/**
	 * 판매금액
	 */
	private long ntslAmt;
	/**
	 * 납기일자
	 */
	private String dudtYmd;

	/**
	 * 계량번호
	 */
	private String wghno;

	/**
	 * 단가
	 */
	private String spmtSlsUntprc;

	/**
	 * 출하상품목록
	 */
	private List<SpmtGdsVO> spmtGdsList;

	/**
	 * 재고상태코드목록
	 */
	private List<String> invntrSttsCdList;

	public List<SpmtGdsVO> getSpmtGdsList() {
		return spmtGdsList == null ? null : new ArrayList<>(spmtGdsList);
	}

	public void setSpmtGdsList(List<SpmtGdsVO> spmtGdsList) {
		this.spmtGdsList = spmtGdsList == null ? null : new ArrayList<>(spmtGdsList);
	}


	public List<String> getInvntrSttsCdList() {
		return invntrSttsCdList == null ? null : new ArrayList<>(invntrSttsCdList);
	}

	public void setInvntrSttsCdList(List<String> invntrSttsCdList) {
		this.invntrSttsCdList = invntrSttsCdList == null ? null : new ArrayList<>(invntrSttsCdList);
	}

}
