package com.at.apcss.am.excel.service;

/**
 * 엑셀 리포트 Service 인터페이스
 * @author 신정철
 * @since 2024.12.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.12.21  신정철        최초 생성
 * </pre>
 */
import com.at.apcss.am.excel.vo.AXWorkbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.IOException;

public interface ExcelReportService {

    public XSSFWorkbook createSWorkbook(AXWorkbook axWorkbook) throws IOException;


}
