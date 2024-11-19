package com.at.apcss.am.clcln.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : ClclnApcUntprcVO.java
 * @Description : APC정산단가에 대한 VO 클래스
 * @author 신정철
 * @since 2023.10.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class ClclnRsltDtlVO extends ComVO {

	private String apcCd;
	private String clclnYr;
	private int clclnSn;
	private String clclnTrprType;
	private String prdcrCd;
	
	private String rtnCd;
	private String rtnMsg;
	
	private int rsltSn;
	private String clclnCrtrType;
	private String crtrCd;
	private String dtlCd;
	private String wrhsSeCd;
	private String gdsSeCd;
	private String itemCd;
	private String itemVrtyCd;
	private String spcfctCd;
	private String grdCd;
	private String clclnSeCd;
	private String clclnClsf;
	private String untprcUnit;
	
	private double clclnUntprc;
	private int clclnQntt;
	private double clclnWght;
	private double clclnAmt;
	private double cfmtnAmt;
	private String cfmtnYn;
	private String clclnRmrk;
	private String dtlExtraCd;
	
	private String elmtQntt;
	private String elmtWght;
	private String elmtUntprc;
	private String elmtAmt;
	private String elmtRmrk;
	
	private boolean needsInsert;	
}
