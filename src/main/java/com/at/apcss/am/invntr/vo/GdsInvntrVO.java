package com.at.apcss.am.invntr.vo;

import java.util.List;
import java.util.stream.Collectors;
import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : GdsInvntrVO.java
 * @Description : 상품재고정보에 대한 VO 클래스
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
public class GdsInvntrVO extends ComVO {

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
	/**
	 * 포장일자
	 */
	private String CRTR_YMD;
	/**
	 * 포장일자From
	 */
	private String pckgYmdFrom;
	/**
	 * 포장일자To
	 */
	private String pckgYmdTo;

	/**
	 * 설비코드
	 */
	private String fcltCd;

	/**
	 * 대표생산자코드
	 */
	private String rprsPrdcrCd;
	private String prdcr;
	/**
	 * 대표생산자명
	 */
	private String prdcrNm;

	/**
	 * 품목코드
	 */
	private String itemCd;
	/**
	 * 품목명
	 */
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
	 * 규격코드
	 */
	private String spcfctCd;
	/**
	 * 규격명
	 */
	private String spcfctNm;

	/**
	 * 상품등급
	 */
	private String gdsGrd;
	/**
	 * 상품등급명
	 */
	private String gdsGrdNm;
	/**
	 * 선별등급명
	 */
	private String sortGrdCd;
	private String sortGrdNm;

	/**
	 * 포장구분코드
	 */
	private String pckgSeCd;

	/**
	 * 출하포장단위코드
	 */
	private String spmtPckgUnitCd;
	/**
	 * 출하포장단위명
	 */
	private String spmtPckgUnitNm;

	/**
	 * 포장구분명
	 */
	private String pckgSeNm;

	/**
	 * 창고구분코드
	 */
	private String warehouseSeCd;
	/**
	 * 창고구분명
	 */
	private String warehouseSeNm;

	/**
	 * 포장수량
	 */
	private int pckgQntt;

	/**
	 * 포장중량
	 */
	private double pckgWght;
	/**
	 * 포장수량
	 */
	private int trnsfQntt;

	/**
	 * 포장중량
	 */
	private double trnsfWght;

	/**
	 * 출하수량
	 */
	private int spmtQntt;

	/**
	 * 출하중량
	 */
	private double spmtWght;

	/**
	 * 재고수량
	 */
	private int invntrQntt;

	/**
	 * 재고중량
	 */
	private double invntrWght;

	/**
	 * 잔여수량
	 */
	private int rmnQntt;
	/**
	 * 잔여중량
	 */
	private double rmnWght;
	
	
	/**
	 * 지시수량
	 */
	private int cmndQntt;

	/**
	 * 지시중량
	 */
	private double cmndWght;

	/**
	 * 상품구분코드
	 */
	private String gdsSeCd;
	private String gdsSe;
	/**
	 * 상품구분명
	 */
	private String gdsSeNm;
	/*
	 * 설비코드명
	 * */
	private String fcltNm;
	/*
	 * 대표생산자명
	 * */
	private String rprsPrdcrNm;
	/*
	 * 브랜드명
	 * */
	private String brndNm;

	/**
	 * 상품코드
	 */
	private String gdsCd;
	private String gdsNm;

	/**
	 * 매입처명
	 */
	private String prchsptNm;

	/**
	 * 입고구분코드
	 */
	private String wrhsSeCd;

	/**
	 * 운송구분코드
	 */
	private String trsprtSeCd;

	/**
	 * 생산연도
	 */
	private String prdctnYr;


	/*
	 * 산지코드
	 * */
	private String plorCd;

	/*비고*/
	private String rmrk;
	/*기준일자*/
	private String crtrYmd;
	/*입고구분*/
	private String wrhsSe;

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
	private String chgRsn;

	/*
	 * 이송여부
	 * */
	private String trnsfYn;
	/*
	 * 이송날짜
	 * */
	private String trnsfYmd;
	/*
	 * 이송순번
	 * */
	private int trnsfSn;
	/*
	 * 이송APC코드
	 * */
	private String trnsfApcCd;

	/**
	 * 처리번호
	 */
	private String prcsNo;
	/**
	 * 처리순번
	 */
	private int prcsSn;

	/**
	 * 처리유형
	 */
	private String prcsType;

	/*
	 * 반품수량
	 * */
	private int rtnGdsQntt;
	/*
	 * 반품중량
	 * */
	private double rtnGdsWght;


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
