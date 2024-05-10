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
import com.at.apcss.fm.farm.vo.FarmLandGrantsInfoRegVO;
import com.at.apcss.fm.farm.service.FarmLandGrantsInfoRegService;

@Controller
public class FarmLandGrantsInfoRegController extends BaseController{

	@Resource(name= "farmLandGrantsInfoRegService")
	private FarmLandGrantsInfoRegService farmLandGrantsInfoRegService;

	//화면이동
	@RequestMapping(value = "/fm/farm/farmLandGrantsInfoReg.do")
	public String farmLandGrantsInfoReg() {
		return "apcss/fm/farm/farmLandGrantsInfoReg";
	}

	// 조회
	@PostMapping(value = "/fm/farm/selectFarmLandGrantsInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFarmLandGrantsInfoRegList(Model model, @RequestBody FarmLandGrantsInfoRegVO FarmLandGrantsInfoRegVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FarmLandGrantsInfoRegVO> resultList = new ArrayList<>();
		try {
			 resultList = farmLandGrantsInfoRegService.selectFarmLandGrantsInfoRegList(FarmLandGrantsInfoRegVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	//등록
	@PostMapping(value = "/fm/farm/insertFarmLandGrantsInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFarmLandGrantsInfoReg(@RequestBody FarmLandGrantsInfoRegVO FarmLandGrantsInfoRegVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		FarmLandGrantsInfoRegVO.setSysFrstInptUserId(getUserId());
		FarmLandGrantsInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
		FarmLandGrantsInfoRegVO.setSysLastChgUserId(getUserId());
		FarmLandGrantsInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = farmLandGrantsInfoRegService.insertFarmLandGrantsInfoReg(FarmLandGrantsInfoRegVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/fm/farm/deleteFarmLandGrantsInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFarmLandGrantsInfoReg(@RequestBody FarmLandGrantsInfoRegVO FarmLandGrantsInfoRegVO, HttpServletRequest request) throws Exception {
		logger.debug("/fm/farm/deleteFarmLandGrantsInfoReg >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ farmLandGrantsInfoRegService.deleteFarmLandGrantsInfoReg(FarmLandGrantsInfoRegVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}
}
