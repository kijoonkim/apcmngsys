package com.at.apcss.am.spmt.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

/**
 * @Class Name : SpmtCmndVO.java
 * @Description : 출고지시에 대한 VO 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Getter
@Setter
public class ShpgotApcCrtrDtlVO extends ComVO {
    /**
     * APC코드
     */
    private String apcCd;

    /**
     * 반출기준유형
     */
    private String shpgotCrtrType;

    /**
     * 기준코드
     */
    private String crtrCd;

    /**
     * 상세일련번호
     */
    private int dtlSn;

    /**
     * 상세코드
     */
    private String dtlCd;

    /**
     * 상세값
     */
    private int dtlVl;

    /**
     * 상세표시명
     */
    private String dtlIndctNm;

    /**
     * 표시순서
     */
    private int indctSeq;

    /**
     * 사용여부
     */
    private String useYn;

    /**
     * 비고
     */
    private String rmrk;
}
