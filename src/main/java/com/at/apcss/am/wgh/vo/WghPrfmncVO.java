package com.at.apcss.am.wgh.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.am.invntr.vo.RawMtrStdGrdVO;
import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : WghPrfmncVO.java
 * @Description : 계량실적에 대한 VO 클래스
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
public class WghPrfmncVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;
	/**
	 * APC코드명
	 */
	private String apcNm;

	/**
	 * 계량번호
	 */
	private String wghno;

	/**
	 * 계량순번
	 */
	private int wghSn;

	/**
	 * 계량일자
	 */
	private String wghYmd;
	private String wghYmdFrom;
	private String wghYmdTo;

	/**
	 * 입고번호
	 */
	private String wrhsno;

	/**
	 * 생산자코드
	 */
	private String prdcrCd;

	/**
	 * 생산자명
	 */
	private String prdcrNm;

	/**
	 * 생산자인식번호
	 */
	private String prdcrIdentno;

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
	 * 상품구분코드
	 */
	private String gdsSeCd;
	/**
	 * 상품구분명
	 */
	private String gdsSeNm;

	/**
	 * 등급
	 */
	private String grdCd;

	/**
	 * 등급명
	 */
	private String grdNm;

	/**
	 * 입고구분코드
	 */
	private String wrhsSeCd;
	/**
	 * 입고구분명
	 */
	private String wrhsSeNm;

	/**
	 * 운송구분코드
	 */
	private String trsprtSeCd;
	/**
	 * 운송구분명
	 */
	private String trsprtSeNm;

	/**
	 * 차량번호
	 */
	private String vhclno;

	/**
	 * 기사명
	 */
	private String drvrNm;

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

	/**
	 * 재고중량
	 */
	private double invntrWght;
	/**
	 * 비고
	 */
	private String rmrk;

	/**
	 * 계량순번
	 */
	private int wghSeqNo;

	/**
	 * 팔레트박스구분코드
	 */
	private String pltBxSeCd;

	/**
	 * 팔레트종류
	 */
	private String pltKnd;

	/**
	 * 박스종류
	 */
	private String bxKnd;

	/**
	 * 단중
	 */
	private double unitWght;

	/**
	 * 수량
	 */
	private int qntt;

	/**
	 * 중량
	 */
	private double wght;

	/**
	 * 팔레트중량
	 */
	private String pltWght;
	/**
	 * 박스중량
	 */
	private String bxWght;
	/**
	 * 창고구분
	 */
	private String warehouseSeCd;
	/**
	 * 창고구분
	 */
	private String warehouseSeNm;

	/**
	 * 생산연도
	 */
	private String prdctnYr;

	/*
	 * 저장위치
	 * */
	private String strgLoctnCd;
	private String strgLoctnRow;
	private String strgLoctnCol;
	private String strgLoctnLvl;

	/*
	 * 인수량
	 * */
	private int acptnWght;

	/*
	 * 설비
	 * */
	private String fcltCd;
	/*
	 * 입고출고유형
	 * */
	private String wrhsSpmtType;

	/*
	 * 등급's
	 * */
	private String grdCd1;
	private String grdCd2;
	private String grdCd3;
	private String grdCd4;

	/*
	 * 등급별수량
	 * */
	private int grdQntt1;
	private int grdQntt2;
	private int grdQntt3;
	private int grdQntt4;

	/*
	 * 등급별입고번호
	 * */
	private String grdWrhsno1;
	private String grdWrhsno2;
	private String grdWrhsno3;
	private String grdWrhsno4;
	/*
	 * 등급별입고순번
	 * */
	private String grdWghSn1;
	private String grdWghSn2;
	private String grdWghSn3;
	private String grdWghSn4;
	/*
	 * 팔레트수량
	 * */
	private int pltQntt;
	/*
	 * 입고수량
	 * */
	private int bxQntt;

	/*
	 * 그룹번호
	 * */
	private int groupId;
	/**
	 * 계량상세리스트
	 */
	List<WghPrfmncDtlVO> wghPrfmncDtlList;

	public List<WghPrfmncDtlVO> getWghPrfmncDtlList() {
		return this.wghPrfmncDtlList == null ? null : wghPrfmncDtlList.stream().collect(Collectors.toList());
	}

	public void setWghPrfmncDtlList(List<WghPrfmncDtlVO> wghPrfmncDtlList) {
		this.wghPrfmncDtlList = wghPrfmncDtlList == null ? null : wghPrfmncDtlList.stream().collect(Collectors.toList());
	}


	/**
	 * 표준등급
	 */
	private String stdGrd;
	private String stdGrdCd;

	/**
	 * 표준등급 목록
	 */
	private List<RawMtrStdGrdVO> stdGrdList;

	public List<RawMtrStdGrdVO> getStdGrdList() {
		return stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}

	public void setStdGrdList(List<RawMtrStdGrdVO> stdGrdList) {
		this.stdGrdList = stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}

}
