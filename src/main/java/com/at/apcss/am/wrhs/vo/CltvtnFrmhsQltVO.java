package com.at.apcss.am.wrhs.vo;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;
/**
 * @Class Name : CltvtnListVO.java
 * @Description : 재배이력에 대한 VO 클래스
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
public class CltvtnFrmhsQltVO extends ComVO {
	/*
	 * 생산자코드
	 * */
	private String prdcrCd;
	private String prdcrNm;
	/*
	 * APC코드
	 * */
	private String apcCd;
	/*
	 * 품목코드
	 * */
	private String itemCd;
	private String itemNm;
	/*
	 * 생산자지역
	 * */
	private String frmhsCtpv;
	private String frmhsCtpvNm;
	/*
	 * 생산자주소
	 * */
	private String frmhsAddr;
	/*
	 * 생산자전화번호
	 * */
	private String frmhsTelno;
	/*
	 * 재배농가품질NO
	 * */
	private String cltvtnFrmhsQltNo;
	/*
	 * 종자1수량
	 * */
	private int sdQntt1;
	/*
	 * 종자2수량
	 * */
	private int sdQntt2;
	/*
	 * 종자3수량
	 * */
	private int sdQntt3;
	/*
	 * 종자4수량
	 * */
	private int sdQntt4;
	/*
	 * 종자5수량
	 * */
	private int sdQntt5;
	/*
	 * 계약필지
	 * */
	private int ctrtPrcl;
	/*
	 * 정식필지
	 * */
	private int plntngPrcl;
	/*
	 * 파종일자
	 * */
	private String sdngYmd;
	/*
	 * 파종상태
	 * */
	private String sdngSttsCd;
	private String sdngSttsNm;
	/*
	 * 정식일자
	 * */
	private String plntngYmd;
	/*
	 * 정식상태
	 * */
	private String plntngSttsCd;
	private String plntngSttsNm;
	/*
	 * 추비1차일자
	 * */
	private String cmptYmdCycl1;
	/*
	 * 추비2차일자
	 * */
	private String cmptYmdCycl2;
	/*
	 * 예상망
	 * */
	private int expctQntt;
	/*
	 * 품질평가
	 * */
	private String qltEvl;
	/*
	 * 작년평균망
	 * */
	private double lastYrEvl;
	/*
	 * 올해평균망
	 * */
	private double tyEvl;
	/*
	 * 변동갭
	 * */
	private int flctnDfrnc;
	/*
	 * 무선별
	 * */
	private String emptSort;
	/*
	 * 망사구분코드
	 * */
	private String meshSeCd;
	private String meshSeNm;
	/*
	 * 단기
	 * */
	private int strm;
	/*
	 * 중기
	 * */
	private int tmidlTerm;
	/*
	 * 장기
	 * */
	private int ltrm;
	/*
	 * 차이
	 * */
	private int dfrnc;
	/*
	 * 토양
	 * */
	private String soil;
	/*
	 * 퇴비
	 * */
	private String cmpt;
	/*
	 * 기타
	 * */
	private String etc;
	/*
	 * 병충해코드1
	 * */
	private String pestCd1;
	/*
	 * 병충해코드2
	 * */
	private String pestCd2;
	/*
	 * 병충해코드3
	 * */
	private String pestCd3;
	/*
	 * 병충해여부1
	 * */
	private String pestYn1;
	/*
	 * 병충해여부2
	 * */
	private String pestYn2;
	/*
	 * 병충해여부3
	 * */
	private String pestYn3;
	/*
	 * 담당자
	 * */
	private String pic;
	/*
	 * 생육특이사항
	 * */
	private String grdpExcptnMttr;
	/*
	 * 저장특이사항
	 * */
	private String strgExcptnMttr;
	/*
	 * 연도
	 * */
	private String yr;
	/*
	 * 비고
	 * */
	private String rmrk;
	/*
	 * 부패율
	 * */
	private double strgRslt;
	/*
	 * 수매량
	 * */
	private int prchsQntt;
	/*
	 * 수매금액
	 * */
	private int prchsAmt;



}
