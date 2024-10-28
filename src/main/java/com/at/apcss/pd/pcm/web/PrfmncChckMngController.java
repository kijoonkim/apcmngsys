package com.at.apcss.pd.pcm.web;

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
import com.at.apcss.pd.pcm.service.PrfmncChckMngService;
import com.at.apcss.pd.pcm.vo.PrfmncChckMngVO;

@Controller
public class PrfmncChckMngController extends BaseController{

	@Resource(name= "PrfmncChckMngService")
	private PrfmncChckMngService PrfmncChckMngService;

	//화면이동
	@RequestMapping(value = "/pd/pcm/PrfmncChckMng.do")
	public String PrfmncChckMng() {
		return "apcss/pd/pcm/PrfmncChckMng";
	}

	// 승인형 조직 조회
	@PostMapping(value = "/pd/pcm/selectUoAprv.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUoAprv(Model model, @RequestBody PrfmncChckMngVO PrfmncChckMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		PrfmncChckMngVO result = new PrfmncChckMngVO();
		try {
			result = PrfmncChckMngService.selectUoAprv(PrfmncChckMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, result);
		return getSuccessResponseEntity(resultMap);
	}


	// 승인형 조직 리스트 조회
	@PostMapping(value = "/pd/pcm/selectUoAprvList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUoAprvList(Model model, @RequestBody PrfmncChckMngVO PrfmncChckMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrfmncChckMngVO> resultList = new ArrayList<>();
		try {
			resultList = PrfmncChckMngService.selectUoAprvList(PrfmncChckMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 조회
	@PostMapping(value = "/pd/pcm/selectPrfmncChckMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrfmncChckMngList(Model model, @RequestBody PrfmncChckMngVO PrfmncChckMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrfmncChckMngVO> resultList = new ArrayList<>();
		try {
			resultList = PrfmncChckMngService.selectPrfmncChckMngList(PrfmncChckMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/pcm/multiSavePrfmncChckMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSavePrfmncChckMngList(@RequestBody List<PrfmncChckMngVO> prfmncChckMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (PrfmncChckMngVO prfmncChckMngVO : prfmncChckMngVOList) {
				prfmncChckMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				prfmncChckMngVO.setSysFrstInptUserId(getUserId());
				prfmncChckMngVO.setSysLastChgPrgrmId(getPrgrmId());
				prfmncChckMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = PrfmncChckMngService.multiSavePrfmncChckMngList(prfmncChckMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

}
