package com.at.apcss.am.bss.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : ApcVO.java
 * @Description : APC 정보관리 대한 VO 클래스
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
public class ApcVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * 원본APC명
	 */
	private String orgnlApcNm;
	/**
	 * 시도명
	 */
	private String ctpv;
	/**
	 * 시군명
	 */
	private String sigun;
	/**
	 * 주체명
	 */
	private String mbNm;
	/**
	 * 원본주소
	 */
	private String orgnlAddr;
	/**
	 * 원본전화번호
	 */
	private String orgnlTelno;
	/**
	 * APC명
	 */
	private String apcNm;
	/**
	 * APC사업자등록번호
	 */
	private String apcBrno;
	/**
	 * 주소
	 */
	private String addr;
	/**
	 * 전화번호
	 */
	private String telno;
	/**
	 * FAX번호
	 */
	private String fxno;
	/**
	 * 은행코드
	 */
	private String bankCd;
	/**
	 * 계좌번호
	 */
	private String actno;
	/**
	 * 예금주명
	 */
	private String dpstrNm;
}
