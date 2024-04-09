package com.at.apcss.am.sort.vo;

import java.util.List;
import java.util.stream.Collectors;

import com.at.apcss.am.invntr.vo.GdsStdGrdVO;
import com.at.apcss.am.invntr.vo.SortStdGrdVO;
import com.at.apcss.co.sys.vo.ComVO;

import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SortPrfmncVO.java
 * @Description : 선별실적정보에 대한 VO 클래스
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
public class SortPrfmncVO extends ComVO {

	/**
	 * APC코드
	 */
	private String apcCd;

	/**
	 * 선별번호
	 */
	private String sortno;

	/**
	 * 선별순번
	 */
	private int sortSn;

	/**
	 * 등급코드
	 */
	private String grdCd;
	private String grdCd1;
	private String grdCd2;
	private String grdCd3;
	private String grdCd4;
	private String grdCd5;
	private String grdCd6;
	private String grdCd7;
	private String grdCd8;
	private String grdCd9;
	private String grdCd10;
	private String grdCd11;

	/**
	 * 등급명
	 */
	private String grdNm;
	private String grdNm1;
	private String grdNm2;
	private String grdNm3;
	private String grdNm4;
	private String grdNm5;
	private String grdNm6;
	private String grdNm7;
	private String grdNm8;
	private String grdNm9;
	private String grdNm10;
	private String grdNm11;

	/**
	 * 투입일자
	 */
	private String inptYmd;
	private String inptYmdFrom;
	private String inptYmdTo;

	/**
	 * 투입순번
	 */
	private int inptSn;


	/**
	 * 설비코드
	 */
	private String fcltCd;

	/**
	 * 대표생산자코드
	 */
	private String rprsPrdcrCd;
	private String rprsPrdcrNm;

	/**
	 * 품목코드
	 */
	private String itemCd;

	/**
	 * 품종코드
	 */
	private String vrtyCd;

	/**
	 * 선별입력값유형
	 */
	private String sortInptVlType;
	
	/**
	 * 규격코드
	 */
	private String spcfctCd;

	private String spcfctNm;

	/**
	 * 창고구분코드
	 */
	private String warehouseSeCd;
	private String warehouseSeNm;

	private String warehouseSeCdFrom;

	/**
	 * 수량
	 */
	private int qntt;

	/**
	 * 중량
	 */
	private double wght;

	/**
	 * 잔여수량
	 */
	private int rmnQntt;

	/**
	 * 잔여중량
	 */
	private double rmnWght;

	/**
	 * 선별지시번호
	 */
	private String sortCmndno;

	/**
	 * 비고
	 */
	private String rmrk;

	/**
	 * 입고번호
	 */
	private String wrhsno;

	/**
	 * 생산자코드
	 */
	private String prdcrCd;
	private String prdcrNm;

	/**
	 * 상품구분
	 */
	private String gdsSeCd;
	private String gdsSeNm;

	/**
	 * 입고구분
	 */
	private String wrhsSeCd;
	private String wrhsSeNm;

	/**
	 * 선별투입실적 변경 필요 여부
	 */
	private String needsInptChgYn;

	/**
	 * APC명
	 */
	private String apcNm;

	/**
	 * 선별기명
	 */
	private String fcltNm;
	/**
	 * 투입지시번호
	 */
	private String inptCmndNo;
	/**
	 * 입고일자
	 */
	private String wrhsYmd;
	/**
	 * 투입중량
	 */
	private String inptSortWght;
	/**
	 * 품종명
	 */
	private String itemNm;
	/**
	 * 품목명
	 */
	private String vrtyNm;
	/**
	 * 원물창고
	 */
	private String rawMtrWarehouse;

	private String startsortYmd;
	private String endSortYmd;
	private String strgWarehouse;

	/**
	 * 생산연도
	 */
	private String prdctnYr;


	/**
	 * 원물창고
	 */
	private String rawMtrWarehouseSeCd;

	/**
	 * 선별일자
	 */
	private String sortYmd;


	/**
	 * 재고수량
	 */
	private int invntrQntt;
	/**
	 * 재고중량
	 */
	private double invntrWght;

	/**
	 * 선별수량
	 */
	private int sortQntt;
	private int sortQntt1;
	private int sortQntt2;
	private int sortQntt3;
	private int sortQntt4;
	private int sortQntt5;
	private int sortQntt6;
	private int sortQntt7;
	private int sortQntt8;
	private int sortQntt9;
	private int sortQntt10;
	private int sortQntt11;

	/**
	 * 선별중량
	 */
	private double sortWght;
	private double sortWght1;
	private double sortWght2;
	private double sortWght3;
	private double sortWght4;
	private double sortWght5;
	private double sortWght6;
	private double sortWght7;
	private double sortWght8;
	private double sortWght9;
	private double sortWght10;
	private double sortWght11;

	/**
	 * 투입수량
	 */
	private int inptQntt;

	/**
	 * 투입중량
	 */
	private double inptWght;

	/*입고구분*/
	private String wrhsSe;

	/*운송구분*/
	private String trsprtSe;

	/*규격*/
	private String spcfct;

	/*Loss*/
	private String ls;

	/*대표생산자*/
	private String rprsPrdcr;

	/*투입창고*/
	private String inptWarehouse;

	/**
	 * 포장자동등록 유무
	 */
	private String autoPckgInptYn;

	/**
	 * 상품코드
	 */
	private String spmtPckgUnitCd;
	private String spmtPckgUnitNm;
	
	private String pltno;
    
    private String nxtPckgno;
    
    private String grdQnttNm;
    private String grdQnttWght;

    private String pckgYn;
    
    private String sortRealDelY;
	
	/**
	 * 표준등급
	 */
	private String stdGrd;

	private String stdGrdCd;

	/**
	 * 표준등급
	 */
	private List<SortStdGrdVO> stdGrdList;

	public List<SortStdGrdVO> getStdGrdList() {
		return stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}

	public void setStdGrdList(List<SortStdGrdVO> stdGrdList) {
		this.stdGrdList = stdGrdList == null ? null : stdGrdList.stream().collect(Collectors.toList());
	}

	/**
	 * 상품 표준등급
	 */
	private String gdsGrd;

	private List<GdsStdGrdVO> gdsStdGrdList;

	public List<GdsStdGrdVO> getGdsStdGrdList() {
		return gdsStdGrdList == null ? null : gdsStdGrdList.stream().collect(Collectors.toList());
	}

	public void setGdsStdGrdList(List<GdsStdGrdVO> gdsStdGrdList) {
		this.gdsStdGrdList = gdsStdGrdList == null ? null : gdsStdGrdList.stream().collect(Collectors.toList());
	}


}
