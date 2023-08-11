package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : RawMtrTrsprtCstVO.java
 * @Description : 원물운임비용등록 정보에 대한 VO 클래스
 * @author 하민우
 * @since 2023.08.04
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.04  하민우        최초 생성
 * </pre>
 */
@Getter
@Setter
public class RawMtrTrsprtCstVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * 생산자명
	 */
	private String prdcrNm;
	/**
	 * 생산자코드
	 */
	private String prdcrCd;
	/**
	 * 운송일자
	 */
	private String trsprtYmd;
	/**
	 * 운송구분코드
	 */
	private String trsprtSeCd;
	/**
	 * 차량번호
	 */
	private String vhclno;
	/**
	 * 순번
	 */
	private int sn;
	/**
	 * 기사명
	 */
	private String drvrNm;
	/**
	 * 운송지역코드
	 */
	private String trsprtRgnCd;
	/**
	 * 입고중량
	 */
	private int wrhsWght;
	/**
	 * 운임비용
	 */
	private int trsprtCst;
	/**
	 * 은행코드
	 */
	private String bankCd;
	/**
	 * 은행명
	 */
	private String bankNm;
	/**
	 * 계좌번호
	 */
	private String actno;
	/**
	 * 예금주명
	 */
	private String dpstr;
	/**
	 * 비고
	 */
	private String rmrk;
}
