package com.at.apcss.co.sys.vo;

import lombok.Data;
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
@Data
public class ComVO {

	private String sysFrstInptDt;
	private String sysFrstInptUserId;
	private String sysFrstInptPrgrmId;
	private String sysLastChgDt;
	private String sysLastChgUserId ;
	private String sysLastChgPrgrmId;

}
