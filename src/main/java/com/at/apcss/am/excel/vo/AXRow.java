package com.at.apcss.am.excel.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class AXRow {

    private int rowIndex;

    private short rowHeight;

    private int styleType;

    private String StyleTypeName;

    private List<AXCell> cellList;

}
