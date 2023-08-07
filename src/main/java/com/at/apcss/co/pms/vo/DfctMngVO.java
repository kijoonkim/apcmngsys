package com.at.apcss.co.pms.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DfctMngVO extends DvlpPrgrsMngVO{

	/*
	 * 결함순번
	 */
	private String dfctSn;
	/*
	 * 결함내용
	 */
	private String dfctCn;
	/*
	 * 등록자
	 */
	private String regPrsnNm;
	/*
	 * 담당자 조치결과
	 */
	private String actnRslt;
	/*
	 * 발생일자
	 */
	private String ocrnYmd;
	/*
	 * 조치일자
	 */
	private String actnYmd;

}
