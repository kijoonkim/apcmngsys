package com.at.apcss.pd.sprt.web;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.sprt.service.SprtBizRsltInqService;
import com.at.apcss.pd.sprt.vo.SprtBizRsltInqVO;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class SprtBizRsltInqController extends BaseController {

    @Resource(name= "sprtBizRsltInqService")
    private SprtBizRsltInqService sprtBizRsltInqService;

	@RequestMapping(value = "/pd/sprt/SprtBizRsltInq.do")
	public String SprtBizRsltInq() {
		return "apcss/pd/sprt/SprtBizRsltInq";
	}

    // 조회
	@PostMapping(value = "/pd/sprt/selectSprtBizRsltInqList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSprtBizRsltInqList(Model model, @RequestBody SprtBizRsltInqVO sprtBizRsltInqVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SprtBizRsltInqVO> resultList = new ArrayList<>();
		try {
			 resultList = sprtBizRsltInqService.selectSprtBizRsltInqList(sprtBizRsltInqVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/sprt/selectSprtBizRsltInqSeCd.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSprtBizRsltInqSeCd(Model model, @RequestBody SprtBizRsltInqVO sprtBizRsltInqVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SprtBizRsltInqVO> resultList = new ArrayList<>();
		try {
			resultList = sprtBizRsltInqService.selectSprtBizRsltInqSeCd(sprtBizRsltInqVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/sprt/selectComCorpBzmn.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComCorpBzmn(Model model, @RequestBody SprtBizRsltInqVO sprtBizRsltInqVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SprtBizRsltInqVO> resultList = new ArrayList<>();
		try {
			resultList = sprtBizRsltInqService.selectComCorpBzmn(sprtBizRsltInqVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/sprt/selectComCorp.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComCorp(Model model, @RequestBody SprtBizRsltInqVO sprtBizRsltInqVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SprtBizRsltInqVO> resultList = new ArrayList<>();
		try {
			resultList = sprtBizRsltInqService.selectComCorp(sprtBizRsltInqVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/pd/sprt/insertSprtBizRsltInqList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insetSprtBizRsltInqList(@RequestBody List<SprtBizRsltInqVO> sprtBizRsltInqVOList, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;

		try {
			for (SprtBizRsltInqVO sprtBizRsltInqVO : sprtBizRsltInqVOList) {
				sprtBizRsltInqVO.setSysFrstInptPrgrmId(getPrgrmId());
				sprtBizRsltInqVO.setSysFrstInptUserId(getUserId());
				sprtBizRsltInqVO.setSysLastChgPrgrmId(getPrgrmId());
				sprtBizRsltInqVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = sprtBizRsltInqService.insertSprtBizRsltInqList(sprtBizRsltInqVOList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

}