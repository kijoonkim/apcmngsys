package com.at.apcss.co.pms.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DvlpPrgrsMngVO extends ComVO{
	/*
	 * 프로그램ID
	 */
	private String prgrmId;
	/*
	 * 프로그램명
	 */
	private String PrgrmNm;
	/*
	 * 상태
	 */
	private String stts;
	/*
	 * 분류
	 */
	private String clsf;
	/*
	 * 개발계획일자
	 */
	private String dvlpPlanYmd;
	/*
	 * 개발완료일자
	 */
	private String dvlpCmptnYmd;
	/*
	 * 테스트계획일자
	 */
	private String testPlanYmd;
	/*
	 * 테스트완료일자
	 */
	private String testCmptnYmd;
	/*
	 * 비고
	 */
	private String rmrk;
	/*
	 * 담당자
	 */
	private String pic;

	/*
	 * 결함 수
	 */
	private String dfctCnt;
	/*
	 * 완료 수
	 */
   private String actnCnt;
   /*
    * 지연여부
    */
   private String dvlpStts;

}
