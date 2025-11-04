package com.at.apcss.am.clcln.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : ClclnWkrptVO.java
 * @Description : 주간입출고현황에 대한 VO 클래스
 * @author 김호
 * @since 2024.11.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.11.12  김호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class ClclnWkrptVO extends ComVO {

	/*
	 * APC코드
	 * */
	private String apcCd;
	/*
	 * 입고출고유형
	 * */
	private String wrhsSpmtType;
	private String wrhsSpmtTypeNm;
	/*
	 * 계량일자
	 * */
	private String wghYmd;
	private String wghYmdFrom;
	private String wghYmdTo;
	/*
	 * 수량(월~일)
	 * */
	private int bxQnttMon;
	private int bxQnttTue;
	private int bxQnttWed;
	private int bxQnttThu;
	private int bxQnttFri;
	private int bxQnttSat;
	private int bxQnttSun;

	private int bxQntt;
	private int bxWght;
	/*
	 * 거래처(월~일)
	 * */
	private String prdcrNmMon;
	private String prdcrNmTue;
	private String prdcrNmWed;
	private String prdcrNmThu;
	private String prdcrNmFri;
	private String prdcrNmSat;
	private String prdcrNmSun;

	private String prdcrNm;

	private String dy;

	/*
	 * 입고토탈수
	 * */
	private int totWrhsQntt;
	/*
	 * 출고토탈수
	 * */
	private int totSpmtQntt;
	/*
	 * 현재재고수
	 * */
	private int totInvntrQntt;
}
