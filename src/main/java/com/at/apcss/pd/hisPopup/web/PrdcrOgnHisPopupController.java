package com.at.apcss.pd.hisPopup.web;

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
import com.at.apcss.pd.hisPopup.service.PrdcrOgnHisPopupService;
import com.at.apcss.pd.hisPopup.vo.CltvtnLandVO;
import com.at.apcss.pd.hisPopup.vo.OgnzVO;
import com.at.apcss.pd.hisPopup.vo.PrdcrOgnzVO;

@Controller
public class PrdcrOgnHisPopupController extends BaseController{

	@Resource(name= "PrdcrOgnHisPopupService")
	private PrdcrOgnHisPopupService PrdcrOgnHisPopupService;

	//화면이동
	@RequestMapping(value = "/pd/hisPopup/PrdcrOgnHisPopup.do")
	public String PrdcrOgnHisPopup() {
		return "apcss/pd/hisPopup/PrdcrOgnHisPopup";
	}

	//변경된 사업자번호 조회
	@PostMapping(value = "/pd/hisPopup/selectHisBrnoMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisBrnoMngList(Model model, @RequestBody OgnzVO OgnzVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<OgnzVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrOgnHisPopupService.selectHisBrnoMngList(OgnzVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//변경된 사업자번호 조회
	@PostMapping(value = "/pd/hisPopup/selectHisBrnoInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectBrnoInfo(Model model, @RequestBody OgnzVO OgnzVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		OgnzVO brnoInfo = new OgnzVO();
		List<OgnzVO> resultList = new ArrayList<>();
		try {
			brnoInfo = PrdcrOgnHisPopupService.selectHisBrnoInfo(OgnzVO);
			if(brnoInfo != null) {
				if("1".equals(brnoInfo.getApoSe())) {
					resultList = PrdcrOgnHisPopupService.selectHisBrnoList(OgnzVO);
					//하위 조직 이 존재 하는 경우만
					if(resultList != null && resultList.size() > 1) {
						resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
					}
				}else if("2".equals(brnoInfo.getApoSe())) {
					resultList = PrdcrOgnHisPopupService.selectHisUoList(OgnzVO);
					if(resultList != null) {
						resultMap.put("uoList", resultList);
					}
				}
			}
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put("brnoInfo", brnoInfo);
		return getSuccessResponseEntity(resultMap);
	}

	//변경된 사업자번호 조회
	@PostMapping(value = "/pd/hisPopup/selectHisUoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisUoList(Model model, @RequestBody OgnzVO OgnzVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<OgnzVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrOgnHisPopupService.selectHisUoList(OgnzVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//생산자조직 2024년 조회
	@PostMapping(value = "/pd/hisPopup/selectHisPrdcrOgnz2024.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisPrdcrOgnz2024(Model model, @RequestBody PrdcrOgnzVO PrdcrOgnzVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrOgnzVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrOgnHisPopupService.selectHisPrdcrOgnz2024(PrdcrOgnzVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//농가 2024년 조회
	@PostMapping(value = "/pd/hisPopup/selectHisCltvtnLand2024.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisCltvtnLand2024(Model model, @RequestBody CltvtnLandVO CltvtnLandVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<CltvtnLandVO> resultList = new ArrayList<>();
		try {
			resultList = PrdcrOgnHisPopupService.selectHisCltvtnLand2024(CltvtnLandVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//생산자조직 2025년 조회
	@PostMapping(value = "/pd/hisPopup/selectHisPrdcrOgnz2025.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisPrdcrOgnz2025(Model model, @RequestBody PrdcrOgnzVO PrdcrOgnzVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrOgnzVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrOgnHisPopupService.selectHisPrdcrOgnz2025(PrdcrOgnzVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//농가 2025년 조회
	@PostMapping(value = "/pd/hisPopup/selectHisCltvtnLand2025.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectHisCltvtnLand2025(Model model, @RequestBody CltvtnLandVO CltvtnLandVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<CltvtnLandVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrOgnHisPopupService.selectHisCltvtnLand2025(CltvtnLandVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}
}
