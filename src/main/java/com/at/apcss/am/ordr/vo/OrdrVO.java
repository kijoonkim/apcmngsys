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
	private String ordrNo;
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
	private String pckgCmndNo;
	
	/**
	 * 문서번호
	 */
	private String docNo;
	
	/**
	 * 거래처발주번호
	 */
	private String cnptOrdrNo;
	
	/**
	 * 발주유형
	 */
	private String ordrType;
	
	/**
	 * 입고유형
	 */
	private String wrhsType;
	
	/**
	 * 발주일자
	 */
	private String ordrYmd;
	
	/**
	 * 주문자
	 */
	private String ordrPrsn;
	
	/**
	 * 주문자코드
	 */
	private String ordrPrsnCd;
	
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
	 * 품종코드
	 */
	private String vrtyCd;
	
	/**
	 * 규격코드
	 */
	private String spcfctCd;
	
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
	private int ordrQntt;
	
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
	private String ordrUntprc;
	
	/**
	 * 발주단위
	 */
	private String ordrUnit;
	
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
	private double ordrAmt;
	
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
	 * 센터구분코드
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
}
