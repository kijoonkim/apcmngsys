package com.at.apcss.co.link.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ComLnkgRptVO extends ComVO {
    private String lnkgUnqId;
    private String taskId;
    private String taskSeCd;
    private String rptDocFilePath;
    private String prgrmNm;
    private String prgrmUrl;
    private String prgrmPrcsType;
    private String prcsRsltNocs;
    private String prmtrData;
    private String lnkgCertKey;
    private String lnkgOpenYmd;
    private String lnkgExpryYn;
}
