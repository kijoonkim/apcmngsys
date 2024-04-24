package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
/**
 * @Class Name : SpmtPckgUnitVO.java
 * @Description : 출하포장단위 정보에 대한 VO 클래스
 * @author 김호
 * @since 2023.07.31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.31  김호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class SpmtPckgUnitVO extends ComVO{
	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * 출하포장단위코드
	 */
	private String spmtPckgUnitCd;
	/**
	 * 출하포장단위명
	 */
	private String spmtPckgUnitNm;
	/**
	 * 품목코드
	 */
	private String itemCd;
	/**
	 * 품종코드
	 */
	private String vrtyCd;
	
	private String itemVrtyCd;
	
	/**
	 * 규격코드
	 */
	private String spcfctCd;
	
	private String itemSpcfctCd;
	/**
	 * 품목명
	 */
	private String itemNm;
	/**
	 * 품종명
	 */
	private String vrtyNm;
	/**
	 * 규격명
	 */
	private String spcfctNm;
	/**
	 * 규격중량
	 */
	private double spcfctWght;
	/**
	 * 판매단가
	 */
	private int ntslUntprc;
	/**
	 * 규격 입수
	 */
	private int bxGdsQntt;
	/**
	 * 등급
	 */
	private String gdsGrd;
	/**
	 * 등급명
	 */
	private String gdsGrdNm;
	/**
	 * 브랜드명
	 */
	private String brndNm;

	/**
	 * 등록 수
	 */
	private int cnt;
	/**
	 * 삭제 불가능 사유
	 */
	private String delible;
	/**
	 * 상품 연계코드
	 */
	private String extrnlLnkgCd;
	/**
	 * 원산지 코드
	 */
	private String plorCd;

}