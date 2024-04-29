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
    private String grdType1Qntt;
    private String grdType1Wght;
    private String grdType1Rmrk;
    private String grdType2;
    private String grdType2Qntt;
    private String grdType2Wght;
    private String grdType2Rmrk;
    private String grdType3;
    private String grdType3Qntt;
    private String grdType3Wght;
    private String grdType3Rmrk;
    private String grdType4;
    private String grdType4Qntt;
    private String grdType4Wght;
    private String grdType4Rmrk;
    private String grdType5;
    private String grdType5Qntt;
    private String grdType5Wght;
    private String grdType5Rmrk;

    /**
     * 선별내역 사전입고표준등급
     */
    List<SortBffaWrhsStdGrdVO> sortBffaWrhsStdGrdVO;
}
