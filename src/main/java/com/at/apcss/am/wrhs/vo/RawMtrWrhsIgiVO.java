package com.at.apcss.am.wrhs.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @Class Name : WrhsMngVO.java
 * @Description : 입고에 대한 VO 클래스
 * @author 김호
 * @since 2025.07.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.07.10  김호        최초 생성
 * </pre>
 */
@Getter
@Setter
public class RawMtrWrhsIgiVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	private String apcNm;

	/**
	 * 품종
	 * */
	private String vrtyCd;
	private String vrtyNm;

	/**
	 * 품목
	 * */
	private String itemCd;
	private String itemNm;

	/**
	 * 검수일자
	 */
	private String igiYmd;
	private String igiYmdFrom;
	private String igiYmdTo;
	/**
	* 검수 연도
	* */
	private String igiYr;

	/**
	 * 검수순번
	 */
	private String igiSeq;
	/**
	 * 생산자코드
	 */
	private String prdcrCd;
	private String prdcrNm;
	/**
	 * 지역
	 */
	private String frmhsNm;
	/**
	 * 검수판정코드
	 */
	private String igiJgmtCd;
	private String igiJgmtNm;
	/**
	 * 샘플여부
	 */
	private String smplYn;
	/**
	 * 감량항목코드
	 */
	private String rwArtclCd;
	private String rwArtclNm;
	/**
	 * 감량비율
	 */
	private int rwRt;
	/**
	 * 단위
	 */
	private String wrhsUnitCd;
	/**
	 * 회송수량
	 */
	private int sndbkQntt;
	/**
	 * 검수비고
	 */
	private String igiRmrk;
	/**
	 * 수량비고
	 */
	private String qnttRmrk;
	/**
	 * 비율비고
	 */
	private String rtRmrk;
	/**
	 * 저장위치코드
	 */
	private String strgLoctnCd;
	private String strgLoctnNm;
	/**
	 * 검수 총 수량
	 */
	private int igiGrdQnttTot;
	/**
	 * 검수등급별 수량
	 */
	private int igiGrdQntt1;
	private int igiGrdQntt2;
	private int igiGrdQntt3;
	private int igiGrdQntt4;
	private int igiGrdQntt5;
	/**
	 * 검수등급별 수량
	 */
	private int igiGrdCd1;
	private int igiGrdCd2;
	private int igiGrdCd3;
	private int igiGrdCd4;
	private int igiGrdCd5;
	/**
	 * 검수등급별 비율
	 */
	private int igiGrdRt1;
	private int igiGrdRt2;
	private int igiGrdRt3;
	private int igiGrdRt4;
	private int igiGrdRt5;

	/**
	* 검수등급별 누계량
	* */
	private int strgLoctnQntt1;
	private int strgLoctnQntt2;
	private int strgLoctnQntt3;
	private int strgLoctnQntt4;
	private int strgLoctnQntt5;
	private int strgLoctnQnttTot;

	/**
	 * 원물입고량
	 * */
	private int grdWght1;
	private int grdWght2;
	private int grdWght3;
	private int grdWght4;
	private int grdWght5;
	private int grdWghtTot;

	/**
	* 수매량
	* */
	private int expctQnttTot;
	/**
	 * 금일수량
	 * */
	private int todayGrdQnttTot;
	/**
	 * 전일수량
	 * */
	private int yesterdayGrdQnttTot;


	/**
	* 종자
	* */
	private String sd1;
	private String sd2;
	private String sd3;
	private String sd4;
	private String sd5;

	/**
	* 평가등급
	* */
	private String cltEvl;

	/**
	 * 전화번호
	 * */
	private String telno;
	/**
	 * 계약면적
	 * */
	private int plntngPrcl;
	/**
	 * 예상수매
	 * */
	private int expctQntt;
	/**
	* 상황판 여부
	* */
	private String prchsSttnYn;

	/**
	* 지역
	* */
	private String frmhsCtpv;

	/**
	 * 품질정보
	 * */
	private String qltEvlCd;
	private String qltEvlNm;

	/*
	 * 농가예상입고상세
	 * */
	private List<RawMtrWrhsIgiDtlVO> rawMtrWrhsIgiDtlList;


	public List<RawMtrWrhsIgiDtlVO> getRawMtrWrhsIgiDtlList() {
		return this.rawMtrWrhsIgiDtlList == null ? null : rawMtrWrhsIgiDtlList.stream().collect(Collectors.toList());
	}

	public void setRawMtrWrhsIgiDtlList(List<RawMtrWrhsIgiDtlVO> rawMtrWrhsIgiDtlList) {
		this.rawMtrWrhsIgiDtlList = rawMtrWrhsIgiDtlList == null ? null : rawMtrWrhsIgiDtlList.stream().collect(Collectors.toList());
	}
}
