package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : BffaSortVO.java
 * @Description : 상품정보에 대한 VO 클래스
 * @author 박승진
 * @since 2024.04.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.04.23  박승진        최초 생성
 * </pre>
 */
@Getter
@Setter
public class BffaSortVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	
	
	/**
	 * 등급종류코드
	 */
	private String grdKnd;

	/**
	 * 등급종류명
	 */
	private String grdKndNm;
	
	private String grdCd;
	private String grdVl;
	private String grdNm;
	/**
	 * 품목코드
	 */
	private String itemCd;
	
	/**
	 * 육안등급유형
	 */
	private String bffaGrdType;
	
	/**
	 * 순번
	 */
	private String sn;
	/**
	 * 비고
	 */
	private String rmrk;
	/**
	 * 삭제여부
	 */
	private String delYn;
	
	private String cdId;
	private String cdVl; 
	private String cdVlNm;
	
	private String status;
	private String type;
	
	


}
