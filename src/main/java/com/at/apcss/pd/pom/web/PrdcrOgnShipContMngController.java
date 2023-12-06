package com.at.apcss.pd.pom.web;

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
import com.at.apcss.pd.pom.service.PrdcrOgnShipContMngService;
import com.at.apcss.pd.pom.vo.PrdcrOgnShipContMngVO;

@Controller
public class PrdcrOgnShipContMngController extends BaseController{

	@Resource(name= "PrdcrOgnShipContMngService")
	private PrdcrOgnShipContMngService PrdcrOgnShipContMngService;

//화면이동
	@RequestMapping(value = "/pd/pom/PrdcrOgnShipContMng.do")
	public String PrdcrOgnShipContMng() {
		return "apcss/pd/pom/PrdcrOgnShipContMng";
	}

		// 조회
		@PostMapping(value = "/pd/pom/selectPrdcrOgnShipContMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectPrdcrOgnShipContMngList(Model model, @RequestBody PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<PrdcrOgnShipContMngVO> resultList = new ArrayList<>();
			try {
				 resultList = PrdcrOgnShipContMngService.selectPrdcrOgnShipContMngList(PrdcrOgnShipContMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}

		// 조회
		@PostMapping(value = "/pd/pom/selectPrdcrOgnShipContMngDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectPrdcrOgnShipContMngDtlList(Model model, @RequestBody PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<PrdcrOgnShipContMngVO> resultList = new ArrayList<>();
			try {
				 resultList = PrdcrOgnShipContMngService.selectPrdcrOgnShipContMngDtlList(PrdcrOgnShipContMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}


		//등록
		@PostMapping(value = "/pd/pom/insertPrdcrOgnShipContMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertPrdcrOgnShipContMng(@RequestBody PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			PrdcrOgnShipContMngVO.setSysFrstInptUserId(getUserId());
			PrdcrOgnShipContMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			PrdcrOgnShipContMngVO.setSysLastChgUserId(getUserId());
			PrdcrOgnShipContMngVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = PrdcrOgnShipContMngService.insertPrdcrOgnShipContMng(PrdcrOgnShipContMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/pd/pom/multiSavePrdcrOgnShipContMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavePrdcrOgnShipContMngList(@RequestBody List<PrdcrOgnShipContMngVO> PrdcrOgnShipContMngVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO : PrdcrOgnShipContMngVOList) {
					PrdcrOgnShipContMngVO.setSysFrstInptPrgrmId(getPrgrmId());
					PrdcrOgnShipContMngVO.setSysFrstInptUserId(getUserId());
					PrdcrOgnShipContMngVO.setSysLastChgPrgrmId(getPrgrmId());
					PrdcrOgnShipContMngVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = PrdcrOgnShipContMngService.multiSavePrdcrOgnShipContMngList(PrdcrOgnShipContMngVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/pd/pom/deletePrdcrOgnShipContMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletePrdcrOgnShipContMng(@RequestBody PrdcrOgnShipContMngVO PrdcrOgnShipContMngVO, HttpServletRequest request) throws Exception {
			logger.debug("/pd/pom/deletePrdcrOgnShipContMng >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ PrdcrOgnShipContMngService.deletePrdcrOgnShipContMng(PrdcrOgnShipContMngVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

}
