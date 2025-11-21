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
	private String prdcrCd;

	private String cnptCd;
	private String cnptNm;

	private String dy;

	/**
	 * 계량번호
	 */
	private String wghno;

	/**
	 * 계량순번
	 */
	private int wghSn;

	/**
	 * 입고번호
	 */
	private String wrhsno;

	/**
	 * 차량번호
	 */
	private String vhclno;

	/**
	 * 품목코드
	 */
	private String itemCd;
	/**
	 * 품목명
	 */
	private String itemNm;
	/**
	 * 품종코드
	 */
	private String vrtyCd;
	/**
	 * 품종명
	 */
	private String vrtyNm;

	/**
	 * 전체중량
	 */
	private double wholWght;

	/**
	 * 공차중량
	 */
	private double emptVhclWght;

	/**
	 * 실중량
	 */
	private double actlWght;

	/**
	 * 감량율
	 */
	private double rdcdRt;

	/**
	 * 감량
	 */
	private double rdcdWght;

	/**
	 * 입고중량
	 */
	private double wrhsWght;
	private double dtlWrhsWght;

	/**
	 * 인수량
	 */
	private int acptnWght;

	/**
	 * 팔레트종류
	 */
	private String pltKnd;
	/**
	 * 팔레트번호
	 */
	private String pltno;

	/**
	 * 박스종류
	 */
	private String bxKnd;

	/**
	 * 팔레트중량
	 */
	private String pltWght;

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
