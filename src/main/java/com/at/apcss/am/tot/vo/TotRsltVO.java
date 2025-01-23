package com.at.apcss.am.tot.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TotRsltVO extends ComVO {



    private String apcCd;
    private String totYmd;

    private String totCrtrType;

    private String crtrYmd;
    private String termKndCd;

    private int totSn;
    private int dtlSn;
    private String wrhsYmd;
    private String prdcrCd;
    private String prdcrNm;
    private String itemCd;
    private String itemNm;
    private String vrtyCd;
    private String vrtyNm;
    private String grdCd;
    private String grdNm;
    private String spcfctCd;
    private String spcfctNm;
    private String spmtPckgUnitCd;
    private String spmtPckgUnitNm;
    private String cnptCd;
    private String cnptNm;


    private String gdsSeCd;
    private String wrhsSeCd;
    private String warehouseSeCd;

    private int totQntt;
    private double totWght;

    private int qntt0;
    private int qntt1;
    private int qntt2;
    private int qntt3;
    private int qntt4;
    private int qntt5;
    private int qntt6;
    private int qntt7;
    private int qntt8;
    private int qntt9;
    private int qntt10;
    private int qntt11;
    private int qntt12;

    private double wght0;
    private double wght1;
    private double wght2;
    private double wght3;
    private double wght4;
    private double wght5;
    private double wght6;
    private double wght7;
    private double wght8;
    private double wght9;
    private double wght10;
    private double wght11;
    private double wght12;

    private String colMm;
    private String colMmYear;
    private String colMmMonth;
    private String colYy;
    private String colQy;
    private String colQyYear;
    private String colQyMonth;
    private String colHy;
    private String colHyYear;
    private String colHyMonth;

    private String rtnCd;
    private String rtnMsg;

    private String inptYmdFrom;
    private String inptYmdTo;
}
