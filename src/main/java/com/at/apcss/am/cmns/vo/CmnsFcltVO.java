package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : CmnsFcltVO.java
 * @Description : APC 가동시설 VO [TB_OPRTNG_APC_FCLT]
 * @author 손민성
 * @since 2024.07.29
 * @version 1.0
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.29  손민성        최초 생성
 * </pre>
 */
@Getter
@Setter
public class CmnsFcltVO extends ComVO {
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
    private int oprtngHr;

    /**
     * 비가동시간
     */
    private int nOprtngHr;

    /**
     * 시간단위
     */
    private String hrUnit;

    /**
     * 시설용량
     */
    private int fcltCpct;

    /**
     * 용량단위
     */
    private String cpctUnit;

    /**
     * 무게최소
     */
    private int wghtMin;

    /**
     * 무게최대
     */
    private int wghtMax;

    /**
     * 무게단위
     */
    private String wghtUnit;

    /**
     * 처리횟수
     */
    private int prcsNmtm;

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
     * 저장 구분 코드
     */
    private String gubun;
}
