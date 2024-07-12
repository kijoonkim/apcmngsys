package com.at.apcss.fm.farm.web;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.farm.service.FarmerSnCertificationInfoService;
import com.at.apcss.fm.farm.vo.FarmerSnCertificationInfoVO;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


@RestController
public class FarmerSnCertificationInfoApiController extends BaseController{

	@Resource(name= "farmerSnCertificationInfoService")
	private FarmerSnCertificationInfoService farmerSnCertificationInfoService;

	// 조회
	@PostMapping(value = "api/mobile/fm/farm/selectFarmerSnCertificationInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectfarmerSnCertificationInfoList(Model model, @RequestBody FarmerSnCertificationInfoVO farmerSnCertificationInfoVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FarmerSnCertificationInfoVO> resultList = new ArrayList<>();
		try {
			 resultList = farmerSnCertificationInfoService.selectFarmerSnCertificationInfoList(farmerSnCertificationInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

}
