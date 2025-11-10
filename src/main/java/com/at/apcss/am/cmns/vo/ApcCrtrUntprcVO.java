package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.cd.vo.ComCdVO;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : ApcCrtrUntprcVO.java
 * @Description : APC기준단가에 대한 VO 클래스
 * @author 김호
 * @since 2025.10.07
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.10.07  김호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class ApcCrtrUntprcVO extends ComCdVO {

	/**
	 * 기준단가코드
	 */
	private String crtrUntprcCd;
	/**
	 * 기준단가
	 */
	private double crtrUntprc;
	/**
	 * 표시명
	 */
	private String indctNm;

}
