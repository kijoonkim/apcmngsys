package com.at.apcss.am.ordr.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : OrdrVO.java
 * @Description : 발주정보에 대한 VO 클래스
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
public class OrdrVO extends ComVO {

	/*
	 * APC코드
	 * */
	private String apcCd;
	/*
	 * APC구분코드
	 * */
	private String apcSeCd;
	/*
	 * 발주번호
	 * */
	private String outordrno;
	/*
	 * 수신구분
	 * */
	private String rcptnSeCd;
	/*
	 * 수신번호
	 * */
	private String rcptnno;
	/*
	 * 접수확정APC코드
	 * */
	private String rcptCfmtnApcCd;
	/*
	 * 접수확정APC명
	 * */
	private String rcptCfmtnApcNm;
	/*
	 * 접수확정일자
	 * */
	private String rcptCfmtnYmd;
	/*
	 * 출하지시번호
	 * */
	private String spmtCmndno;
	/*
	 * 문서번호
	 * */
	private String docNo;
	/*
	 * 거래처발주번호
	 * */
	private String cnptOrdrno;
	/*
	 * 발주타입
	 * */
	private String outordrType;
	private String outordrTypeNm;
	/*
	 * 입고유형
	 * */
	private String wrhsType;
	/*
	 * 발주일자
	 * */
	private String outordrYmd;
	private String outordrYmdFrom;
	private String outordrYmdTo;
	/*
	 * 주문자
	 * */
	private String ordrPrsn;
	/*
	 * 주문자코드
	 * */
	private String ordrPrsnCd;
	/*
	 * 도크정보
	 * */
	private String dockInfo;
	/*
	 * 공급자명
	 * */
	private String splyPrsn;
	/*
	 * 상품코드
	 * */
	private String gdsCd;
	private String gdsNm;
	/*
	 * 품목코드
	 * */
	private String itemCd;
	private String itemNm;
	/*
	 * 품종코드
	 * */
	private String vrtyCd;
	private String vrtyNm;
	/*
	 * 규격코드
	 * */
	private String spcfctCd;
	private String spcfctNm;
	/*
	 * TPND
	 * */
	private String tpnd;
	/*
	 * TPNB
	 * */
	private String tpnb;
	/*
	 * Diamondline
	 * */
	private String diamondline;
	/*
	 * 배송지
	 * */
	private String dldtn;
	/*
	 * 입수
	 * */
	private int bxGdsQntt;
	/*
	 * 발주수량
	 * */
	private int outordrQntt;
	/*
	 * 낱개수량
	 * */
	private int pieceQntt;
	/*
	 * 발주단가
	 * */
	private int outordrUntprc;
	/*
	 * 단위코드
	 * */
	private String unitCd;
	private String unitNm;
	/*
	 * 박스당단가
	 * */
	private int bxUntprc;
	/*
	 * 발주단위코드
	 * */
	private String outordrUnitCd;
	private String outordrUnitNm;
	/*
	 * LOT
	 * */
	private String lot;
	/*
	 * 세액
	 * */
	private int txAmt;
	/*
	 * 발주금액
	 * */
	private int outordrAmt;
	/*
	 * 배송지코드
	 * */
	private String dldtnCd;
	/*
	 * 입고일자
	 * */
	private String wrhsYmd;
	/*
	 * 납품처명
	 * */
	private String dlvgdsNm;
	/*
	 * 납품처코드
	 * */
	private String dlvgdsCd;
	/*
	 * APC거래처명
	 * */
	private String apcCnptNm;
	/*
	 * APC거래처코드
	 * */
	private String apcCnptCd;
	/*
	 * 센터구분콯드
	 * */
	private String cntrSe;
	private String cntrSeCd;
	private String cntrSeNm;
	/*
	 * 센터입하일자
	 * */
	private String cntrRcvdWrhsYmd;
	/*
	 * 센터코드
	 * */
	private String cntrCd;
	/*
	 * 센터이름
	 * */
	private String cntrNm;
	/*
	 * 납품구분코드
	 * */
	private String dlvgdsSeCd;
	/*
	 * 기타
	 * */
	private String etc;
	/*
	 * 바이어명
	 * */
	private String buyerNm;
	/*
	 * 발주중량
	 * */
	private double outordrWght;
	/*
	 * 낱개중량
	 * */
	private double pieceWght;
	/*
	 * 단중
	 * */
	private double unitWght;
	/*
	 * 출하포장단위코드
	 * */
	private String spmtPckgUnitCd;
	private String spmtPckgUnitNm;
	/*
	 * 등급코드
	 * */
	private String grdCd;
	private String grdNm;
	/*
	 * 공통등급코드
	 * */
	private String gdsGrd;
	private String gdsGrdNm;

	/*
	 * 등록일자
	 * */
	private String regYmd;
	/*
	 * 등록자
	 * */
	private String regUserNm;

	/*
	 * 재고수량
	 * */
	private int invntrQntt;
	/*
	 * 재고중량
	 * */
	private double invntrWght;
	/*
	 * 출하수량
	 * */
	private int spmtQntt;
	/*
	 * 출하중량
	 * */
	private double spmtWght;
	/*
	 * 창고코드
	 * */
	private String warehouseSeCd;
	private String warehouseSeNm;
	/*
	 * 단위중량
	 * */
	private double wght;
	/*
	 * 출하지시수량
	 * */
	private int cmndQntt;
	/*
	 * 출하지시중량
	 * */
	private double cmndWght;
	/*
	 * 출하일자
	 * */
	private String spmtYmd;
	/*
	 * 접수여부
	 * */
	private String rcptYn;
	/*
	 * 출하지시일자
	 * */
	private String cmndYmd;
	/*
	 * 운송회사코드
	 * */
	private String trsprtCoCd;
	/*
	 * 비고
	 * */
	private String rmrk;
	
	/**
	 * 원상품코드
	 */
	private String orgnGdsCd;
	
	/**
	 * 원상품명
	 */
	private String orgnGdsNm;
	

}