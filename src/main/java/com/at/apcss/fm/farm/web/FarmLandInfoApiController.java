package com.at.apcss.fm.farm.web;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.farm.service.FarmLandInfoService;
import com.at.apcss.fm.farm.vo.FarmLandInfoVO;


@Controller
public class FarmLandInfoApiController extends BaseController{

    @Resource(name= "farmLandInfoService")
    private FarmLandInfoService farmLandInfoService;

    // 조회
    @PostMapping(value = "/api/mobile/fm/farm/selectFarmLandInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectfarmLandInfoList(Model model, @RequestBody FarmLandInfoVO farmLandInfoVO, HttpServletRequest request) throws Exception{
        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        List<FarmLandInfoVO> resultList = new ArrayList<>();
        try {
            resultList = farmLandInfoService.selectFarmLandInfoList(farmLandInfoVO);
        } catch (Exception e) {
            logger.debug(e.getMessage());
            return getErrorResponseEntity(e);
        }
        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
        return getSuccessResponseEntity(resultMap);
    }
}
