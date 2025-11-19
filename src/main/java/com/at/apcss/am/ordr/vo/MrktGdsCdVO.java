package com.at.apcss.am.ordr.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MrktGdsCdVO extends ComVO {
    /**
     * 주문APC코드
     */
    private String ordrApcCd;

    /**
     * 대형시장코드
     */
    private String lgszMrktCd;

    /**
     * 시장상품코드
     */
    private String mrktGdsCd;

    /**
     * 시장상품명
     */
    private String mrktGdsNm;

    /**
     * 사용여부
     */
    private String useYn;
}
