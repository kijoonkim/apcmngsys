package com.at.apcss.co.log.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

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
@ToString
public class ComLogVO extends ComVO {

	/**
	 * LOG일자
	 */
	private String logYmd;
	/**
	 * LOG시작일자
	 */
	private String logYmdFrom;
	/**
	 * LOG종료일자
	 */
	private String logYmdTo;
	/**
	 * LOG순번
	 */
	private String logSn;
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
	 * 사용자IP
	 */
	private String userIp;
	/**
	 * IP주소
	 */
	private String ipAddr;
	/**
	 * 처리일시
	 */
	private String prcsDt;
	/**
	 * 비고
	 */
	private String rmrk;
	/**
	 * 이력순번
	 */
	private String hstrySn;
	/**
	 * 메뉴ID
	 */
	private String menuId;
	/**
	 * 메뉴명
	 */
	private String menuNm;
	/**
	 * 사용자ID
	 */
	private String userId;
	/**
	 * 사용자명
	 */
	private String userNm;
	/**
	 * 사용자유형
	 */
	private String userType;
	/**
	 * 열람유형
	 */
	private String prslType;
	/**
	 * 열람유형
	 */
	private String prslTypeNm;
	/**
	 * 열람일시
	 */
	private String prslDt;
	/**
	 * 최초열람일시
	 */
	private String frstPrslDt;
	/**
	 * 로그인성공여부
	 */
	private String lgnScsYn;
	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * APC명
	 */
	private String apcNm;
	/**
	 * 수행업무구분코드
	 */
	private String flfmtTaskSeCd;
}
