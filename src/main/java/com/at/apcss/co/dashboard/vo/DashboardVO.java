package com.at.apcss.co.dashboard.vo;


import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * 대시보드 데이터를 담을 VO객체
 * @author 손민성
 * @since 2023.11.14
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일         수정자       수정내용
 *  ----------   --------   ---------------------------
 *  2023.11.14   손민성       최초 생성
 *  </pre>
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DashboardVO {
	private WrhsSttn wrhsSttn;
	private PrdctnSttn prdctnSttn;
	private SpmtPrfmnc spmtPrfmnc;
	private List<DayPrcsSttn> dayPrcsSttn;
	private String gv_apcCd;

	@Getter
	@Setter
	@AllArgsConstructor
	@NoArgsConstructor
	public static class WrhsSttn{
		private String wsDate;
		private String wgt;
	}
	@Getter
	@Setter
	@AllArgsConstructor
	@NoArgsConstructor
	public static class PrdctnSttn{
		private String psDate;
		private String sort;
		private String pckg;
	}
	@Getter
	@Setter
	@AllArgsConstructor
	@NoArgsConstructor
	public static class SpmtPrfmnc{
		private String spDate;
		private String wgt;
	}
	@Getter
	@Setter
	@AllArgsConstructor
	@NoArgsConstructor
	public static class DayPrcsSttn{
		private String dpDate;
		private String itemCd;
		private String itemNm;
		private String wgt1;
		private String wgt2;
		private String wgt3;
		private String wgt4;
		private String wgt5;
	}

	public DashboardVO(WrhsSttn wrhsSttn,PrdctnSttn prdctnSttn,SpmtPrfmnc spmtPrfmnc, List<DayPrcsSttn> dayPrcsSttn) {
		this.wrhsSttn = wrhsSttn;
		this.prdctnSttn = prdctnSttn;
		this.spmtPrfmnc = spmtPrfmnc;
		this.dayPrcsSttn = dayPrcsSttn;
	}
	public DashboardVO(String gv_apcCd) {
		this.gv_apcCd = gv_apcCd;
	}

}
