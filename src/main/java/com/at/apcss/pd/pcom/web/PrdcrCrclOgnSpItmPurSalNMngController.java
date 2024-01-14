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
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnSpItmPurSalNMngService;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnSpItmPurSalNMngVO;

@Controller
public class PrdcrCrclOgnSpItmPurSalNMngController extends BaseController{

	@Resource(name= "PrdcrCrclOgnSpItmPurSalNMngService")
	private PrdcrCrclOgnSpItmPurSalNMngService PrdcrCrclOgnSpItmPurSalNMngService;

//화면이동
	@RequestMapping(value = "/pd/pcom/PrdcrCrclOgnSpItmPurSalNMng.do")
	public String PrdcrCrclOgnSpItmPurSalNMng() {
		return "apcss/pd/pcom/PrdcrCrclOgnSpItmPurSalNMng";
	}

// 조회
		@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnSpItmPurSalNMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnSpItmPurSalNMngList(Model model, @RequestBody PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<PrdcrCrclOgnSpItmPurSalNMngVO> resultList = new ArrayList<>();
			try {
				 resultList = PrdcrCrclOgnSpItmPurSalNMngService.selectPrdcrCrclOgnSpItmPurSalNMngList(PrdcrCrclOgnSpItmPurSalNMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/pd/pcom/insertPrdcrCrclOgnSpItmPurSalNMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertPrdcrCrclOgnSpItmPurSalNMng(@RequestBody PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			PrdcrCrclOgnSpItmPurSalNMngVO.setSysFrstInptUserId(getUserId());
			PrdcrCrclOgnSpItmPurSalNMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			PrdcrCrclOgnSpItmPurSalNMngVO.setSysLastChgUserId(getUserId());
			PrdcrCrclOgnSpItmPurSalNMngVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = PrdcrCrclOgnSpItmPurSalNMngService.insertPrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/pd/pcom/multiSavePrdcrCrclOgnSpItmPurSalNMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavePrdcrCrclOgnSpItmPurSalNMngList(@RequestBody List<PrdcrCrclOgnSpItmPurSalNMngVO> PrdcrCrclOgnSpItmPurSalNMngVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO : PrdcrCrclOgnSpItmPurSalNMngVOList) {
					PrdcrCrclOgnSpItmPurSalNMngVO.setSysFrstInptPrgrmId(getPrgrmId());
					PrdcrCrclOgnSpItmPurSalNMngVO.setSysFrstInptUserId(getUserId());
					PrdcrCrclOgnSpItmPurSalNMngVO.setSysLastChgPrgrmId(getPrgrmId());
					PrdcrCrclOgnSpItmPurSalNMngVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = PrdcrCrclOgnSpItmPurSalNMngService.multiSavePrdcrCrclOgnSpItmPurSalNMngList(PrdcrCrclOgnSpItmPurSalNMngVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/pd/pcom/deletePrdcrCrclOgnSpItmPurSalNMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletePrdcrCrclOgnSpItmPurSalNMng(@RequestBody PrdcrCrclOgnSpItmPurSalNMngVO PrdcrCrclOgnSpItmPurSalNMngVO, HttpServletRequest request) throws Exception {
			logger.debug("/pd/pcom/deletePrdcrCrclOgnSpItmPurSalNMng >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ PrdcrCrclOgnSpItmPurSalNMngService.deletePrdcrCrclOgnSpItmPurSalNMng(PrdcrCrclOgnSpItmPurSalNMngVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

}
