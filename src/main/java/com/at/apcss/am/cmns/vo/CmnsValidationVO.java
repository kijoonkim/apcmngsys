package com.at.apcss.am.cmns.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : CmnsValidationVO.java
 * @Description : 업무 Validation에 대한 VO 클래스
 * @author 신정철
 * @since 2023.08.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class CmnsValidationVO {
	String apcCd;
	String cdId;
	String cdVl;
	String ymd;
	String extrArgs;
	String rtnMsg;
}
