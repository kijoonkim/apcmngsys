package com.at.apcss.co.mng.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ComCdDtlVO extends ComVO {

    /**
     * 코드ID
     */
    private String cdId;

    /**
     * 코드값
     */
    private String cdVl;

    /**
     * 삭제유무
     */
    private String useYn;

}
