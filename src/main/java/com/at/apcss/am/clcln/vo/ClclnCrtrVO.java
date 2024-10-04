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
public class ClclnCrtrVO extends ComVO {

	private String apcCd;
	private String clclnCrtrType;
	private String clclnCrtrTypeNm;
	private int crtrTypeSeq;
	private String crtrCd;
	private String crtrIndctNm;
	private double crtrVl;
	private int indctSeq;
	private String useYn;
	private int crtrSeq;
	private String crtrUseYn;
	private String clclnDtlType ;
	private int dtlSn;
	private String dtlCd;
	private double dtlVl;
	private String dtlIndctNm;
	private String dtlCrtrCd;
	private String crtrDtlUseYn;
	private String dtlLnkgCd;
	private String crtrRmrk;
	private int crtrDtlSeq;
	
	private int maxDtlSn;
	
	private boolean needsInsert;
}
