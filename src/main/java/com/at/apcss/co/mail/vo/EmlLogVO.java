package com.at.apcss.co.mail.vo;

import com.at.apcss.co.sys.vo.ComVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EmlLogVO extends ComVO {

    private String emlSeq;
    private String sndptyEml;
    private String rcvrEml;
    private String sbjt;
    private String conts;
    private String sndngType;
    private String sndngDt;
    private String sndptyNm;
    private String rcvrNm;
    private String sndngYn;

    private int fetchSize;

}
