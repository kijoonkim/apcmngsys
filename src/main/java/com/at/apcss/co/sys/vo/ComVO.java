package com.at.apcss.co.sys.vo;

import lombok.Getter;
import lombok.Setter;
/**
 * 공통 VO
 * @author FINEVT 개발팀 김호
 * @since 2023.05.18
 * @version 1.0
 * @see
 *
 * <pre>
 * 공통
 *
 *  수정일      수정자      수정내용
 *  -------            --------        ---------------------------
 *  2023.05.18  김호       최초 생성
 *
 *  </pre>
 */
@Getter
@Setter
public class ComVO extends ComPageVO {

	private String delYn;
	private String sysFrstInptDt;		// 최초생성시간
	private String sysFrstInptUserId;	// 최초생성사용자ID
	private String sysFrstInptPrgrmId;	// 최초생성프로그램ID
	private String sysLastChgDt;		// 최종변경시간
	private String sysLastChgUserId ;	// 최종변경사용자ID
	private String sysLastChgPrgrmId;	// 최종변경프로그램ID
	
}
