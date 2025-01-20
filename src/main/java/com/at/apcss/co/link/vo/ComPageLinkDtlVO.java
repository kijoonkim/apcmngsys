package com.at.apcss.co.link.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class ComPageLinkDtlVO extends ComVO {

    private String linkSn;
    private String linkUnqId;
    private String dtlElmtCd;
    private String dtlVl;
    private String dtlSeq;

}
