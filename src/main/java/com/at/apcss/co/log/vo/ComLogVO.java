package com.at.apcss.co.log.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : ComLogVO.java
 * @Description : LOG정보에 대한 VO 클래스
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
public class ComLogVO extends ComVO {
	
	/**
	 * LOG일자
	 */
	private String logYmd;
	/**
	 * LOG순번
	 */
	private String logSeqNo;
	/**
	 * LOG구분코드
	 */
	private String logSeCd;
	/**
	 * 송수신구분코드
	 */
	private String sendRcptnSeCd;
	/**
	 * 프로그램ID
	 */
	private String prgrmId;
	/**
	 * 프로그램명
	 */
	private String prgrmNm;
	/**
	 * IP주소
	 */
	private String ipAddr;
	/**
	 * 처리일시
	 */
	private String prcsYmd;
	/**
	 * 비고
	 */
	private String rmrk;
}
