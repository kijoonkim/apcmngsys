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
import com.at.apcss.fm.farm.vo.FarmerEducationInfoRegVO;
import com.at.apcss.fm.farm.service.FarmerEducationInfoRegService;

@Controller
public class FarmerEducationInfoRegController extends BaseController{

	@Resource(name= "farmerEducationInfoRegService")
	private FarmerEducationInfoRegService farmerEducationInfoRegService;

	//화면이동
	@RequestMapping(value = "/fm/farm/farmerEducationInfoReg.do")
	public String farmerEducationInfoReg() {
		return "apcss/fm/farm/farmerEducationInfoReg";
	}

	// 조회
	@PostMapping(value = "/fm/farm/selectFarmerEducationInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFarmerEducationInfoRegList(Model model, @RequestBody FarmerEducationInfoRegVO farmerEducationInfoRegVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FarmerEducationInfoRegVO> resultList = new ArrayList<>();
		try {
			 resultList = farmerEducationInfoRegService.selectFarmerEducationInfoRegList(farmerEducationInfoRegVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	//등록
	@PostMapping(value = "/fm/farm/insertFarmerEducationInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFarmerEducationInfoReg(@RequestBody FarmerEducationInfoRegVO farmerEducationInfoRegVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		farmerEducationInfoRegVO.setSysFrstInptUserId(getUserId());
		farmerEducationInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
		farmerEducationInfoRegVO.setSysLastChgUserId(getUserId());
		farmerEducationInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = farmerEducationInfoRegService.insertFarmerEducationInfoReg(farmerEducationInfoRegVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/fm/farm/deleteFarmerEducationInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFarmerEducationInfoReg(@RequestBody FarmerEducationInfoRegVO farmerEducationInfoRegVO, HttpServletRequest request) throws Exception {
		logger.debug("/fm/farm/deletefarmerEducationInfoReg >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ farmerEducationInfoRegService.deleteFarmerEducationInfoReg(farmerEducationInfoRegVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

}
