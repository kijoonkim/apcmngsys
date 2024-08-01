package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : CmnsFcltDtlVO.java
 * @Description : APC 가동시설상세 VO [TB_OPRTNG_APC_FCLT_DTL]
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
public class CmnsFcltDtlVO extends ComVO {
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

    /**
     * 시설설명
     */
    private String fcltExpln;
}
