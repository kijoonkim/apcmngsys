package com.at.apcss.am.clcln.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

/**
 * 정산 상세 정보 VO
 */
@Getter
@Setter
public class ClclnDtlVO extends ComVO {

    /**
     * APC 코드
     */
    private String apcCd;

    /**
     * 정산일자
     */
    private String clclnYmd;

    /**
     * 정산일련번호
     */
    private int clclnSn;

    /**
     * 정산상세일련번호
     */
    private int clclnDtlSn;

    /**
     * 정산상세종류
     */
    private String clclnDtlKnd;

    /**
     * 정산상세코드
     */
    private String clclnDtlCd;

    /**
     * 선별수량
     */
    private int sortQntt;

    /**
     * 선별중량
     */
    private int sortWght;

    /**
     * 정산수량
     */
    private int clclnQntt;

    /**
     * 정산중량
     */
    private int clclnWght;

    /**
     * 정산여부
     */
    private String clclnYn;
}
