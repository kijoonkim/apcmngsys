package com.at.apcss.am.sort.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @Class Name : SortPrfmncVO.java
 * @Description : 육안선별에 대한 VO 클래스
 * @author 손민성
 * @since 2024.04.22
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.04.22  손민성        최초 생성
 * </pre>
 */
@Getter
@Setter
public class SortBffaVO extends ComVO {
    /**
     * APC코드
     */
    private String apcCd;
    /**
     * 사전입고번호
     */
    private String bffaWrhsno;
    /**
     * 사전입고번호
     */
    private String pltno;
    /**
     * 입고일자
     */
    private String wrhsYmd;
    /**
     * 생산자코드
     */
    private String prdcrCd;
    /**
     * 생산자명
     */
    private String prdcrNm;
    /**
     * 품목
     */
    private String itemCd;
    /**
     * 품종
     */
    private String vrtyCd;
    /**
     * 상품구분
     */
    private String gdsSeCd;
    /**
     * 입고구분
     */
    private String wrhsSeCd;
    /**
     * 운송구분
     */
    private String trsprtSeCd;
    /**
     * 창고구분
     */
    private String warehouseSeCd;
    /**
     * 설비코드(선별기코드)
     */
    private String fcltCd;
    /**
     * 설비명(선별기명)
     */
    private String fcltNm;
    /**
     * 생산연도
     */
    private String prdctnYr;
    /**
     * 확인자
     */
    private String idntyPrsn;
    /**
     * 박스종류
     */
    private String bxKnd;
    /**
     * 입고수량
     */
    private String wrhsQntt;
    /**
     * 입고중량
     */
    private String wrhsWght;
    /**
     * 재고수량
     */
    private String invntrQntt;
    /**
     * 재고중량
     */
    private String invntrWght;
    /**
     * 비고
     */
    private String rmrk;
    /**
     * 생산일자 시작
     */
    private String inptYmdFrom;
    /**
     * 생산일자 마감
     */
    private String inptYmdTo;
    /**
     * 총 전체 중량
     */
    private String wholWght;
    /**
     * 총 부적합 중량
     */
    private String icptWght;
    /**
     * 등급유형별 수량,중량,비고
     */
    private String grdType1;
    private int grdType1Qntt;
    private double grdType1Wght;
    private String grdType1Rmrk;
    private String grdType2;
    private int grdType2Qntt;
    private double grdType2Wght;
    private String grdType2Rmrk;
    private String grdType3;
    private int grdType3Qntt;
    private double grdType3Wght;
    private String grdType3Rmrk;
    private String grdType4;
    private int grdType4Qntt;
    private double grdType4Wght;
    private String grdType4Rmrk;
    private String grdType5;
    private int grdType5Qntt;
    private double grdType5Wght;
    private String grdType5Rmrk;

    private double grdWrht1;
    private double grdWrht2;
    private double grdWrht3;
    private double grdWrht4;
    private double grdWrht5;
    private double grdWrht6;
    private double grdWrht7;
    private double grdWrht8;
    private double grdWrht9;
    private double grdWrht10;
    private double grdWrht11;
    private double grdWrht12;
    private double grdWrht13;
    private double grdWrht14;
    private double grdWrht15;
    private double grdWrht16;
    private double grdWrht17;
    private double grdWrht18;
    private double grdWrht19;
    private double grdWrht20;

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
    private String grdCd12;
    private String grdCd13;
    private String grdCd14;
    private String grdCd15;
    private String grdCd16;
    private String grdCd17;
    private String grdCd18;
    private String grdCd19;
    private String grdCd20;


    /**
     * 선별내역 사전입고표준등급
     */
    List<SortBffaWrhsStdGrdVO> sortBffaWrhsStdGrdVO;
}
