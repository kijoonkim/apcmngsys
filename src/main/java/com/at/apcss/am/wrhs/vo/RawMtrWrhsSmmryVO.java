package com.at.apcss.am.wrhs.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.am.invntr.vo.RawMtrStdGrdVO;
import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : RawMtrWrhsSmmryVO.java
 * @Description : 원물입고요약에 대한 VO 클래스
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
public class RawMtrWrhsSmmryVO extends ComVO {
	
	/**
	 * APC코드
	 */
	private String apcCd;
	
	/**
	 * 입고일자
	 */
	private String wrhsYmd;
	private String wrhsYmdFrom;
	private String wrhsYmdTo;
	
	private String wrhsBgngYmd;
	private String wrhsEndYmd;
	private String wrhsCmptnYn;
	
	private String prdcrCd;
	private String itemCd;
	private String vrtyCd;
	private String gdsSeCd;
	private String wrhsSeCd;
	private String trsprtSeCd;
	private String warehouseSeCd;
	private String grdCd;
	private String prdctnYr;
	private String invntrSttsCd;
	private int qnttCycl1;
	private int qnttCycl2;
	private int qnttCycl3;
	private int qnttCycl4;
	private int qnttCycl5;
	private double wghtCycl1;
	private double wghtCycl2;
	private double wghtCycl3;
	private double wghtCycl4;
	private double wghtCycl5;
	private String rmrk;
	private String prdcrNm;
	private String itemNm;
	private String vrtyNm;
	private String gdsSeNm;
	private String wrhsSeNm;
	private String trsprtSeNm;
	private String warehouseSeNm;
	private String grdNm;
	private String invntrSttsNm;

	private String vrtyCd1;
	private String vrtyCd2;
	private String vrtyCd3;
	private String vrtyCd4;
	private String vrtyCd5;

	private String v1WrhsCmptnYn;
	private String v2WrhsCmptnYn;
	private String v3WrhsCmptnYn;
	private String v4WrhsCmptnYn;
	private String v5WrhsCmptnYn;
	
	private int v1Qntt;
	private int v2Qntt;
	private int v3Qntt;
	private int v4Qntt;
	private int v5Qntt;
	
	private double v1Wght;
	private double v2Wght;
	private double v3Wght;
	private double v4Wght;
	private double v5Wght;
	
	private int v1QnttCycl1;
	private int v1QnttCycl2;
	private int v1QnttCycl3;
	private int v1QnttCycl4;
	private int v1QnttCycl5;
	private double v1WghtCycl1;
	private double v1WghtCycl2;
	private double v1WghtCycl3;
	private double v1WghtCycl4;
	private double v1WghtCycl5;
	
	private int v2QnttCycl1;
	private int v2QnttCycl2;
	private int v2QnttCycl3;
	private int v2QnttCycl4;
	private int v2QnttCycl5;
	private double v2WghtCycl1;
	private double v2WghtCycl2;
	private double v2WghtCycl3;
	private double v2WghtCycl4;
	private double v2WghtCycl5;
	
	private int v3QnttCycl1;
	private int v3QnttCycl2;
	private int v3QnttCycl3;
	private int v3QnttCycl4;
	private int v3QnttCycl5;
	private double v3WghtCycl1;
	private double v3WghtCycl2;
	private double v3WghtCycl3;
	private double v3WghtCycl4;
	private double v3WghtCycl5;
	
	private int v4QnttCycl1;
	private int v4QnttCycl2;
	private int v4QnttCycl3;
	private int v4QnttCycl4;
	private int v4QnttCycl5;
	private double v4WghtCycl1;
	private double v4WghtCycl2;
	private double v4WghtCycl3;
	private double v4WghtCycl4;
	private double v4WghtCycl5;
	
	private int v5QnttCycl1;
	private int v5QnttCycl2;
	private int v5QnttCycl3;
	private int v5QnttCycl4;
	private int v5QnttCycl5;
	private double v5WghtCycl1;
	private double v5WghtCycl2;
	private double v5WghtCycl3;
	private double v5WghtCycl4;
	private double v5WghtCycl5;
	
	private int qnttCyclSum;
	
}
