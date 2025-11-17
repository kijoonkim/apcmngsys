package com.at.apcss.am.spmt.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * @Class Name : SpmtPrfmncSlsVO.java
 * @Description : 출고실적매출에 대한 VO 클래스
 * @author 김호
 * @since 2025.11.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.11.11  김호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class SpmtPrfmncSlsVO extends SpmtPrfmncVO {

	/**
	 * 표시순서
	 * */
	private int indctSeq;
	/**
	 * 지급금액
	 * */
	private double payAmt;
	private double totPayAmt;
	/**
	 * 수입금액
	 * */
	private double incmAmt;
	private double totIncmAmt;
	/**
	 * 법인수수료(조합법인)
	 * */
	private double totFeeAmt;
	/**
	 * 출고수수료금액
	 * */
	private double spmtFeeAmt;
	private double totSpmtFeeAmt;
	/**
	 * 출고금액
	 * */
	private double spmtAmt;
	private double totSpmtAmt;
	/**
	 * 농협수수료금액
	 * */
	private double nhFeeAmt;
	private double totNhFeeAmt;

	/**
	 * 포장금액
	 * */
	private double pckgAmt;
	private double totPckgAmt;
	/**
	 * 박스금액
	 * */
	private double bxAmt;
	private double totBxAmt;
	/**
	 * 수량
	 * */
	private double qntt;
	private double totQntt;
	/**
	 * 중량
	 * */
	private double totWght;
	private double wght;
	/**
	 * 단가
	 * */
	private double untprc;
	/**
	 * 매입처코드
	 * */
	private String prchsptCd;
	private String prchsptNm;

	private int crtrUntprcCd1;
	private int crtrUntprcCd2;
	private int crtrUntprcCd3;
	private int crtrUntprcCd4;
	/**
	 * 생산지
	 * */
	private String frmhsCtpv;
}
