package com.at.apcss.pd.pcom.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class PruoMstVO extends ComVO {

    private String crtrYr;
    private String indctNm;
    private String cmptnYn;
    private String ddlnSttsCd;
    private String bgngYmd;
    private String endYmd;

    private String showOnlyInPrgrsYn;

}
