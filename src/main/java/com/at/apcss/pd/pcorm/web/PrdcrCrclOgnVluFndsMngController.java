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
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.pcorm.service.PrdcrCrclOgnVluFndsMngService;
import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluFndsMngVO;

@Controller
public class PrdcrCrclOgnVluFndsMngController extends BaseController{

	@Resource(name= "prdcrCrclOgnVluFndsMngService")
	private PrdcrCrclOgnVluFndsMngService prdcrCrclOgnVluFndsMngService;

//화면이동
	@GetMapping(value = "/pd/pcorm/PrdcrCrclOgnVluFndsMng.do")
	public String PrdcrCrclOgnVluFndsMng() {
		return "apcss/pd/pcorm/PrdcrCrclOgnVluFndsMng";
	}

// 조회
		@PostMapping(value = "/pd/pcorm/selectPrdcrCrclOgnVluFndsMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnVluFndsMngList(Model model, @RequestBody PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<PrdcrCrclOgnVluFndsMngVO> resultList = new ArrayList<>();
			try {
				 resultList = prdcrCrclOgnVluFndsMngService.selectPrdcrCrclOgnVluFndsMngList(prdcrCrclOgnVluFndsMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/pd/pcorm/insertPrdcrCrclOgnVluFndsMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertPrdcrCrclOgnVluFndsMng(@RequestBody PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			prdcrCrclOgnVluFndsMngVO.setSysFrstInptUserId(getUserId());
			prdcrCrclOgnVluFndsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			prdcrCrclOgnVluFndsMngVO.setSysLastChgUserId(getUserId());
			prdcrCrclOgnVluFndsMngVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = prdcrCrclOgnVluFndsMngService.insertPrdcrCrclOgnVluFndsMng(prdcrCrclOgnVluFndsMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/pd/pcorm/multiSavePrdcrCrclOgnVluFndsMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavePrdcrCrclOgnVluFndsMngList(@RequestBody List<PrdcrCrclOgnVluFndsMngVO> prdcrCrclOgnVluFndsMngVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO : prdcrCrclOgnVluFndsMngVOList) {
					prdcrCrclOgnVluFndsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
					prdcrCrclOgnVluFndsMngVO.setSysFrstInptUserId(getUserId());
					prdcrCrclOgnVluFndsMngVO.setSysLastChgPrgrmId(getPrgrmId());
					prdcrCrclOgnVluFndsMngVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = prdcrCrclOgnVluFndsMngService.multiSavePrdcrCrclOgnVluFndsMngList(prdcrCrclOgnVluFndsMngVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/pd/pcorm/deletePrdcrCrclOgnVluFndsMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletePrdcrCrclOgnVluFndsMng(@RequestBody PrdcrCrclOgnVluFndsMngVO prdcrCrclOgnVluFndsMngVO, HttpServletRequest request) throws Exception {
			logger.debug("/pd/pcorm/deletePrdcrCrclOgnVluFndsMng >>> 호출 >>> ");

			int result = 0;
			try {
				result += prdcrCrclOgnVluFndsMngService.deletePrdcrCrclOgnVluFndsMng(prdcrCrclOgnVluFndsMngVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

}
