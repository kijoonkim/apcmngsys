package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ApcItemCrtrDtlVO extends ComVO {
    /**
     * APC 코드
     */
    private String apcCd;

    /**
     * 품목 코드
     */
    private String itemCd;

    /**
     * 품목상세 코드
     */
    private String itemDtlCd;

    /**
     * 품목 상세명
     */
    private String itemDtlNm;

    /**
     * 표시 순서
     */
    private int indctSeq;

    /**
     * 사용 여부
     */
    private String useYn;

    /**
     * 등급관리 코드
     */
    private String grdMngCd;
}
