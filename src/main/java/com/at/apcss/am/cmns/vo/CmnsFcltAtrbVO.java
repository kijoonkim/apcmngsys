package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : CmnsFcltVO.java
 * @Description : APC 가동시설속성 VO [TB_OPRTNG_APC_FCLT_ATRB]
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
public class CmnsFcltAtrbVO extends ComVO {
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
     * 속성유형
     */
    private String fcltAtrbType;

    /**
     * 순번
     */
    private int sn;

    /**
     * 속성코드
     */
    private String atrbCd;

    /**
     * 속성값
     */
    private String atrbVl;

    /**
     * 속성표시명
     */
    private String atrbIndctNm;

}
