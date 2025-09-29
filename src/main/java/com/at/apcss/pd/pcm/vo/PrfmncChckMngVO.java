package com.at.apcss.pd.pcm.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PrfmncChckMngVO extends ComVO{
	private String yr;			//등록년도
	private String apoCd;		//조직코드
	private String apoSe;		//조직구분
	private String brno;		//사업자등록번호
	private String crno;		//법인등록번호
	private String corpNm;		//법인명
	private String aprv;		//승인형/육성형 구분

	private String itemCd;		//품목코드
	private String itemNm;		//품목명
	private String itemNmList;	//보유 품목 리스트
	private String slctnYr;		//승인연도

	private String prfmncAmt1;		//1월실적
	private String prfmncAmt2;		//2월실적
	private String prfmncAmt3;		//3월실적
	private String prfmncAmt4;		//4월실적
	private String prfmncAmt5;		//5월실적
	private String prfmncAmt6;		//6월실적
	private String prfmncAmt7;		//7월실적
	private String prfmncAmt8;		//8월실적
	private String prfmncAmt9;		//9월실적
	private String prfmncAmt10;		//10월실적
	private String prfmncAmt11;		//11월실적
	private String prfmncAmt12;		//12월실적

	private String prevYrPrfmncAmt;	//전년도말 실적
	private String expctPrfmncAmt;	//24년말 기준(예상치)
	private String prfmncAmtRt;		//연말전망치 기준 증감률(%)

	//20241127 전문 육성 구분 추가
	private String sttgUpbrItemNm;	//전문/육성 구분

	/**
	 * 품목구분 (전문품목,육성품목, 기타품목)
	 */
	private String sttgUpbrItemSe;

	/**
	 * 실적 합계
	 */
	private int prfmncAmtTot;

}
