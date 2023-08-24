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

	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * APC구분코드
	 */
	private String apcSeCd;
	/**
	 * 발주번호
	 */
	private String outordrno;
	/**
	 * 창고구분
	 */
	private String warehouseSeCd;
	/**
	 * 접수여부
	 */
	private String rcptYn;
	/**
	 * 수신구분코드
	 */
	private String rcptnSeCd;
	/**
	 * 수신번호
	 */
	private String rcptnNo;
	/**
	 * 접수확정APC코드
	 */
	private String rcptCfmtnApcCd;
	
	/**
	 * 접수확정일자
	 */
	private String rcptCfmtnYmd;
	
	/**
	 * 포장지시번호
	 */
	private String pckgCmndno;
	
	/**
	 * 포장지시일자
	 */
	private String pckgCmndYmd;
	
	/**
	 * 설비코드
	 */
	private String fcltCd;
	
	/**
	 * 문서번호
	 */
	private String docno;
	
	/**
	 * 거래처발주번호
	 */

	private String cnptOrdrno;
	
	/**
	 * 거래처코드
	 */
	private String cnptCd;
	
	/**
	 * 발주유형
	 */
	private String outordrType;
	
	/**
	 * 입고유형
	 */
	private String wrhsType;
	
	/**
	 * 발주일자
	 */
	private String outordrYmd;
	
	/**
	 * 발주시작일자
	 */
	private String outordrYmdFrom;
	
	/**
	 * 발주종료일자
	 */
	private String outordrYmdTo;
	
	/**
	 * 출하일자
	 */
	private int spmtYmd;
	
	/**
	 * 주문자
	 */
	private String outordrPrsn;
	
	/**
	 * 주문자코드
	 */
	private String outordrPrsnCd;
	
	/**
	 * 도크정보
	 */
	private String dockInfo;
	
	/**
	 * 공급자
	 */
	private String splyPrsn;
	
	/**
	 * 상품명
	 */
	private String gdsNm;
	
	/**
	 * 상품코드
	 */
	private String gdsCd;
	
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
	 * TPND
	 */
	private String tpnd;
	
	/**
	 * TPNB
	 */
	private String tpnb;
	
	/**
	 * Diamondline
	 */
	private String diamondline;
	
	/**
	 * 배송지
	 */
	private String dldtn;
	
	/**
	 * 입수
	 */
	private int bxGdsQntt;
	
	/**
	 * 발주수량
	 */
	private int outordrQntt;
	
	/**
	 * 출하수량
	 */
	private int spmtQntt;

	/**
	 * 출하중량
	 */
	private int spmtWght;

	/**
	 * 재고수량
	 */
	private int invntrQntt;

	/**
	 * 재고중량
	 */
	private int invntrWght;

	/**
	 * 낱개수량
	 */
	private int pieceQntt;
	
	/**
	 * 단위
	 */
	private String unit;
	
	/**
	 * 박스당단가
	 */
	private String bxUntprc;
	
	/**
	 * 발주단가
	 */
	private String outordrUntprc;
	
	/**
	 * 발주단위
	 */
	private String outordrUnit;
	
	/**
	 * LOT
	 */
	private String lot;
	
	/**
	 * 세액
	 */
	private double txAmt;
	
	/**
	 * 발주금액
	 */
	private double outordrAmt;
	
	/**
	 * 배송지코드
	 */
	private String dldtnCd;
	
	/**
	 * 입고일자
	 */
	private String wrhsYmd;
	
	/**
	 * 납품처명
	 */
	private String dlvgdsNm;
	
	/**
	 * 납품처코드
	 */
	private String dlvgdsCd;
	
	/**
	 * APC거래처명
	 */
	private String apcCnptNm;
	
	/**
	 * APC거래처코드
	 */
	private String apcCnptCd;
	
	/**
	 * 센터구분
	 */
	private String cntrSe;
	
	/**
	 * 바이어명
	 */
	private String buyerNm;
	
	/**
	 * 센터입하일자
	 */
	private String cntrRcvdWrhsYmd;
	
	/**
	 * 센터코드
	 */
	private String cntrCd;
	
	/**
	 * 센터이름
	 */
	private String cntrNm;
	
	/**
	 * 납품구분
	 */
	private String dlvgdsSeCd;
	
	/**
	 * 기타
	 */
	private String etc;

	/**
	 * 출하지시 수량
	 */
	private int cmndQntt;
}
