package com.at.apcss.am.cmns.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : CmnsTaskNoVO.java
 * @Description : 업무번호에 대한 VO 클래스
 * @author 신정철
 * @since 2023.07.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class CmnsTaskNoVO {
	String apcCd;
	String ymd;
	String taskId;
	String taskNo;
}
