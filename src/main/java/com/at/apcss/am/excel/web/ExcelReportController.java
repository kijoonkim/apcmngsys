package com.at.apcss.am.excel.web;


import com.at.apcss.am.excel.service.ExcelReportService;
import com.at.apcss.am.excel.vo.*;
import com.at.apcss.co.sys.controller.BaseController;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Class Name : ExcelReportController.java
 * @Description : 엑셀 리포트 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.21  신정철        최초 생성
 *      </pre>
**/

@Controller
public class ExcelReportController extends BaseController {


    @Resource(name="excelReportService")
    private ExcelReportService excelReportService;


    @PostMapping(value = "/exportExcelReport.do")
    @ResponseBody
    public void postExportExcel(HttpServletResponse response, @RequestBody AXWorkbook axWorkbook, HttpSession session, HttpServletRequest request) throws IOException {

        String fileName = axWorkbook.getFileName();

        try (ByteArrayOutputStream outByteStream = new ByteArrayOutputStream(); XSSFWorkbook workbook = excelReportService.createSWorkbook(axWorkbook)) {

            logger.debug(axWorkbook.toString());

            if (workbook == null) {
                logger.debug("workbook is null");
            } else {
                workbook.write(outByteStream);
            }

            /*
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.setContentDispositionFormData("attachment", fileName);
            */
            byte[] outArray = outByteStream.toByteArray();
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(fileName, "UTF-8") + "\";");
            response.setContentLength(outArray.length);

            ServletOutputStream out = response.getOutputStream();
            out.write(outArray);
            out.flush();
            out.close();

        } catch (UnsupportedEncodingException e) {
            logger.error(e.getMessage());
        } catch (Exception e){
            logger.error(e.toString(), e);
        }
    }

    //@PostMapping(value = "/exportExcel")
    @RequestMapping(value = "/exportExcel.do")
    @ResponseBody
    public void exportExcel(HttpServletResponse response, @RequestParam Map<String, String> paramMap, HttpSession session, HttpServletRequest request) throws IOException {

        AXWorkbook axWorkbook = new AXWorkbook();

        List<AXWorksheet> axWorksheetList = new ArrayList<>();

        int sheetIndex = -1;
        int rowIndex = -1;

        // Sheet 1 : 1.산지유통시설 현황
        sheetIndex++;
        AXWorksheet axWorksheet = new AXWorksheet();
        axWorksheet.setSheetName("1.산지유통시설현황");
        axWorksheet.setSheetIndex(++sheetIndex);

        /*
        List<AXColumn> axColumnList = new ArrayList<>();
        for ( int iCol = 0; iCol < 9; iCol++ ) {
            AXColumn axColumn = new AXColumn();
            axColumn.setColumnIndex(iCol);
            axColumn.setColumnWidth(20*254);

            axColumnList.add(axColumn);
        }
        axWorksheet.setColumnList(axColumnList);
        */

        List<AXRow> axRowList = new ArrayList<>();

        {
            AXRow axRow = new AXRow();
            axRow.setRowIndex(++rowIndex);
            List<AXCell> axCellList = new ArrayList<>();
            AXCell axCell = new AXCell();
            axCell.setColumnIndex(0);
            axCell.setCellType(AXCell.CELL_TYPE_STRING);
            axCell.setStringCellValue("1.1. 산지유통시설 개소수");
            axCellList.add(axCell);
            axRow.setCellList(axCellList);
            axRowList.add(axRow);
        }
        {
            AXRow axRow = new AXRow();
            axRow.setRowIndex(++rowIndex);
            List<AXCell> axCellList = new ArrayList<>();
            {
                AXCell axCell = new AXCell();
                axCell.setColumnIndex(0);
                axCell.setCellType(AXCell.CELL_TYPE_STRING);
                axCell.setStringCellValue("개소수 : 산지유통조직 유형 (단위: 개소)");
                axCellList.add(axCell);
            }

            axRow.setCellList(axCellList);
            axRowList.add(axRow);
        }
        {
            AXRow axRow = new AXRow();
            axRow.setRowIndex(++rowIndex);
            List<AXCell> axCellList = new ArrayList<>();
            {
                AXCell axCell = new AXCell();
                axCell.setColumnIndex(0);
                axCell.setCellType(AXCell.CELL_TYPE_STRING);
                axCell.setStringCellValue("출자출하조직 또는 참여조직 중 전년도 선정에서 탈락한 조직 포함");
                axCellList.add(axCell);
            }
            axRow.setCellList(axCellList);
            axRowList.add(axRow);
        }

        {
            AXRow axRow = new AXRow();
            axRow.setRowIndex(++rowIndex);
            List<AXCell> axCellList = new ArrayList<>();
            {
                AXCell axCell = new AXCell();
                axCell.setColumnIndex(0);
                axCell.setCellType(AXCell.CELL_TYPE_STRING);
                axCell.setStringCellValue("개소수 : 소유자 및 운영자 (단위: 개소)");
                axCellList.add(axCell);
            }
            axRow.setCellList(axCellList);
            axRowList.add(axRow);
        }
        {
            AXRow axRow = new AXRow();
            axRow.setRowIndex(++rowIndex);
            List<AXCell> axCellList = new ArrayList<>();
            {
                AXCell axCell = new AXCell();
                axCell.setColumnIndex(0);
                axCell.setCellType(AXCell.CELL_TYPE_STRING);
                axCell.setStringCellValue("민간 : 농협, 농업법인, 재단법인 등 민간 사업자");
                axCellList.add(axCell);
            }
            {
                AXCell axCell = new AXCell();
                axCell.setColumnIndex(0);
                axCell.setCellType(AXCell.CELL_TYPE_STRING);
                axCell.setStringCellValue("출자출하조직 또는 참여조직 중 전년도 선정에서 탈락한 조직 포함");
                axCellList.add(axCell);
            }
            axRow.setCellList(axCellList);
            axRowList.add(axRow);
        }

    /*
        for ( int iRow = 1; iRow < 9; iRow++ ) {
            AXRow axRow = new AXRow();
            axRow.setRownum(iRow);

            List<AXCell> axCellList = new ArrayList<>();
            for ( int iCol = 0; iCol < 9; iCol++ ) {
                AXCell axCell = new AXCell();
                axCell.setColumnIndex(iCol);
                axCell.setCellType(AXCell.CELL_TYPE_STRING);
                String stringCellValue = String.format("%s X %s = %s", iRow + 1, iCol + 1, (iRow+1) * (iCol+1));

                logger.debug("{}", stringCellValue);

                axCell.setStringCellValue(stringCellValue);
                axCellList.add(axCell);
            }

            axRow.setCellList(axCellList);
            axRowList.add(axRow);
        }
    */
        axWorksheet.setRowList(axRowList);

        axWorksheetList.add(axWorksheet);

        axWorkbook.setAxWorksheetList(axWorksheetList);

        ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
        XSSFWorkbook workbook = null;
        try {
            logger.debug(axWorkbook.toString());
            workbook = excelReportService.createSWorkbook(axWorkbook);

            if (workbook == null) {
                logger.debug("workbook is null");
            }


            workbook.write(outByteStream);

            byte[] outArray = outByteStream.toByteArray();
            String fileName = "test.xlsx";
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename="+ fileName);
            response.setContentLength(outArray.length);

            ServletOutputStream out = response.getOutputStream();
            out.write(outArray);
            out.flush();
            out.close();

        } catch (Exception e){
            logger.error(e.toString(), e);
        }




    }




    //@PostMapping(value = "/saveExcelReport")
    @RequestMapping(value = "/saveExcelReport")
    @ResponseBody
    public void excelExport(HttpServletResponse response, @RequestParam Map<String, String> paramMap, HttpSession session, HttpServletRequest request) throws IOException {


        List<Map<String,Object>> results = new ArrayList<>();

        XSSFWorkbook workbook = new XSSFWorkbook();
        ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();

        /**
         * Excel Style
         */
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


        try{
            workbook = new XSSFWorkbook(); //엑셀 생성
            XSSFSheet sheet = workbook.createSheet("Binco Excel"); //엑셀 시트 생성

            workbook.getSheetAt(0).setColumnWidth(0, 1500);
            workbook.getSheetAt(0).setColumnWidth(1, 3000);
            workbook.getSheetAt(0).setColumnWidth(2, 5000); // 엑셀 넓이 조정

            int row = 0;
            XSSFRow sheetTitle = sheet.createRow(row); // 0번째 로우 생성
            sheetTitle.createCell(0).setCellValue("Binco Excel"); // 0번째 제목 추가
            sheetTitle.getCell(0).setCellStyle(styleSheetTitle); // 0번째 셀에 제목 스타일 추가
            sheet.addMergedRegion(new CellRangeAddress(0,0,0, 3)); // 제목 합치기

            sheet.createRow(++row); // 로우 한개 더 생성

            XSSFRow rowTitle = sheet.createRow(++row); // 데이터 제목 로우 생성

            rowTitle.createCell(0).setCellValue("순번");
            rowTitle.getCell(0).setCellStyle(styleRowTitle); // 테이블 제목 스타일 입히기

            rowTitle.createCell(1).setCellValue("제목");
            rowTitle.getCell(1).setCellStyle(styleRowTitle); // 테이블 제목 스타일 입히기

            rowTitle.createCell(2).setCellValue("내용");
            rowTitle.getCell(2).setCellStyle(styleRowTitle); // 테이블 제목 스타일 입히기

            for(int i=0; i<results.size(); ++i) {
                Map<String, Object> map = results.get(i);
                XSSFRow rowData = sheet.createRow(++row); // 로우 생성
                rowData.createCell(0).setCellValue(i);
                rowData.createCell(1).setCellValue((String)map.get("title"));
                rowData.createCell(2).setCellValue((String)map.get("content"));
            } // 데이터 삽입

            workbook.write(outByteStream);

        } catch (Exception e){
            logger.error(e.toString(), e);
        } finally {
            if(outByteStream != null) {
                try{
                    outByteStream.close();
                }catch(IOException e) {
                    logger.error(e.toString(), e);
                }
            }
            if (workbook != null) {
                try {
                    workbook.close();
                }catch(IOException e) {
                    logger.error(e.toString(), e);
                }
            }
        }

        byte[] outArray = outByteStream.toByteArray();
        String fileName = "test.xlsx";
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename="+ fileName);
        response.setContentLength(outArray.length);

        ServletOutputStream out = response.getOutputStream();
        out.write(outArray);
        out.flush();
        out.close();

    }

}
