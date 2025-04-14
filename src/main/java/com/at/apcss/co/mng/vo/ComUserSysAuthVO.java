package com.at.apcss.co.mng.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ComUserSysAuthVO extends ComVO {

    /**
     * 사용자 아이디
     */
    private String userId;

    /**
     * 시스템 아이디
     */
    private String sysId;

    /**
     * 승인여부 아이디
     */
    private String aprvYn;

    
}
