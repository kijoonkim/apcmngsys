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

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.dashboard.service.DashboardService;
import com.at.apcss.fm.dashboard.vo.DashboardVO;
import com.at.apcss.fm.fclt.service.FcltOperInfoClctAgreInfoService;
import com.at.apcss.fm.fclt.vo.FcltOperInfoClctAgreInfoVO;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnGenalTblMngService;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnGenalTblMngVO;

@Controller
public class PrdcrCrclOgnGenalTblMngController extends BaseController{

	@Resource(name= "PrdcrCrclOgnGenalTblMngService")
	private PrdcrCrclOgnGenalTblMngService PrdcrCrclOgnGenalTblMngService;

//화면이동
	@RequestMapping(value = "/pd/pcom/PrdcrCrclOgnGenalTblMng.do")
	public String PrdcrCrclOgnGenalTblMng() {
		return "apcss/pd/pcom/PrdcrCrclOgnGenalTblMng";
	}

// 조회
		@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnGenalTblMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnGenalTblMngList(Model model, @RequestBody PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<PrdcrCrclOgnGenalTblMngVO> resultList = new ArrayList<>();
			try {
				 resultList = PrdcrCrclOgnGenalTblMngService.selectPrdcrCrclOgnGenalTblMngList(PrdcrCrclOgnGenalTblMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/pd/pcom/insertPrdcrCrclOgnGenalTblMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertPrdcrCrclOgnGenalTblMng(@RequestBody PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			PrdcrCrclOgnGenalTblMngVO.setSysFrstInptUserId(getUserId());
			PrdcrCrclOgnGenalTblMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			PrdcrCrclOgnGenalTblMngVO.setSysLastChgUserId(getUserId());
			PrdcrCrclOgnGenalTblMngVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = PrdcrCrclOgnGenalTblMngService.insertPrdcrCrclOgnGenalTblMng(PrdcrCrclOgnGenalTblMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/pd/pcom/multiSavePrdcrCrclOgnGenalTblMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavePrdcrCrclOgnGenalTblMngList(@RequestBody List<PrdcrCrclOgnGenalTblMngVO> PrdcrCrclOgnGenalTblMngVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO : PrdcrCrclOgnGenalTblMngVOList) {
					PrdcrCrclOgnGenalTblMngVO.setSysFrstInptPrgrmId(getPrgrmId());
					PrdcrCrclOgnGenalTblMngVO.setSysFrstInptUserId(getUserId());
					PrdcrCrclOgnGenalTblMngVO.setSysLastChgPrgrmId(getPrgrmId());
					PrdcrCrclOgnGenalTblMngVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = PrdcrCrclOgnGenalTblMngService.multiSavePrdcrCrclOgnGenalTblMngList(PrdcrCrclOgnGenalTblMngVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/pd/pcom/deletePrdcrCrclOgnGenalTblMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletePrdcrCrclOgnGenalTblMng(@RequestBody PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO, HttpServletRequest request) throws Exception {
			logger.debug("/pd/pcom/deletePrdcrCrclOgnGenalTblMng >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ PrdcrCrclOgnGenalTblMngService.deletePrdcrCrclOgnGenalTblMng(PrdcrCrclOgnGenalTblMngVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

}
