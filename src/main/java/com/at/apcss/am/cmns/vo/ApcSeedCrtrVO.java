package com.at.apcss.am.cmns.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ApcSeedCrtrVO extends ComVO {
    /**
     * APC 코드
     */
    private String apcCd;

    /**
     * 종자 코드
     */
    private String seedCd;

    /**
     * 종자명
     */
    private String seedNm;

    /**
     * 표시명
     */
    private String indctNm;

    /**
     * 품목 코드
     */
    private String itemCd;

    /**
     * 품종 코드
     */
    private String vrtyCd;

    /**
     * 표시 순서
     */
    private int indctSeq;
}
