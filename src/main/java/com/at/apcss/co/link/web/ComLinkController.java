package com.at.apcss.co.link.web;

import com.at.apcma.com.service.ApcMaComService;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.link.service.ComLinkService;
import com.at.apcss.co.link.vo.ComLnkgRptVO;
import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.menu.vo.ComUiJsonVO;
import com.at.apcss.co.menu.vo.ComUiVO;
import com.at.apcss.co.sys.controller.BaseController;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class ComLinkController extends BaseController {


    @Resource(name = "apcMaComService")
    private ApcMaComService apcMaComService;

    @Resource(name = "comLinkService")
    private ComLinkService comLinkService;



    @GetMapping(value = "/pageLink.do/{uuid}")
    public String pageLink(Model model, @PathVariable String uuid, HttpServletRequest request) throws Exception {

        if (!StringUtils.hasText(uuid)) {
            model.addAttribute("errorMessage", "식별ID가 없습니다.");
            return "frame/error/accessError";
        }

        return null;
    }


    @GetMapping(value = "/viewReport.do/{uuid}")
    public String viewReport(Model model, @PathVariable String uuid, HttpServletRequest request) throws Exception {

        if (!StringUtils.hasText(uuid)) {
            model.addAttribute("errorMessage", "식별ID가 없습니다.");
            return "frame/error/accessError";
        }

        ComMenuVO pageVO = new ComMenuVO();
        ComUiJsonVO comUiJsonVO = new ComUiJsonVO();
        ObjectMapper objMapper = new ObjectMapper();
        String jsonString = objMapper.writeValueAsString(comUiJsonVO);

        model.addAttribute("comUiJson", jsonString);
        model.addAttribute("comMenuVO", pageVO);

        model.addAttribute("reportDbName", getReportDbName());
        model.addAttribute("reportUrl", getReportUrl());
        model.addAttribute("reportType", getReportType());
        model.addAttribute("reportPath", getReportPath());


        model.addAttribute("uuid", uuid);

        request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, "viewReport");

        ComLnkgRptVO resultVO = comLinkService.selectComLnkgRpt(uuid);

        if (resultVO == null || !StringUtils.hasText(resultVO.getLnkgUnqId())) {
            model.addAttribute("errorMessage", "보고서정보가 없습니다.");
            return "frame/error/accessError";
        }

        model.addAttribute("certYn", "N");
        if (StringUtils.hasText(resultVO.getLnkgCertKey())) {
            model.addAttribute("certYn", "Y");
        }

        String pageUrl = "";

        return "clipreport/reportView";
    }

    @PostMapping(value = "/link/selectLnkgData", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectLnkgData(
            @RequestBody ComLnkgRptVO comLnkgRptVO,
            Model model,
            HttpSession session,
            HttpServletRequest request) throws Exception {

        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        ComLnkgRptVO resultVO = new ComLnkgRptVO();

        try {
            resultVO = comLinkService.selectComLnkgRpt(comLnkgRptVO);

            if (resultVO == null || !StringUtils.hasText(resultVO.getLnkgUnqId())) {
                return getErrorResponseEntity(ComConstants.MSGCD_NOT_FOUND, "보고서정보");
            }

            if (StringUtils.hasText(resultVO.getLnkgCertKey())) {
                if (!resultVO.getLnkgCertKey().equals(comLnkgRptVO.getLnkgCertKey())) {
                    return getErrorResponseEntity(ComConstants.MSGCD_NOT_EQUAL, "보고서인증번호||입력인증번호");
                }
            }

        } catch (Exception e) {
            return getErrorResponseEntity(e);
        }

        resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

        return getSuccessResponseEntity(resultMap);

    }


    @PostMapping(value = "/link/selectReportData/{serviceName}", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectReportData(
            @PathVariable String serviceName,
            @RequestBody Map<String, Object> param,
            Model model,
            HttpSession session,
            HttpServletRequest request) throws Exception {

        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            resultMap = apcMaComService.processForListData(param, session, request, "", serviceName);
            return getSuccessResponseEntityMa(resultMap);
        } catch (Exception e) {
            return getErrorResponseEntity(e);
        }

    }


}
