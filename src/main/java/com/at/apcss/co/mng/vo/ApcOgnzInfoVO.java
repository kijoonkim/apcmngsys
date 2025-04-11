package com.at.apcss.co.mng.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApcOgnzInfoVO extends ComVO {

    /**
     * 사업자등록번호
     */
    private String brno;

    /**
     * 조직코드
     */
    private String ognzCd;
}
