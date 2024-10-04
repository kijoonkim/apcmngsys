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
public class ClclnRsltVO extends ComVO {

	private String apcCd;
	private String clclnYr;
	private String clclnSn;
	private int untprcSn;
	private String untprcDtlCd;
	private String untprcDtlNm;
	private String clclnUntprcKnd;
	private String clclnSeCd;
	private String clclnClsf;
	private String itemCd;
	private String vrtyCd;
	private double clclnUntprc;
	private double clclnQntt;
	private double clclnWght;
	private double clclnAmt;
	private String untprcRmrk;
}
