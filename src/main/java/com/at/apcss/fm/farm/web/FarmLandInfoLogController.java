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
import com.at.apcss.fm.farm.service.FarmLandInfoLogService;
import com.at.apcss.fm.farm.vo.FarmLandInfoLogVO;


@Controller
public class FarmLandInfoLogController extends BaseController{

	@Resource(name= "farmLandInfoLogService")
	private FarmLandInfoLogService farmLandInfoLogService;

	//화면이동
	@RequestMapping(value = "/fm/farm/farmLandInfoLog.do")
	public String farmLandInfoLog() {
		return "apcss/fm/farm/farmLandInfoLog";
	}

	// 조회
	@PostMapping(value = "/fm/farm/selectFarmLandInfoLogList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFarmLandInfoLogList(Model model, @RequestBody FarmLandInfoLogVO farmLandInfoLogVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FarmLandInfoLogVO> resultList = new ArrayList<>();
		try {
			 resultList = farmLandInfoLogService.selectFarmLandInfoLogList(farmLandInfoLogVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


}
