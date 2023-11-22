package com.at.apcss.am.invntr.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : RawMtrInvntrVO.java
 * @Description : 원물재고정보에 대한 VO 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class RawMtrInvntrVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 입고번호
	 */
	private String wrhsno;

	/**
	 * 처리번호
	 */
	private String prcsno;
	
	/**
	 * 처리유형
	 */
	private String prcsType;
	
	/**
	 * 팔레트번호
	 */
	private String pltno;

	/**
	 * 입고일자
	 */
	private String wrhsYmd;
	private String wrhsYmdFrom;
	private String wrhsYmdTo;

	/**
	 * 생산자코드
	 */
	private String prdcrCd;

	/**
	 * 생산자명
	 */
	private String prdcrNm;

	/**
	 * 품목코드
	 */
	private String itemCd;

	/**
	 * 품종코드
	 */
	private String vrtyCd;
	/**
	 * 등급코드
	 */
	private String grdCd;
	/**
	 * 상품구분코드
	 */
	private String gdsSeCd;

	/**
	 * 입고구분코드
	 */
	private String wrhsSeCd;

	/**
	 * 운송구분코드
	 */
	private String trsptSeCd;

	/**
	 * 창고구분코드
	 */
	private String warehouseSeCd;

	/**
	 * 박스종류
	 */
	private String bxKnd;

	/**
	 * 입고수량
	 */
	private int wrhsQntt;

	/**
	 * 입고중량
	 */
	private double wrhsWght;

	/**
	 * 투입수량
	 */
	private int inptQntt;

	/**
	 * 투입중량
	 */
	private double inptWght;

	/**
	 * 투입일자
	 */
	private String inptYmd;

	/**
	 * 수량 - 계산용 temp
	 */
	private int qntt;

	/**
	 * 중량 - 계산용 temp
	 */
	private double wght;

	/**
	 * 선별수량
	 */
	private int sortQntt;

	/**
	 * 선별중량
	 */
	private double sortWght;

	/**
	 * 처리수량
	 */
	private int prcsQntt;
	
	/**
	 * 처리중량
	 */
	private double prcsWght;

	/**
	 * 재고수량
	 */
	private int invntrQntt;

	/**
	 * 재고중량
	 */
	private double invntrWght;
	
	
	/**
	 * 잔여 수량
	 */
	private int rmnQntt;
	/**
	 * 잔여 중량
	 */
	private double rmnWght;
	
	
	/**
	 * 운송구분
	 */
	private String trsprtSeCd;

	/**
	 * apc명
	 */
	private String apcNm;

	/**
	 * 품목명
	 */
	private String itemNm;

	/**
	 * 품종명
	 */
	private String vrtyNm;

	/**
	 * 상품구분명
	 */
	private String gdsSeNm;

	/**
	 * 입고구분명
	 */
	private String wrhsSeNm;

	/**
	 * 창고구분명
	 */
	private String warehouseSeNm;
	/**
	 * 운송구분명
	 */
	private String trsprtSeNm;

	/**
	 * 박스종류명
	 */
	private String bxKndNm;

	/**
	 * 등급명
	 */
	private String grdNm;
	
	/**
	 * 표준등급명
	 */
	private String stdGrdNm;

	/**
	 * 선별지시번호
	 */
	private String sortCmndno;

	/**
	 * 지시수량
	 */
	private int cmndQntt;

	/**
	 * 지시중량
	 */
	private double cmndWght;

	/**
	 * 지시제외재고수량
	 */
	private int invntrCmndQntt;

	/**
	 * 지시재외재고중량
	 */
	private double invntrCmndWght;

	/**
	 * 이송수량
	 */
	private int trnsfQntt;

	/**
	 * 이송중량
	 */
	private double trnsfWght;

	/**
	 * 투입진행수량
	 */
	private int inptPrgrsQntt;
	/**
	 * 투입진행중량
	 */
	private double inptPrgrsWght;
	
	
	/**
	 * 설비코드
	 */
	private String fcltCd;

	/**
	 * 설비명
	 */
	private String fcltNm;

	/**
	 * 생산연도
	 */
	private String prdctnYr;

	/**
	 * 기준일자
	 */
	private String crtrYmd;

	/**
	 * 재고구분
	 */
	private String invntrySe;

	/**
	 * 규격
	 */
	private String spcfctCd;

	/**
	 * 생산자구분
	 */
	private String prdcr;

	/**
	 * 상품구분
	 */
	private String gdsSe;

	/**
	 * 입고구분
	 */
	private String wrhsSe;
	/*사용구분*/
	private String delYn;
	/*비고*/
	private String rmrk;

	/**
	 * 표준등급
	 */
	private String stdGrd;

	private String stdGrdCd;

	/**
	 * 투입순번
	 */
	private int inptSn;
	
	
	/**
	 * 변경이력
	 */
	private String chgYmd;
	private String chgYmdFrom;
	private String chgYmdTo;
	private int chgSn;
	private int chgBfrQntt;
	private double chgBfrWght;
	private int chgAftrQntt;
	private double chgAftrWght;
	private String chgRsnCd;
	private String chgRsnNm;
	private String chgRmrk;
	
	/**
	 * 제외 입고번호 목록
	 */
	private List<String> excldWrhsnoList;
	
	public List<String> getExcldWrhsnoList() {
		return excldWrhsnoList == null ? null : excldWrhsnoList.stream().collect(Collectors.toList());
	}

	public void setExcldWrhsnoList(List<String> excldWrhsnoList) {
		this.excldWrhsnoList = stdGrdList == null ? null : excldWrhsnoList.stream().collect(Collectors.toList());
	}
	
	/**
	 * 표준등급
	 */
	private List<RawMtrStdGrdVO> stdGrdList;

	public List<RawMtrStdGrdVO> getStdGrdList() {
		return stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}

	public void setStdGrdList(List<RawMtrStdGrdVO> stdGrdList) {
		this.stdGrdList = stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}
}
