package com.at.apcss.am.wrhs.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
/**
 * @Class Name : CltvtnBscInfoVO.java
 * @Description : 재배기본정보에 대한 VO 클래스
 * @author 김  호
 * @since 2024.06.25
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.06.25  김  호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class CltvtnBscInfoVO extends ComVO {

	/*
	 * APC코드
	 * */
	private String apcCd;
	/*
	 * 생산자코드
	 * */
	private String prdcrCd;
	/*
	 * 재배기본NO
	 * */
	private String cltvtnBscInfoNo;
	/*
	 * 종자코드1
	 * */
	private String sdCd1;
	/*
	 * 종자코드2
	 * */
	private String sdCd2;
	/*
	 * 종자코드3
	 * */
	private String sdCd3;
	/*
	 * 종자코드4
	 * */
	private String sdCd4;
	/*
	 * 종자코드5
	 * */
	private String sdCd5;
	/*
	 * 종자수량1
	 * */
	private int sdQntt1;
	/*
	 * 종자수량2
	 * */
	private int sdQntt2;
	/*
	 * 종자수량3
	 * */
	private int sdQntt3;
	/*
	 * 종자수량4
	 * */
	private int sdQntt4;
	/*
	 * 종자수량5
	 * */
	private int sdQntt5;
	/*
	 * 밑비료
	 * */
	private String lwptFrtlzr;
	/*
	 * 파종일자
	 * */
	private String sdngYmd;
	/*
	 * 정식일자
	 * */
	private String clclnYmd;
	/*
	 * 추비일자1차
	 * */
	private String cmptYmdCycl1;
	/*
	 * 추비일자2차
	 * */
	private String cmptYmdCycl2;
	/*
	 * 저장결과(부패율)
	 * */
	private double strgRslt;
	/*
	 * 비고
	 * */
	private String rmrk;

}
