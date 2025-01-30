package com.at.apcss.am.wgh.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.stream.Collectors;

@Getter
@Setter
public class WghFcltVO extends ComVO {
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
     * 시설명
     */
    private String fcltNm;
    /**
     * 시설설명
     */
    private String fcltExpln;
    /**
     * 가동시간
     */
    private String oprtngHr;
    /**
     * 비가동시간
     */
    private String nOprtngHr;
    /**
     * 시간단위
     */
    private String hrUnit;
    /**
     * 시설용량
     */
    private String fcltCpct;
    /**
     * 용량단위
     */
    private String cpctUnit;
    /**
     * 무게최소
     */
    private String wghtMin;
    /**
     * 무게최대
     */
    private String wghtMax;
    private String wghtUnit;
    /**
     * 처리횟수
     */
    private String prcsNmtm;
    /**
     * 시작일자
     */
    private String bgngYmd;
    /**
     * 종료일자
     */
    private String endYmd;
    /**
     * 시설비고
     */
    private String fcltRmrk;
    /**
     * 창고구분코드
     */
    private String warehouseSeCd;
    /**
     * DTL VO
     */
    private List<WghFcltDtlVO> wghFcltDtlVO;

    public List<WghFcltDtlVO> getWghFcltDtlVO() {
        return wghFcltDtlVO == null ? null : wghFcltDtlVO.stream().collect(Collectors.toList());
    }

    public void setWghFcltDtlVO(List<WghFcltDtlVO> wghFcltDtlVO) {
        this.wghFcltDtlVO = wghFcltDtlVO == null ? null : wghFcltDtlVO.stream().collect(Collectors.toList());
    }



}
