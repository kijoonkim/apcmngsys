package com.at.apcss.am.excel.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class AXCell {

    /**
     * Numeric Cell type (0)
     */
    public final static int CELL_TYPE_NUMERIC = 0;

    /**
     * String Cell type (1)
     */
    public final static int CELL_TYPE_STRING = 1;

    /**
     * Formula Cell type (2)
     */
    public final static int CELL_TYPE_FORMULA = 2;

    /**
     * Blank Cell type (3)
     */
    public final static int CELL_TYPE_BLANK = 3;

    /**
     * Boolean Cell type (4)
     */
    public final static int CELL_TYPE_BOOLEAN = 4;

    /**
     * Error Cell type (5)
     */
    public final static int CELL_TYPE_ERROR = 5;

    private int rowIndex;

    private int columnIndex;

    private Integer cellType;

    private int styleType;

    private String StyleTypeName;

    private String cellTypeName;

    private String stringCellValue;

    private Double numericCellValue;

    private Date dateCellValue;

    private String dataFormat;

    private String fontColorType;

    private boolean wordWrapText;

    private String mergedYn;
    // merge option
    private int mergedFirstRow;
    private int mergedLastRow;
    private int mergedFirstCol;
    private int mergedLastCol;

    /**
     * mergeCellType - 1:bycol, 2:byrow, 3:bycolrec, 4:byrestriccol
     */
    private int mergeCellType;
    private int mergeCellFirstRow;
    private int mergeCellLastRow;
    private int mergeCellFirstCol;
    private int mergeCellLastCol;

}
