package com.at.apcss.fm.farm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.farm.service.NonCompliantFarmerInfoLogService;
import com.at.apcss.fm.farm.vo.NonCompliantFarmerInfoLogVO;

@Controller
public class NonCompliantFarmerInfoLogController extends BaseController{

	@Resource(name= "NonCompliantFarmerInfoLogService")
	private NonCompliantFarmerInfoLogService nonCompliantFarmerInfoLogService;

	//화면이동
	@RequestMapping(value = "/fm/farm/NonCompliantFarmerInfoLog.do")
	public String NonCompliantFarmerInfoLog() {
		return "apcss/fm/farm/NonCompliantFarmerInfoLog";
	}

	// 조회
	@PostMapping(value = "/fm/farm/selectNonCompliantFarmerInfoLogList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectNonCompliantFarmerInfoLogList(Model model, @RequestBody NonCompliantFarmerInfoLogVO NonCompliantFarmerInfoLogVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<NonCompliantFarmerInfoLogVO> resultList = new ArrayList<>();
		try {
			 resultList = nonCompliantFarmerInfoLogService.selectNonCompliantFarmerInfoLogList(NonCompliantFarmerInfoLogVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

}
