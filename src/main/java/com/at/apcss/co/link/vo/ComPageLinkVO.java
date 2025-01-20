package com.at.apcss.co.link.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.stream.Collectors;


@Getter
@Setter
public class ComPageLinkVO extends ComVO {

    private String linkSn;
    private String linkUnqId;
    private String pageLinkType;
    private String linkExpryDt;
    private String linkExpryYn;
    private String linkUrl;
    private String linkCertKey;
    private String apcCd;
    private String userId;

    private List<ComPageLinkDtlVO> dtlList;

    public List<ComPageLinkDtlVO> getDtlList() {
        return dtlList == null ? null : dtlList.stream().collect(Collectors.toList());
    }

    public void setDtlList(List<ComPageLinkDtlVO> dtlList) {
        this.dtlList = dtlList == null ? null : dtlList.stream().collect(Collectors.toList());
    }
}