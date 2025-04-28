package com.at.apcss.am.cmns.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ItemVrtyRprsPrdcrVO {
    private String itemCd;
    private String vrtyCd;
    private String rprsPrdcrCd;

    private String gdsSeCd;
    private String wrhsSeCd;

    private int qntt;
    private double wght;
}
