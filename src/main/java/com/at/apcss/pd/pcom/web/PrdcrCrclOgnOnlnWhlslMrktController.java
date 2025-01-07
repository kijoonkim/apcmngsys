package com.at.apcss.pd.pcom.web;

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
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnOnlnWhlslMrktService;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnOnlnWhlslMrktVO;

@Controller
public class PrdcrCrclOgnOnlnWhlslMrktController extends BaseController{

	@Resource(name= "PrdcrCrclOgnOnlnWhlslMrktService")
	private PrdcrCrclOgnOnlnWhlslMrktService PrdcrCrclOgnOnlnWhlslMrktService;

	//화면이동
	@RequestMapping(value = "/pd/pcom/PrdcrCrclOgnOnlnWhlslMrkt.do")
	public String PrdcrCrclOgnOnlnWhlslMrkt() {
		return "apcss/pd/pcom/PrdcrCrclOgnOnlnWhlslMrkt";
	}

	//온라인도매시장 판매목표 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnOnlnWhlslMrkt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnOnlnWhlslMrktUoList(Model model, @RequestBody PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO, HttpServletRequest request) throws Exception{
		logger.debug("/pd/aom/selectPrdcrCrclOgnOnlnWhlslMrktUoList.do >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		PrdcrCrclOgnOnlnWhlslMrktVO result = new PrdcrCrclOgnOnlnWhlslMrktVO();
		try {
			 result = PrdcrCrclOgnOnlnWhlslMrktService.selectPrdcrCrclOgnOnlnWhlslMrkt(PrdcrCrclOgnOnlnWhlslMrktVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_MAP, result);
		return getSuccessResponseEntity(resultMap);
	}

	// 조직 리스트 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnOnlnWhlslMrktUoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnOnlnWhlslMrktList(Model model, @RequestBody PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO, HttpServletRequest request) throws Exception{
		logger.debug("/pd/aom/selectPrdcrCrclOgnOnlnWhlslMrktList.do >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnOnlnWhlslMrktVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrCrclOgnOnlnWhlslMrktService.selectPrdcrCrclOgnOnlnWhlslMrktUoList(PrdcrCrclOgnOnlnWhlslMrktVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	//온라인도매시장 판매목표 저장
	@PostMapping(value = "/pd/pcom/insertPrdcrCrclOgnOnlnWhlslMrkt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updatePrfmncCorpDdlnYn(@RequestBody PrdcrCrclOgnOnlnWhlslMrktVO PrdcrCrclOgnOnlnWhlslMrktVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/aom/updatePrfmncCorpDdlnYn.do >>> 호출 >>> ");

		PrdcrCrclOgnOnlnWhlslMrktVO.setSysFrstInptPrgrmId(getPrgrmId());
		PrdcrCrclOgnOnlnWhlslMrktVO.setSysFrstInptUserId(getUserId());
		PrdcrCrclOgnOnlnWhlslMrktVO.setSysLastChgPrgrmId(getPrgrmId());
		PrdcrCrclOgnOnlnWhlslMrktVO.setSysLastChgUserId(getUserId());

		int result = 0;

		try {
			result = PrdcrCrclOgnOnlnWhlslMrktService.insertPrdcrCrclOgnOnlnWhlslMrkt(PrdcrCrclOgnOnlnWhlslMrktVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

}
