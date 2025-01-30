package com.at.apcss.am.shpgot.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ShpgotCrtrVO extends ComVO {

    private boolean needsInsert;
    /**
     APC코드
     **/
    private String apcCd;

    private String shpgotCrtrType;

    /**
     기준코드
     **/
    private String crtrCd;
    /**
     기준값
     **/
    private Integer crtrVl;
    /**
     기준표시명
     **/
    private String crtrIndctNm;
    /**
     사용여부
     **/
    private String useYn;
    /**
     표시순서
     **/
    private Integer indctSeq;

    private String shpgotCrtrTypeNm;
    private String crtrUseYn;
    private String crtrDtlUseYn;

    private int crtrSeq;
    private int crtrDtlSeq;

    private String shpgotTrgtCd;
    private String rmrk;

    /**
     삭제여부
     **/
    private String delYn;
    /**
     상세순번
     **/
    private Integer dtlSn;
    /**
     상세코드
     **/
    private String dtlCd;
    /**
     상세값
     **/
    private String dtlVl;
    /**
     상세표시명
     **/
    private String dtlIndctNm;

    private int maxDtlSn;

    private String crtrChrVl;

}
