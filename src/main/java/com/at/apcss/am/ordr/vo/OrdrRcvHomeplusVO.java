package com.at.apcss.am.ordr.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : OrdrRcvHomeplusVO.java
 * @Description : 홈플러스 발주 수신 정보에 대한 VO 클래스
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
public class OrdrRcvHomeplusVO extends ComVO{

	private String apcCd;
	private String rcptnYmd;    //	수신일자
	private int rcptnSn;     //	수신순번
	private String prcsSeCd;    //	처리구분코드
	private String dldtnYmd;    //	배송일자
	private String outordrno;   //	발주번호
	private String outordrType; //	발주유형
	private String docNo;       //	문서번호
	private String wrhsType;    //	입고유형
	private String wrhsTypeNm;  //	입고유형명칭
	private String outordrYmd;  //	발주일자
	private String dlvgdsYmd;   //	납품일자
	private String ordrPrsn;    //	주문자
	private String ordrPrsnCd;	//	주문자코드
	private String buyerNm;		//	바이어명
	private String dlvgdsCo;    //	납품처
	private String splyPrsn;    //	공급자
	private String gdsNm;       //	상품명
	private String gdsCd;       //	상품코드
	private String tpnd;        //	TPND
	private String tpnb;        //	TPNB
	private String diamondline; //	DiamondLine
	private String dldtn;       //	배송지
	private String wrhsType2;   //	입고유형2
	private int bxGdsQntt;   //	입수
	private int outordrQntt; //	발주수량
	private int pieceQntt;   //	낱개수량
	private String unit;        //	단위
	private double bxUntprc;    //	박스당 단가
	private double pieceUntprc; //	낱개당 단가
	private double txAmt;       //	세액
	private double outordrAmt;  //	발주금액
	private String dldtnCd;     //	배송지코드
	private String outordrYmd2; //	발주일자2
	private String wrhsYmd;     //	입고일자
	private String dlvgdsNm;    //	납품처명
	private String dlvgdsCd;    //	납품처코드
	private String cntrSe;      //	센터구분
	private String cntrCd;		//	센터코드
	private String cntrNm;		//	센터명
}