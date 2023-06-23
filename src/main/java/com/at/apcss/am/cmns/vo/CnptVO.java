package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : CnptVO.java
 * @Description : 거래처정보에 대한 VO 클래스
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
public class CnptVO extends ComVO {
	
	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * 거래처코드
	 */
	private String cnptCd;
	/**
	 * 거래처명
	 */
	private String cnptNm;
	/**
	 * 거래처유형
	 */
	private String cnptType;
	/**
	 * 사업자등록번호
	 */
	private String brno;
	/**
	 * 담당자명
	 */
	private String picNm;
	/**
	 * 전화번호
	 */
	private String telno;
	/**
	 * 비고
	 */
	private String rmrk;
}
