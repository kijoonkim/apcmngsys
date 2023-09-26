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
	 * 접수확정일자
	 * */
	private String rcptCfmtnYmd;
	/*
	 * 포장지시번호
	 * */
	private String pckgCmndno;
	/*
	 * 문서번호
	 * */
	private String docno;
	/*
	 * 거래처발주번호
	 * */
	private String cnptOrdrno;
	/*
	 * 발주타입
	 * */
	private String outordrType;
	/*
	 * 입고유형
	 * */
	private String wrhsType;
	/*
	 * 발주일자
	 * */
	private String outordrYmd;
	/*
	 * 주문자
	 * */
	private String outordrPrsn;
	/*
	 * 주문자코드
	 * */
	private String outordrPrsnCd;
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
	private String bxGdsQntt;
	/*
	 * 발주수량
	 * */
	private String outordrQntt;
	/*
	 * 낱개수량
	 * */
	private String pieceQntt;
	/*
	 * 단위코드
	 * */
	private String unitCd;
	private String unitNm;
	/*
	 * 박스당단가
	 * */
	private String bxUntprc;
	/*
	 * 발주단가
	 * */
	private String outordrUntprc;
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
	private String txAmt;
	/*
	 * 발주금액
	 * */
	private String outordrAmt;
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
	private String outordrWght;
	/*
	 * 낱개중량
	 * */
	private String pieceWght;
	/*
	 * 단중
	 * */
	private String unitWght;
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


}
/*
 * SELECT
       OI.APC_CD                AS APC_CD
     , OI.APC_SE_CD             AS APC_SE_CD
     , OI.OUTORDRNO             AS OUTORDRNO
     , OI.RCPTN_SE_CD           AS RCPTN_SE_CD
     , OI.OUTORDR_TYPE          AS OUTORDR_TYPE
     , OI.WRHS_TYPE             AS WRHS_TYPE
     , OI.OUTORDR_YMD           AS OUTORDR_YMD
     , OI.OUTORDR_PRSN          AS OUTORDR_PRSN
     , OI.OUTORDR_PRSN_CD       AS OUTORDR_PRSN_CD
     , OI.DOCK_INFO             AS DOCK_INFO
     , OI.SPLY_PRSN             AS SPLY_PRSN
     , OI.GDS_CD                AS GDS_CD
     , OI.ITEM_CD               AS ITEM_CD
     , OI.VRTY_CD               AS VRTY_CD
     , OI.SPCFCT_CD             AS SPCFCT_CD
     , OI.TPND                  AS TPND
     , OI.TPNB                  AS TPNB
     , OI.DIAMONDLINE           AS DIAMONDLINE
     , OI.DLDTN                 AS DLDTN
     , OI.BX_GDS_QNTT           AS BX_GDS_QNTT
     , OI.OUTORDR_QNTT          AS OUTORDR_QNTT
     , OI.PIECE_QNTT            AS PIECE_QNTT
     , OI.UNIT                  AS UNIT
     , OI.BX_UNTPRC             AS BX_UNTPRC
     , OI.OUTORDR_UNTPRC        AS OUTORDR_UNTPRC
     , OI.OUTORDR_UNIT          AS OUTORDR_UNIT
     , OI.LOT                   AS LOT
     , OI.TX_AMT                AS TX_AMT
     , OI.OUTORDR_AMT           AS OUTORDR_AMT
     , OI.DLDTN_CD              AS DLDTN_CD
     , OI.WRHS_YMD              AS WRHS_YMD
     , OI.DLVGDS_NM             AS DLVGDS_NM
     , OI.DLVGDS_CD             AS DLVGDS_CD
     , OI.APC_CNPT_NM           AS APC_CNPT_NM
     , OI.APC_CNPT_CD           AS APC_CNPT_CD
     , OI.CNTR_SE               AS CNTR_SE
     , OI.CNTR_RCVD_WRHS_YMD    AS CNTR_RCVD_WRHS_YMD
     , OI.CNTR_CD               AS CNTR_CD
     , OI.CNTR_NM               AS CNTR_NM
     , OI.DLVGDS_SE_CD          AS DLVGDS_SE_CD
     , OI.ETC                   AS ETC
     , OI.BUYER_NM              AS BUYER_NM
     , OI.OUTORDR_WGHT          AS OUTORDR_WGHT
     , OI.PIECE_WGHT            AS PIECE_WGHT
     , OI.UNIT_WGHT             AS UNIT_WGHT
     , OI.SPMT_PCKG_UNIT_CD     AS SPMT_PCKG_UNIT_CD
     , OI.GRD_CD                AS GRD_CD
     , OI.DEL_YN                AS DEL_YN
  FROM TB_OUTORDR_INFO OI
 WHERE OI.DEL_YN = 'N'
 * */
