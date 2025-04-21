package com.at.apcss.am.excel.service.impl;

import com.at.apcss.am.excel.service.ExcelReportService;
import com.at.apcss.am.excel.vo.*;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.util.List;


@Service("excelReportService")
public class ExcelReportServiceImpl extends BaseServiceImpl implements ExcelReportService {



    private enum StyleType {
        H1, H2, H3, H4,
        TH, TD,
        D1, D2, D3,
        NONE,
    }

    private final static String FONT_COLOR_TYPE_STOCK = "STOCK";

    @Override
    public XSSFWorkbook createSWorkbook(AXWorkbook axWorkbook) throws IOException {

        try {
            XSSFWorkbook workbook = new XSSFWorkbook();


            /**
             * Excel Style
             */
            /*
            XSSFCellStyle styleSheetTitle = workbook.createCellStyle();
            Font titleFont = workbook.createFont();
            titleFont.setFontHeightInPoints((short)18);
            styleSheetTitle.setFont(titleFont);
            styleSheetTitle.setAlignment(HorizontalAlignment.CENTER);

            XSSFCellStyle styleRowTitle = workbook.createCellStyle();
            Font rowFont = workbook.createFont();
            rowFont.setFontHeightInPoints((short)9);
            styleRowTitle.setFont(rowFont);
            styleRowTitle.setAlignment(HorizontalAlignment.CENTER);
            styleRowTitle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            styleRowTitle.setVerticalAlignment(VerticalAlignment.CENTER );
            styleRowTitle.setFillForegroundColor(IndexedColors.PALE_BLUE.getIndex());

             */

            List<AXWorksheet> axWorksheetList = axWorkbook.getAxWorksheetList();

            if (axWorksheetList != null && !axWorksheetList.isEmpty()) {
                int sheetIndex = -1;
                for ( AXWorksheet axSheet : axWorksheetList ) {
                    sheetIndex++;
                    String defaultSheetName = "Sheet" + ComUtil.toString(sheetIndex + 1);
                    String sheetName = ComUtil.nullToDefault(axSheet.getSheetName(), defaultSheetName);
                    XSSFSheet worksheet = workbook.createSheet(sheetName);

                    List<AXColumn> axColumnList = axSheet.getColumnList();
                    List<AXRow> axRowList = axSheet.getRowList();

                    if (axColumnList != null && !axColumnList.isEmpty()) {
                        for ( AXColumn axColumn : axColumnList ) {
                            worksheet.setColumnWidth(axColumn.getColumnIndex(), axColumn.getColumnWidth() * 254);
                        }
                    }

                    if (axRowList != null && !axRowList.isEmpty()) {

                        for ( AXRow axRow : axRowList ) {
                            XSSFRow row = worksheet.createRow(axRow.getRowIndex());
                            List<AXCell> axCellList = axRow.getCellList();
                            if (axCellList != null && !axCellList.isEmpty()) {
                                for ( AXCell axCell : axCellList ) {
                                    XSSFCell cell = row.createCell(axCell.getColumnIndex());

                                    // set value

                                    String dataFormat = axCell.getDataFormat();
                                    CellStyle cellStyle = workbook.createCellStyle();
                                    Font cellFont = workbook.createFont();
                                    short fontHeight = 11;
                                    boolean needsCellStyle = true;

                                    switch (axCell.getCellType()) {
                                        case AXCell.CELL_TYPE_NUMERIC:
                                            cell.setCellType(AXCell.CELL_TYPE_NUMERIC);
                                            cell.setCellValue(axCell.getNumericCellValue());
                                            if (!StringUtils.hasText(dataFormat)) {
                                                dataFormat = "#,##0";
                                            }

                                            if (FONT_COLOR_TYPE_STOCK.equals(axCell.getFontColorType())) {
                                                if (axCell.getNumericCellValue() > 0) {
                                                    cellFont.setColor(HSSFColor.BLUE.index);
                                                } else if (axCell.getNumericCellValue() < 0) {
                                                    cellFont.setColor(HSSFColor.RED.index);
                                                } else {
                                                    cellFont.setColor(HSSFColor.BLACK.index);
                                                }
                                            }

                                            break;
                                        case AXCell.CELL_TYPE_STRING:
                                            cell.setCellType(AXCell.CELL_TYPE_STRING);
                                            cell.setCellValue(ComUtil.nullToEmpty(axCell.getStringCellValue()).replace("\\n", "\n"));

                                            break;
                                    }

                                    // set style
                                    String styleTypeName = ComUtil.nullToDefault(axCell.getStyleTypeName(), ComUtil.nullToDefault(axRow.getStyleTypeName(), ComConstants.CON_BLANK));
                                    StyleType styleType = StyleType.NONE;
                                    if (StringUtils.hasText(styleTypeName)) {
                                        try {
                                            styleType = StyleType.valueOf(styleTypeName);
                                        } catch (IllegalArgumentException ignored) {
                                        }
                                    }

                                    switch (styleType) {

                                        case H1:
                                            fontHeight = 20;
                                            cellFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
                                            break;
                                        case H2:
                                            fontHeight = 16;
                                            cellFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
                                            break;
                                        case H3:
                                            fontHeight = 14;
                                            cellFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
                                            break;
                                        case H4:
                                            fontHeight = 12;
                                            break;
                                        case TH:
                                            cellFont.setBoldweight(Font.BOLDWEIGHT_BOLD);

                                            cellStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
                                            cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
                                            cellStyle.setAlignment(CellStyle.ALIGN_CENTER);
                                            cellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);

                                            cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
                                            cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
                                            cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
                                            cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);

                                            break;
                                        case TD:
                                            fontHeight = 10;

                                            cellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);

                                            cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
                                            cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
                                            cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
                                            cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);

                                            break;
                                        case D1:
                                            fontHeight = 8;
                                            break;
                                        case D2:
                                            fontHeight = 8;
                                            cellFont.setItalic(true);
                                            cellFont.setColor(HSSFColor.GREY_50_PERCENT.index);
                                            break;
                                        case D3:
                                            fontHeight = 8;
                                            cellFont.setColor(HSSFColor.DARK_BLUE.index);
                                            cellStyle.setAlignment(CellStyle.ALIGN_RIGHT);
                                            break;

                                        case NONE:
                                            break;

                                        default:
                                            needsCellStyle = false;
                                            break;
                                    }


                                    if (axCell.isWordWrapText()) {
                                        needsCellStyle = true;
                                        cellStyle.setWrapText(true);
                                    }

                                    if (StringUtils.hasText(dataFormat)) {
                                        needsCellStyle = true;
                                        cellStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat(dataFormat));
                                    }

                                    if (needsCellStyle) {
                                        fontHeight *= 20;
                                        cellFont.setFontHeight(fontHeight);

                                        cellStyle.setFont(cellFont);
                                        cell.setCellStyle(cellStyle);
                                    }

                                    // set merge
                                    if (ComConstants.CON_YES.equals(axCell.getMergedYn())) {
                                        int mergedFirstRow = axCell.getMergedFirstRow();
                                        int mergedLastRow = axCell.getMergedLastRow();
                                        int mergedFirstCol = axCell.getMergedFirstCol();
                                        int mergedLastCol = axCell.getMergedLastCol();

                                        if (mergedLastRow >= mergedFirstRow && mergedLastCol >= mergedFirstCol) {

                                            switch (styleType) {
                                                case TH:
                                                case TD:
                                                    for ( int iRow = mergedFirstRow; iRow <= mergedLastRow; iRow++ ) {

                                                        XSSFRow xRow = worksheet.getRow(iRow);
                                                        if (xRow == null) {
                                                            xRow = worksheet.createRow(iRow);
                                                        }

                                                        for ( int iCol = mergedFirstCol; iCol <= mergedLastCol; iCol++ ) {
                                                            XSSFCell xCell = xRow.getCell(iCol);
                                                            CellStyle xCellStyle;
                                                            if (xCell == null) {
                                                                xCell = xRow.createCell(iCol);
                                                                xCellStyle = workbook.createCellStyle();
                                                            } else {
                                                                xCellStyle = xCell.getCellStyle();
                                                            }

                                                            xCellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
                                                            xCellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
                                                            xCellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
                                                            xCellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
                                                            xCell.setCellStyle(xCellStyle);
                                                        }
                                                    }

                                                    break;

                                                default:
                                                    break;
                                            }

                                            worksheet.addMergedRegion(new CellRangeAddress(mergedFirstRow, mergedLastRow, mergedFirstCol, mergedLastCol));



                                        }



                                    }



                                }
                            }
                        }
                    }
                }
            }

            return workbook;

        } catch (Exception ignored) {
        }

        return null;
    }
}
