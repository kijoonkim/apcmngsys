package com.at.apcss.pd.sprt.vo;


import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SprtBizRsltInqVO extends ComVO {
    private String sprtBizSe;
    private String crtrYmdFrom;
    private String crtrYmdTo;
    private String sprtYmdFrom;
    private String sprtYmdTo;
    private String corpNm;
    private String sprtBizYr;
    private String sprtBizNm;
    private String bzmnConm;
    private String crno;
    private String brno;
    private String stdgCtpvCd;
    private String stdgSggCd;
    private String slctnYr;
    private String sprtYr;
    private String altmntAmt;
    private String altmntInt;
    private String rmrk;
    private String itemCd;
    private String bizType;
    private String onslfBrdnAmt;
    private String sprtBizCd;
    private String sprtBizYrMax;
    private String sprtBizYrMin;
}
