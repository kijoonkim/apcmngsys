package com.at.apcss.pd.isom.web;

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

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.dashboard.service.DashboardService;
import com.at.apcss.fm.dashboard.vo.DashboardVO;
import com.at.apcss.fm.fclt.service.FcltOperInfoClctAgreInfoService;
import com.at.apcss.fm.fclt.vo.FcltOperInfoClctAgreInfoVO;
import com.at.apcss.pd.isom.service.InvShipOgnGenalTblMngService;
import com.at.apcss.pd.isom.vo.InvShipOgnGenalTblMngVO;

@Controller
public class InvShipOgnGenalTblMngController extends BaseController{

	@Resource(name= "InvShipOgnGenalTblMngService")
	private InvShipOgnGenalTblMngService InvShipOgnGenalTblMngService;

//화면이동
	@RequestMapping(value = "/pd/isom/InvShipOgnGenalTblMng.do")
	public String InvShipOgnGenalTblMng() {
		return "apcss/pd/isom/InvShipOgnGenalTblMng";
	}

// 조회
		@PostMapping(value = "/pd/isom/selectInvShipOgnGenalTblMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectInvShipOgnGenalTblMngList(Model model, @RequestBody InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<InvShipOgnGenalTblMngVO> resultList = new ArrayList<>();
			try {
				 resultList = InvShipOgnGenalTblMngService.selectInvShipOgnGenalTblMngList(InvShipOgnGenalTblMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/pd/isom/insertInvShipOgnGenalTblMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertInvShipOgnGenalTblMng(@RequestBody InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			InvShipOgnGenalTblMngVO.setSysFrstInptUserId(getUserId());
			InvShipOgnGenalTblMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			InvShipOgnGenalTblMngVO.setSysLastChgUserId(getUserId());
			InvShipOgnGenalTblMngVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = InvShipOgnGenalTblMngService.insertInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/pd/isom/multiSaveInvShipOgnGenalTblMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSaveInvShipOgnGenalTblMngList(@RequestBody List<InvShipOgnGenalTblMngVO> InvShipOgnGenalTblMngVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO : InvShipOgnGenalTblMngVOList) {
					InvShipOgnGenalTblMngVO.setSysFrstInptPrgrmId(getPrgrmId());
					InvShipOgnGenalTblMngVO.setSysFrstInptUserId(getUserId());
					InvShipOgnGenalTblMngVO.setSysLastChgPrgrmId(getPrgrmId());
					InvShipOgnGenalTblMngVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = InvShipOgnGenalTblMngService.multiSaveInvShipOgnGenalTblMngList(InvShipOgnGenalTblMngVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/pd/isom/deleteInvShipOgnGenalTblMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deleteInvShipOgnGenalTblMng(@RequestBody InvShipOgnGenalTblMngVO InvShipOgnGenalTblMngVO, HttpServletRequest request) throws Exception {
			logger.debug("/pd/isom/deleteInvShipOgnGenalTblMng >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ InvShipOgnGenalTblMngService.deleteInvShipOgnGenalTblMng(InvShipOgnGenalTblMngVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

}
