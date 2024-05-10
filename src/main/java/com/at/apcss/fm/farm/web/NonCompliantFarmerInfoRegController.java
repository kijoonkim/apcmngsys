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
import com.at.apcss.fm.farm.vo.NonCompliantFarmerInfoRegVO;
import com.at.apcss.fm.farm.service.NonCompliantFarmerInfoRegService;

@Controller
public class NonCompliantFarmerInfoRegController extends BaseController{

	@Resource(name= "NonCompliantFarmerInfoRegService")
	private NonCompliantFarmerInfoRegService nonCompliantFarmerInfoRegService;

	//화면이동
	@RequestMapping(value = "/fm/farm/NonCompliantFarmerInfoReg.do")
	public String NonCompliantFarmerInfoReg() {
		return "apcss/fm/farm/NonCompliantFarmerInfoReg";
	}

	// 조회
	@PostMapping(value = "/fm/farm/selectNonCompliantFarmerInfoRegList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectNonCompliantFarmerInfoRegList(Model model, @RequestBody NonCompliantFarmerInfoRegVO NonCompliantFarmerInfoRegVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<NonCompliantFarmerInfoRegVO> resultList = new ArrayList<>();
		try {
			 resultList = nonCompliantFarmerInfoRegService.selectNonCompliantFarmerInfoRegList(NonCompliantFarmerInfoRegVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	//등록
	@PostMapping(value = "/fm/farm/insertNonCompliantFarmerInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertNonCompliantFarmerInfoReg(@RequestBody NonCompliantFarmerInfoRegVO NonCompliantFarmerInfoRegVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		NonCompliantFarmerInfoRegVO.setSysFrstInptUserId(getUserId());
		NonCompliantFarmerInfoRegVO.setSysFrstInptPrgrmId(getPrgrmId());
		NonCompliantFarmerInfoRegVO.setSysLastChgUserId(getUserId());
		NonCompliantFarmerInfoRegVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = nonCompliantFarmerInfoRegService.insertNonCompliantFarmerInfoReg(NonCompliantFarmerInfoRegVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/fm/farm/deleteNonCompliantFarmerInfoReg.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteNonCompliantFarmerInfoReg(@RequestBody NonCompliantFarmerInfoRegVO NonCompliantFarmerInfoRegVO, HttpServletRequest request) throws Exception {
		logger.debug("/fm/farm/deleteNonCompliantFarmerInfoReg >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ nonCompliantFarmerInfoRegService.deleteNonCompliantFarmerInfoReg(NonCompliantFarmerInfoRegVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

}
