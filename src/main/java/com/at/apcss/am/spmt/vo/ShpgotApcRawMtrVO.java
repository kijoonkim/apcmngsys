package com.at.apcss.am.spmt.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SpmtCmndVO.java
 * @Description : 반품기준 관리에대한 VO 클래스
 * @author 손민성
 * @since 2025.01.04
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.01.04  손민성        최초 생성
 * </pre>
 */
@Getter
@Setter
public class ShpgotApcRawMtrVO extends ComVO {
    /**
     * APC코드
     */
    private String apcCd;

    /**
     * 반출일자
     */
    private String shpgotYmd;
    private String shpgotYmdTo;
    private String shpgotYmdFrom;

    /**
     * 반출일련번호
     */
    private int shpgotSn;

    /**
     * 상세일련번호
     */
    private int dtlSn;

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
     * 품목코드
     */
    private String itemCd;
    /**
     * 품목코드명
     */
    private String itemNm;

    /**
     * 품종코드
     */
    private String vrtyCd;
    /**
     * 품종코드명
     */
    private String vrtyNm;

    /**
     * 등급코드
     */
    private String grdCd;

    /**
     * 규격코드
     */
    private String spcfctCd;

    /**
     * 출하포장단위코드
     */
    private String spmtPckgUnitCd;

    /**
     * 상품구분코드
     */
    private String gdsSeCd;

    /**
     * 입고구분코드
     */
    private String wrhsSeCd;

    /**
     * 창고구분코드
     */
    private String warehouseSeCd;

    /**
     * 거래처코드
     */
    private String cnptCd;

    /**
     * 반출원인코드
     */
    private String shpgotCsCd;

    /**
     * 반출불량코드
     */
    private String shpgotBadCd;

    /**
     * 반출비고
     */
    private String shpgotRmrk;

    /**
     * 반출수량
     */
    private int shpgotQntt;

    /**
     * 반출중량
     */
    private double shpgotWght;
}
