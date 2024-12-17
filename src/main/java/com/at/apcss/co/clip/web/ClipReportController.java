package com.at.apcss.co.clip.web;

import com.at.apcss.am.anls.service.AnlsCrtrService;
import com.at.apcss.co.clip.service.ClipReportService;
import com.at.apcss.co.clip.vo.ClipReportVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.menu.vo.ComUiJsonVO;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.util.ComUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.springframework.beans.BeanUtils;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Controller
public class ClipReportController extends BaseController {

    @Resource(name = "clipReportService")
    private ClipReportService clipReportService;

    @PostMapping(value="/report/exportPdfForJson.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> exportPdfForJsonToServer(
            @RequestBody Map<String, Object> params,
            HttpServletRequest request
    ) throws Exception {

        logger.debug("test start");
        request.getHeader("JSESSIONID");

        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        Map<String, String> dataParam = new HashMap<>();
        logger.debug("1");
        Set<String> keySet = params.keySet();
        for ( String key : keySet ) {
            String value = (String)params.getOrDefault(key, ComConstants.CON_BLANK);
            dataParam.put(key, value);
            //logger.debug("key {},  value  {}", key, value);
        }
        logger.debug("2");
        String reportURL = getReportUrl() + ComConstants.REPORT_JSP_EXPORT_PDF_JSON;
        logger.debug("3");
        String filename = (String)params.get("pdfFileName");
        logger.debug("4");
        String jsessionId = request.getSession().getId();
        //String jsessionId = request.getSession().getAttribute("JSESSIONID").toString();
        logger.debug("5");
        logger.debug("filename {}", filename);
        logger.debug("jsessionId {}", jsessionId);

        /*
        model.addAttribute("reportDbName", getReportDbName());
        model.addAttribute("reportUrl", getReportUrl());
        model.addAttribute("reportType", getReportType());
        model.addAttribute("reportPath", getReportPath());
         */

        try {
            Connection.Response reportResponse = Jsoup.connect(reportURL)
                    .timeout(10000)
                    .header("Origin", reportURL)
                    .header("Referer", reportURL)
                    .header("Accept", "application/json, text/javascript, */*; q=0.01")
                    .header("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8")
                    .header("Accept-Encoding", "gzip, deflate, br")
                    .header("Accept-Language", "ko-KR,ko;q=0.8,en-US;q=0.6,en;q=0.4")
                    .header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36")
                    .cookie("JSESSIONID", jsessionId)
                    .followRedirects(true)
                    .ignoreContentType(true)
                    .data(dataParam)
                    .method(Connection.Method.POST)
                    .execute();


            String rootPath = getFilepathRoot() + "report/";
            String str = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd"));
            String folderPath = str.replace("/", File.separator);
            //make folder ==================
            File uploadPathFolder = new File(rootPath, folderPath);
            logger.debug("6");
            logger.debug("getAbsolutePath {}", uploadPathFolder.getAbsolutePath());
            logger.debug("uploadPathFolder {}", uploadPathFolder.getPath());
            if (!uploadPathFolder.exists()) {
                boolean successMkdirs = uploadPathFolder.mkdirs();
                if (!successMkdirs) {
                    return getErrorResponseEntity(ComConstants.MSGCD_ERR_CUSTOM, "디렉토리생성오류");
                }
            }
            logger.debug("7");

            String saveName = rootPath + File.separator + folderPath + File.separator + filename;

            //File file = new File(folderPath, filename);
            File file = new File(saveName);

            logger.debug("file getAbsolutePath {}", file.getAbsolutePath());
            logger.debug("file getPath {}", file.getPath());
            if (!file.exists()) {
                boolean successNewFile = file.createNewFile();
                if (!successNewFile) {
                    return getErrorResponseEntity(ComConstants.MSGCD_ERR_CUSTOM, "파일생성오류");
                }
            }
            logger.debug("8");
            BufferedInputStream inputStream = reportResponse.bodyStream();
            FileOutputStream fos = new FileOutputStream(file);
            byte[] buffer = new byte[1024];
            int len;
            while ((len = inputStream.read(buffer)) != -1) {
                fos.write(buffer, 0, len);
            }
            inputStream.close();
            fos.close();

            // 파일저장완료



        } catch( Exception e) {
            getErrorResponseEntity(e);
        }

        return getSuccessResponseEntity(resultMap);
    }

    @PostMapping(value="/report/sendMailForPdfByJson.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> sendMailForPdfByJson(
            @RequestBody Map<String, Object> params,
            HttpServletRequest request
    ) throws Exception {

        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {

            ClipReportVO clipReportVO = new ClipReportVO();
            clipReportVO.setReportUrl(getReportUrl());
            clipReportVO.setFilePathRoot(getFilepathRoot());

            HashMap<String, Object> rtnObj;
            String serverType = getServerType();
            if (ComConstants.SERVER_TYPE_PRD.equals(serverType)) {
                rtnObj = clipReportService.sendEmsMailForPdfByJson(params, request, clipReportVO);
            } else {
                rtnObj = clipReportService.sendMailForPdfByJson(params, request, clipReportVO);
            }

            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch (Exception e) {
            return getErrorResponseEntity(e);
        } finally {
            setMenuComLog(request);
        }

        return getSuccessResponseEntity(resultMap);
    }
}
