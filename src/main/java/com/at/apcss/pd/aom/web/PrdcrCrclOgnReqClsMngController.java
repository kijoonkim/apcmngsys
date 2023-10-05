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

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.dashboard.service.DashboardService;
import com.at.apcss.fm.dashboard.vo.DashboardVO;
import com.at.apcss.fm.fclt.service.FcltOperInfoClctAgreInfoService;
import com.at.apcss.fm.fclt.vo.FcltOperInfoClctAgreInfoVO;
import com.at.apcss.pd.aom.service.PrdcrCrclOgnReqClsMngService;
import com.at.apcss.pd.aom.vo.PrdcrCrclOgnReqClsMngVO;

@Controller
public class PrdcrCrclOgnReqClsMngController extends BaseController{

	@Resource(name= "PrdcrCrclOgnReqClsMngService")
	private PrdcrCrclOgnReqClsMngService PrdcrCrclOgnReqClsMngService;

//화면이동
	@RequestMapping(value = "/pd/aom/PrdcrCrclOgnReqClsMng.do")
	public String PrdcrCrclOgnReqClsMng() {
		return "apcss/pd/aom/PrdcrCrclOgnReqClsMng";
	}

// 조회
		@PostMapping(value = "/pd/aom/selectPrdcrCrclOgnReqClsMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnReqClsMngList(Model model, @RequestBody PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<PrdcrCrclOgnReqClsMngVO> resultList = new ArrayList<>();
			try {
				 resultList = PrdcrCrclOgnReqClsMngService.selectPrdcrCrclOgnReqClsMngList(PrdcrCrclOgnReqClsMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/pd/aom/insertPrdcrCrclOgnReqClsMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertPrdcrCrclOgnReqClsMng(@RequestBody PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			PrdcrCrclOgnReqClsMngVO.setSysFrstInptUserId(getUserId());
			PrdcrCrclOgnReqClsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			PrdcrCrclOgnReqClsMngVO.setSysLastChgUserId(getUserId());
			PrdcrCrclOgnReqClsMngVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = PrdcrCrclOgnReqClsMngService.insertPrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/pd/aom/multiSavePrdcrCrclOgnReqClsMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavePrdcrCrclOgnReqClsMngList(@RequestBody List<PrdcrCrclOgnReqClsMngVO> PrdcrCrclOgnReqClsMngVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO : PrdcrCrclOgnReqClsMngVOList) {
					PrdcrCrclOgnReqClsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
					PrdcrCrclOgnReqClsMngVO.setSysFrstInptUserId(getUserId());
					PrdcrCrclOgnReqClsMngVO.setSysLastChgPrgrmId(getPrgrmId());
					PrdcrCrclOgnReqClsMngVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = PrdcrCrclOgnReqClsMngService.multiSavePrdcrCrclOgnReqClsMngList(PrdcrCrclOgnReqClsMngVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/pd/aom/deletePrdcrCrclOgnReqClsMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletePrdcrCrclOgnReqClsMng(@RequestBody PrdcrCrclOgnReqClsMngVO PrdcrCrclOgnReqClsMngVO, HttpServletRequest request) throws Exception {
			logger.debug("/pd/aom/deletePrdcrCrclOgnReqClsMng >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ PrdcrCrclOgnReqClsMngService.deletePrdcrCrclOgnReqClsMng(PrdcrCrclOgnReqClsMngVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

}
