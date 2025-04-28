package com.at.apcss.am.excel.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class AXWorkbook {


    private String fileName;

    private List<AXWorksheet> axWorksheetList;

}
