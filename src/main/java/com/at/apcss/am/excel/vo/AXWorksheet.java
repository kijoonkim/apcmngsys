package com.at.apcss.am.excel.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class AXWorksheet {

    private String sheetName;

    private int sheetIndex;

    private short defaultRowHeight;

    private float defaultRowHeightInPoints;

    private int defaultColumnWidth;

    private List<AXColumn> columnList;

    private List<AXRow> rowList;

}
