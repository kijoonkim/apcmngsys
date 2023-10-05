package com.at.apcss.pd.bsm.web;

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
import com.at.apcss.pd.bsm.service.PrdcrCrclOgnUsrMngService;
import com.at.apcss.pd.bsm.vo.PrdcrCrclOgnUsrMngVO;

@Controller
public class PrdcrCrclOgnUsrMngController extends BaseController{

	@Resource(name= "PrdcrCrclOgnUsrMngService")
	private PrdcrCrclOgnUsrMngService PrdcrCrclOgnUsrMngService;

//화면이동
	@RequestMapping(value = "/pd/bsm/PrdcrCrclOgnUsrMng.do")
	public String PrdcrCrclOgnUsrMng() {
		return "apcss/pd/bsm/PrdcrCrclOgnUsrMng";
	}

// 조회
		@PostMapping(value = "/pd/bsm/selectPrdcrCrclOgnUsrMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnUsrMngList(Model model, @RequestBody PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<PrdcrCrclOgnUsrMngVO> resultList = new ArrayList<>();
			try {
				 resultList = PrdcrCrclOgnUsrMngService.selectPrdcrCrclOgnUsrMngList(PrdcrCrclOgnUsrMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/pd/bsm/insertPrdcrCrclOgnUsrMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertPrdcrCrclOgnUsrMng(@RequestBody PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			PrdcrCrclOgnUsrMngVO.setSysFrstInptUserId(getUserId());
			PrdcrCrclOgnUsrMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			PrdcrCrclOgnUsrMngVO.setSysLastChgUserId(getUserId());
			PrdcrCrclOgnUsrMngVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = PrdcrCrclOgnUsrMngService.insertPrdcrCrclOgnUsrMng(PrdcrCrclOgnUsrMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/pd/bsm/multiSavePrdcrCrclOgnUsrMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavePrdcrCrclOgnUsrMngList(@RequestBody List<PrdcrCrclOgnUsrMngVO> PrdcrCrclOgnUsrMngVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO : PrdcrCrclOgnUsrMngVOList) {
					PrdcrCrclOgnUsrMngVO.setSysFrstInptPrgrmId(getPrgrmId());
					PrdcrCrclOgnUsrMngVO.setSysFrstInptUserId(getUserId());
					PrdcrCrclOgnUsrMngVO.setSysLastChgPrgrmId(getPrgrmId());
					PrdcrCrclOgnUsrMngVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = PrdcrCrclOgnUsrMngService.multiSavePrdcrCrclOgnUsrMngList(PrdcrCrclOgnUsrMngVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/pd/bsm/deletePrdcrCrclOgnUsrMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletePrdcrCrclOgnUsrMng(@RequestBody PrdcrCrclOgnUsrMngVO PrdcrCrclOgnUsrMngVO, HttpServletRequest request) throws Exception {
			logger.debug("/pd/bsm/deletePrdcrCrclOgnUsrMng >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ PrdcrCrclOgnUsrMngService.deletePrdcrCrclOgnUsrMng(PrdcrCrclOgnUsrMngVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

}
