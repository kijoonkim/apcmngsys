package com.at.apcss.am.wgh.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WghFcltDtlVO extends ComVO {
    /**
     * APC코드
     */
    private String apcCd;
    /**
     * 시설유형
     */
    private String fcltType;
    /**
     * 시설코드
     */
    private String fcltCd;
    /**
     * 시설설명
     */
    private String fcltExpln;
    /**
     * 시설상세유형
     */
    private String fcltDtlType;
    /**
     * 상세코드
     */
    private String dtlCd;
    /**
     * 상세값
     */
    private String dtlVl;
    /**
     * 상세표시명
     */
    private String dtlIndctNm;
}
