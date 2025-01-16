package com.at.apcss.am.spmt.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ShpgotApcGdsVO extends ComVO {
    /**
     * APC 코드
     */
    private String apcCd;

    /**
     * 반출일자
     */
    private String shpgotYmd;

    /**
     * 반출일련번호
     */
    private int shpgotSn;

    /**
     * 상세일련번호
     */
    private int dtlSn;

    /**
     * 반출번호
     */
    private String shpgotNo;

    /**
     * 포장번호
     */
    private String pckgno;

    /**
     * 포장순번
     */
    private int pckgSn;

    /**
     * 생산자코드
     */
    private String prdcrCd;

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
    private int shpgotWght;

}
