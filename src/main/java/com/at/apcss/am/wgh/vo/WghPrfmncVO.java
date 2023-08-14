package com.at.apcss.am.wgh.vo;

import java.util.List;
import java.util.stream.Collectors;

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
	 * 계량일자
	 */
	private String wghYmd;
	private String wghYmdFrom;
	private String wghYmdTo;

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
	 * 계량상세리스트
	 */
	List<WghPrfmncDtlVO> wghPrfmncDtlList;

	public List<WghPrfmncDtlVO> getWghPrfmncDtlList() {
		return this.wghPrfmncDtlList == null ? null : wghPrfmncDtlList.stream().collect(Collectors.toList());
	}

	public void setWghPrfmncDtlList(List<WghPrfmncDtlVO> wghPrfmncDtlList) {
		this.wghPrfmncDtlList = wghPrfmncDtlList == null ? null : wghPrfmncDtlList.stream().collect(Collectors.toList());
	}
}
