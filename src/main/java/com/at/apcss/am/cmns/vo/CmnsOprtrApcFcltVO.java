package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : CmnsOprtrApcFcltVO.java
 * @Description : APC가동시설정보에 대한 VO 클래스
 * @author 박승진
 * @since 2024.07.16
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.16  박승진        최초 생성
 * </pre>
 */
@Getter
@Setter
public class CmnsOprtrApcFcltVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * 시설유형
	 */
	private String fcltType;
	/**
	 * 시설코드
	 */
	private String fcltCd;

	/**
	 * 시설명
	 */
	private String fcltNm;
	/**
	 * 시설설명
	 */
	private String fcltExpln;
	/**
	 * 가동시간
	 */
	private double oprtncHr;
	/**
	 * 비가동시간
	 */
	private double nOprtngHr;

	/**
	 * 시간단위
	 */
	private String hrUnit;
	/**
	 * 시설용량
	 */
	private double fcltCpct;

	/**
	 * 용량단위
	 */
	private String cpctUnit;
	/**
	 * 시작일자
	 */
	private String bgngYmd;
	/**
	 * 종료일자
	 */
	private String endYmd;
	/**
	 * 시설비고
	 */
	private String fcltRmrk;

	/**
	 *  연계코드
	 */
	private String lnkgCd;


}
