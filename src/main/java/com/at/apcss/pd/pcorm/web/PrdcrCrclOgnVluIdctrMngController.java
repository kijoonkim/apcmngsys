package com.at.apcss.pd.pcorm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.pcorm.service.PrdcrCrclOgnVluIdctrMngService;
import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluIdctrMngVO;

@Controller
public class PrdcrCrclOgnVluIdctrMngController extends BaseController{

	@Resource(name= "prdcrCrclOgnVluIdctrMngService")
	private PrdcrCrclOgnVluIdctrMngService prdcrCrclOgnVluIdctrMngService;

	//화면이동
	@GetMapping(value = "/pd/pcorm/PrdcrCrclOgnVluIdctrMng.do")
	public String PrdcrCrclOgnVluIdctrMng() {
		return "apcss/pd/pcorm/PrdcrCrclOgnVluIdctrMng";
	}

	//통합조직 등록결과 리스트 조회
	@PostMapping(value = "/pd/pcorm/selectUoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUoList(Model model, @RequestBody PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluIdctrMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnVluIdctrMngService.selectUoList(prdcrCrclOgnVluIdctrMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//통합조직 총괄 조회
	@PostMapping(value = "/pd/pcorm/selectUoTotList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUoTotList(Model model, @RequestBody PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluIdctrMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnVluIdctrMngService.selectUoTotList(prdcrCrclOgnVluIdctrMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//출자출하조직 등록결과 리스트 조회
	@PostMapping(value = "/pd/pcorm/selectIsoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectIsoList(Model model, @RequestBody PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluIdctrMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnVluIdctrMngService.selectIsoList(prdcrCrclOgnVluIdctrMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//출자출하조직 등록결과 리스트 조회
	@PostMapping(value = "/pd/pcorm/selectIsoTotList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectIsoTotList(Model model, @RequestBody PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluIdctrMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnVluIdctrMngService.selectIsoTotList(prdcrCrclOgnVluIdctrMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//생산자조직 등록결과 리스트 조회
	@PostMapping(value = "/pd/pcorm/selectFrmhsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFrmhsList(Model model, @RequestBody PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnVluIdctrMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnVluIdctrMngService.selectFrmhsList(prdcrCrclOgnVluIdctrMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


}
