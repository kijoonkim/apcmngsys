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
import com.at.apcss.fm.farm.service.FarmerGrantsInfoLogService;
import com.at.apcss.fm.farm.vo.FarmerGrantsInfoLogVO;


@Controller
public class FarmerGrantsInfoLogController extends BaseController{

	@Resource(name= "farmerGrantsInfoLogService")
	private FarmerGrantsInfoLogService farmerGrantsInfoLogService;

	//화면이동
	@RequestMapping(value = "/fm/farm/farmerGrantsInfoLog.do")
	public String farmerGrantsInfoLog() {
		return "apcss/fm/farm/farmerGrantsInfoLog";
	}

	// 조회
	@PostMapping(value = "/fm/farm/selectFarmerGrantsInfoLogList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFarmerGrantsInfoLogList(Model model, @RequestBody FarmerGrantsInfoLogVO farmerGrantsInfoLogVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FarmerGrantsInfoLogVO> resultList = new ArrayList<>();
		try {
			 resultList = farmerGrantsInfoLogService.selectFarmerGrantsInfoLogList(farmerGrantsInfoLogVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

}
