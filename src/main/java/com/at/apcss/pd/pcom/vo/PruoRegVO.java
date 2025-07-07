package com.at.apcss.pd.pcom.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PruoRegVO extends ComVO {

    /**
     * 기준연도
     */
    private String crtrYr;

    /**
     * 표시명
     */
    private String indctNm;

    /**
     * 완료여부
     */
    private String cmptnYn;

    /**
     * 마감상태코드
     */
    private String ddlnSttsCd;

    /**
     * 시작일자
     */
    private String bgngYmd;

    /**
     * 종료일자
     */
    private String endYmd;

    /**
     * 삭제유무
     */
    private String delYn;

    /**
     * 상세코드
     */
    private String dtlCd;

    /**
     * 상세수치
     */
    private double dtlNv;

    /**
     * 상세문자
     */
    private String dtlChr;

    /**
     * 사용여부
     */
    private String useYn;
}
