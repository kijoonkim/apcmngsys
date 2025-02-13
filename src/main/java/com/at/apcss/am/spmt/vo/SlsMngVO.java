package com.at.apcss.am.spmt.vo;

import java.util.List;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SlsMngVO extends ComVO{
	
	

	/**
	 * APC코드
	 */
	private String apcCd;
	
	/**
	 * 매출기준유형
	 */
	private String slsCrtrType;
	
	/**
	구분
	**/
	private String gubun;

	/**
	상태
	**/
	private String status;
	
	/**
	 * 기준코드
	 */
	private String crtrCd;
	
	/**
	 * 기준값
	 */
	private String crtrVl;
	
	/**
	 * 기준표시명
	 */
	private String crtrIndctNm;
	
	/**
	 * 표시순서
	 */
	private String indctSeq;

	/**
	 * 사용여부
	 */
	private String useYn;

	/**
	 * 삭제여부
	 */
	private String delYn;
	
	/**
	 * 상세일련번호
	 */
	private String dtlSn;
	
	/**
	 * 상세코드
	 */
	private String dtlCd;
	
	
	/**
	 * 상세값
	 */
	private String dtlVl;
	
	/**
	 * 상세표시명
	 */
	private String dtlChrVl;

	/**
	 * 상세표시명
	 */
	private String dtlIndctNm;
	

	/**
	 * 매출일자
	 */
	private String slsYmd;
	
	/**
	 * 매출시작일자
	 */
	private String slsYmdFrom;
	
	/**
	 * 매출종료일자
	 */
	private String slsYmdTo;
	

	/**
	 * 매출순번
	 */
	private int slsSn;
	

	/**
	 * 거래처코드
	 */
	private String cnptCd;

	/**
	 * 상품코드
	 */
	private String gdsCd;

	/**
	 * 품목코드
	 */
	private String itemCd ;
	
	/**
	 * 품목명
	 */
	private String itemNm ;
	
	/**
	 * 품종코드
	 */
	private String vrtyCd;
	
	/**
	 * 품종명
	 */
	private String vrtyNm ;
	

	/**
	 * 규격코드
	 */
	private String spcfctCd;
	
	/**
	 * 규격명
	 */
	private String spcfctNm ;
	
	/**
	 * 등급코드
	 */
	private String grdCd ;
	
	
	/**
	 * 브랜드명
	 */
	private String brndNm;

	/**
	 * 출하일자
	 */
	private String spmtYmd;

	/**
	 * 수량
	 */
	private int qntt ;
	

	/**
	 * 중량
	 */
	private double wght;

	/**
	 * 매출단가
	 */
	private int slsUntprc ;

	/**
	 * 계산금액
	 */
	private int rkngAmt;
	

	/**
	 * 확정금액
	 */
	private int cfmtnAmt;

	/**
	 * 확정여부
	 */
	private String cfmtnYn;

	/**
	 * 출하번호
	 */
	private String spmtno;
	
	/**
	 * 포장번호
	 */
	private String pckgno ;
	
	/**
	 * 포장순번
	 */
	private int pckgSn;
	
	/**
	 * 수금여부
	 */
	private String clctmYn;
	
	/**
	 * 출하포장단위코드
	 */
	private String spmtPckgUnitCd;
	
	/**
	 * 출하매출단가코드
	 */
	private String spmtSlsUntprcCd;
	
	/**
	 * 출하매출단가
	 */
	private int spmtSlsUntprc;
	
	/**
	 * 비고
	 */
	private String rmrk;
	
	/**
	 * 적용기준일자
	 */
	private String aplcnCrtrYmd;
	
	/**
	 * 적용기준일자시작
	 */
	private String aplcnCrtrYmdFrom;
	
	/**
	 * 적용기준일자종료
	 */
	private String aplcnCrtrYmdTo ;
	
	/**
	 * 출하포장단위명
	 */
	private String spmtPckgUnitNm;
	
	/**
	 * 판매단가
	 */
	private String ntslUntprc;
	
	/**
	 * 상품등급
	 */
	private String gdsGrd;
	
	/**
	 * 외부연결코드
	 */
	private String extrnlLnkgCd ;
	
	/**
	 * 생산자코드
	 */
	private String prdcrCd ;
	
	/**
	 * 생산자명
	 */
	private String prdcrNm ;

	/**
	 * 품목품종코드
	 */
	private String itemVrtyCd ;

	/**
	 * 품목규격코드
	 */
	private String itemSpcfctCd ;

	/**
	 * 상품명
	 */
	private String gdsNm ;

	/** *
	 *  시스템 최초 입력 일시
	 *   */
	private String sysFrstInptDt;

	/** *
	 *  시스템 최초 입력 사용자 ID
	 *  */
	private String sysFrstInptUserId;

	/** *
	 *  시스템 최초 입력 프로그램 ID
	 *  */
	private String sysFrstInptPrgrmId;

	/** *
	 *  시스템 최종 변경 일시
	 *  */
	private String sysLastChgDt;

	/** *
	 *  시스템 최종 변경 사용자 ID
	 *  */
	private String sysLastChgUserId;

	/** *
	 *  시스템 최종 변경 프로그램 ID
	 *  */
	private String sysLastChgPrgrmId;

	/**
	 * 현재날짜
	 */
	private String todayDate;

	List<SlsMngVO> slsPrfmncList;
	
	
	
}
