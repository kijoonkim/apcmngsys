package com.at.apcss.pd.aom.web;

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
import com.at.apcss.pd.aom.service.InvShipOgnReqMngService;
import com.at.apcss.pd.aom.vo.InvShipOgnReqMngVO;

@Controller
public class InvShipOgnReqMngController extends BaseController{

	@Resource(name= "InvShipOgnReqMngService")
	private InvShipOgnReqMngService InvShipOgnReqMngService;

//화면이동
	@RequestMapping(value = "/pd/aom/InvShipOgnReqMng.do")
	public String InvShipOgnReqMng() {
		return "apcss/pd/aom/InvShipOgnReqMng";
	}

// 조회
		@PostMapping(value = "/pd/aom/selectInvShipOgnReqMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectInvShipOgnReqMngList(Model model, @RequestBody InvShipOgnReqMngVO InvShipOgnReqMngVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<InvShipOgnReqMngVO> resultList = new ArrayList<>();
			try {
				 resultList = InvShipOgnReqMngService.selectInvShipOgnReqMngList(InvShipOgnReqMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/pd/aom/insertInvShipOgnReqMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertInvShipOgnReqMng(@RequestBody InvShipOgnReqMngVO InvShipOgnReqMngVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			InvShipOgnReqMngVO.setSysFrstInptUserId(getUserId());
			InvShipOgnReqMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			InvShipOgnReqMngVO.setSysLastChgUserId(getUserId());
			InvShipOgnReqMngVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = InvShipOgnReqMngService.insertInvShipOgnReqMng(InvShipOgnReqMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/pd/aom/multiSaveInvShipOgnReqMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSaveInvShipOgnReqMngList(@RequestBody List<InvShipOgnReqMngVO> InvShipOgnReqMngVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (InvShipOgnReqMngVO InvShipOgnReqMngVO : InvShipOgnReqMngVOList) {
					InvShipOgnReqMngVO.setSysFrstInptPrgrmId(getPrgrmId());
					InvShipOgnReqMngVO.setSysFrstInptUserId(getUserId());
					InvShipOgnReqMngVO.setSysLastChgPrgrmId(getPrgrmId());
					InvShipOgnReqMngVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = InvShipOgnReqMngService.multiSaveInvShipOgnReqMngList(InvShipOgnReqMngVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/pd/aom/deleteInvShipOgnReqMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deleteInvShipOgnReqMng(@RequestBody InvShipOgnReqMngVO InvShipOgnReqMngVO, HttpServletRequest request) throws Exception {
			logger.debug("/pd/aom/deleteInvShipOgnReqMng >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ InvShipOgnReqMngService.deleteInvShipOgnReqMng(InvShipOgnReqMngVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

}
