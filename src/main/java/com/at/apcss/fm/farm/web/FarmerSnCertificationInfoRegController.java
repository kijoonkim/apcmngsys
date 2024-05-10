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
import com.at.apcss.fm.farm.vo.FarmerSnCertificationInfoRegVO;
import com.at.apcss.fm.farm.service.FarmerSnCertificationInfoRegService;

@Controller
public class FarmerSnCertificationInfoRegController extends BaseController{

	@Resource(name= "farmerSnCertificationInfoRegService")
	private FarmerSnCertificationInfoRegService farmerSnCertificationInfoRegService;

	//화면이동
	@RequestMapping(value = "/fm/farm/farmerSnCertificationInfoReg.do")
	public String farmerSnCertificationInfoReg() {
		return "apcss/fm/farm/farmerSnCertificationInfoReg";
	}

	// 조회
	@PostMapping(value = "/fm/farm/selectFarmerSnCertificationInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFarmerSnCertificationInfoRegList(Model model, @RequestBody FarmerSnCertificationInfoRegVO farmerSnCertificationInfoRegVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FarmerSnCertificationInfoRegVO> resultList = new ArrayList<>();
		try {
			 resultList = farmerSnCertificationInfoRegService.selectFarmerSnCertificationInfoRegList(farmerSnCertificationInfoRegVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	//등록
	@PostMapping(value = "/fm/farm/insertFarmerSnCertificationInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFarmerSnCertificationInfoReg(@RequestBody FarmerSnCertificationInfoRegVO farmerSnCertificationInfoRegVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		farmerSnCertificationInfoRegVO.setSysFrstInptUserId(getUserId());
		farmerSnCertificationInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
		farmerSnCertificationInfoRegVO.setSysLastChgUserId(getUserId());
		farmerSnCertificationInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = farmerSnCertificationInfoRegService.insertFarmerSnCertificationInfoReg(farmerSnCertificationInfoRegVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/fm/farm/deleteFarmerSnCertificationInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFarmerSnCertificationInfoReg(@RequestBody FarmerSnCertificationInfoRegVO farmerSnCertificationInfoRegVO, HttpServletRequest request) throws Exception {
		logger.debug("/fm/farm/deletefarmerSnCertificationInfoReg >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ farmerSnCertificationInfoRegService.deleteFarmerSnCertificationInfoReg(farmerSnCertificationInfoRegVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

}
