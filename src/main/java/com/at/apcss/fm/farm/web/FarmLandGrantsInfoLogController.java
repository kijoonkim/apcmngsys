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
import com.at.apcss.fm.farm.service.FarmLandGrantsInfoLogService;
import com.at.apcss.fm.farm.vo.FarmLandGrantsInfoLogVO;

@Controller
public class FarmLandGrantsInfoLogController extends BaseController{

	@Resource(name= "farmLandGrantsInfoLogService")
	private FarmLandGrantsInfoLogService farmLandGrantsInfoLogService;

	//화면이동
	@RequestMapping(value = "/fm/farm/farmLandGrantsInfoLog.do")
	public String farmLandGrantsInfoLog() {
		return "apcss/fm/farm/farmLandGrantsInfoLog";
	}

	// 조회
	@PostMapping(value = "/fm/farm/selectFarmLandGrantsInfoLogList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFarmLandGrantsInfoLogList(Model model, @RequestBody FarmLandGrantsInfoLogVO farmLandGrantsInfoLogVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FarmLandGrantsInfoLogVO> resultList = new ArrayList<>();
		try {
			 resultList = farmLandGrantsInfoLogService.selectFarmLandGrantsInfoLogList(farmLandGrantsInfoLogVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

}
