package com.at.apcss.am.shpgot.vo;

import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ShpgotRsltVO extends ComVO {

    private boolean needsInsert;

    private String apcCd;
    private String shpgotYmd;
    private String shpgotYmdFrom;
    private String shpgotYmdTo;

    private int maxSn;
    private int shpgotSn;
    private int dtlSn;
    private String wrhsno;
    private String prdcrCd;
    private String itemCd;
    private String vrtyCd;
    private String grdCd;
    private String spcfctCd;
    private String spmtPckgUnitCd;
    private String gdsSeCd;
    private String wrhsSeCd;
    private String warehouseSeCd;
    private String cnptCd;
    private String shpgotCsCd;
    private String shpgotBadCd;
    private String shpgotRmrk;
    private int shpgotQntt;
    private double shpgotWght;

    private String shpgotNo;
    private String pckgno;
    private int pckgSn;
    private String trsprtCoCd;
    private String trsprtCoNm;
    private String vhclno;
    private String dldtn;
    private double trsprtCst;
    private String rmrk;
    private String bfrSpmtno;
    private String bfrPckgno;
    private int bfrPckgSn;
    private int bfrSpmtSn;


    private String pltno;
    private String[] pltnos;
    private String prdcrNm;
    private String itemNm;
    private String vrtyNm;
    private String grdNm;
    private String shpgotCsNm;
    private String shpgotBadNm;
    private String spmtPckgUnitNm;

}
