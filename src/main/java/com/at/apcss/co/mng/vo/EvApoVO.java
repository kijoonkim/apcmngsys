package com.at.apcss.co.mng.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EvApoVO extends ComVO {

    /**
     * 사업자등록번호
     */
    private String brno;

    /**
     * 법인구분코드
     */
    private String corpSeCd;
}
