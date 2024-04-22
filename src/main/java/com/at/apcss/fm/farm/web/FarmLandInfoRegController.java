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
import com.at.apcss.fm.farm.vo.FarmLandInfoRegVO;
import com.at.apcss.fm.farm.service.FarmLandInfoRegService;

@Controller
public class FarmLandInfoRegController extends BaseController{

	@Resource(name= "farmLandInfoRegService")
	private FarmLandInfoRegService farmLandInfoRegService;

	//화면이동
	@RequestMapping(value = "/fm/farm/farmLandInfoReg.do")
	public String farmLandInfoReg() {
		return "apcss/fm/farm/farmLandInfoReg";
	}

	// 조회
	@PostMapping(value = "/fm/farm/selectFarmLandInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFarmLandInfoRegList(Model model, @RequestBody FarmLandInfoRegVO farmLandInfoRegVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FarmLandInfoRegVO> resultList = new ArrayList<>();
		try {
			 resultList = farmLandInfoRegService.selectFarmLandInfoRegList(farmLandInfoRegVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	//등록
	@PostMapping(value = "/fm/farm/insertFarmLandInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFarmLandInfoReg(@RequestBody FarmLandInfoRegVO farmLandInfoRegVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		farmLandInfoRegVO.setSysFrstInptUserId(getUserId());
		farmLandInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
		farmLandInfoRegVO.setSysLastChgUserId(getUserId());
		farmLandInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = farmLandInfoRegService.insertFarmLandInfoReg(farmLandInfoRegVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/fm/farm/deleteFarmLandInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFarmLandInfoReg(@RequestBody FarmLandInfoRegVO farmLandInfoRegVO, HttpServletRequest request) throws Exception {
		logger.debug("/fm/farm/deletefarmLandInfoReg >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ farmLandInfoRegService.deleteFarmLandInfoReg(farmLandInfoRegVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

}
