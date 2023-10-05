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
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnPurSalMngService;
import com.at.apcss.pd.pcom.vo.PrdcrCrclOgnPurSalMngVO;

@Controller
public class PrdcrCrclOgnPurSalMngController extends BaseController{

	@Resource(name= "PrdcrCrclOgnPurSalMngService")
	private PrdcrCrclOgnPurSalMngService PrdcrCrclOgnPurSalMngService;

//화면이동
	@RequestMapping(value = "/pd/pcom/PrdcrCrclOgnPurSalMng.do")
	public String PrdcrCrclOgnPurSalMng() {
		return "apcss/pd/pcom/PrdcrCrclOgnPurSalMng";
	}

// 조회
		@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnPurSalMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnPurSalMngList(Model model, @RequestBody PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<PrdcrCrclOgnPurSalMngVO> resultList = new ArrayList<>();
			try {
				 resultList = PrdcrCrclOgnPurSalMngService.selectPrdcrCrclOgnPurSalMngList(PrdcrCrclOgnPurSalMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/pd/pcom/insertPrdcrCrclOgnPurSalMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertPrdcrCrclOgnPurSalMng(@RequestBody PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			PrdcrCrclOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
			PrdcrCrclOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			PrdcrCrclOgnPurSalMngVO.setSysLastChgUserId(getUserId());
			PrdcrCrclOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = PrdcrCrclOgnPurSalMngService.insertPrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/pd/pcom/multiSavePrdcrCrclOgnPurSalMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavePrdcrCrclOgnPurSalMngList(@RequestBody List<PrdcrCrclOgnPurSalMngVO> PrdcrCrclOgnPurSalMngVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO : PrdcrCrclOgnPurSalMngVOList) {
					PrdcrCrclOgnPurSalMngVO.setSysFrstInptPrgrmId(getPrgrmId());
					PrdcrCrclOgnPurSalMngVO.setSysFrstInptUserId(getUserId());
					PrdcrCrclOgnPurSalMngVO.setSysLastChgPrgrmId(getPrgrmId());
					PrdcrCrclOgnPurSalMngVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = PrdcrCrclOgnPurSalMngService.multiSavePrdcrCrclOgnPurSalMngList(PrdcrCrclOgnPurSalMngVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/pd/pcom/deletePrdcrCrclOgnPurSalMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletePrdcrCrclOgnPurSalMng(@RequestBody PrdcrCrclOgnPurSalMngVO PrdcrCrclOgnPurSalMngVO, HttpServletRequest request) throws Exception {
			logger.debug("/pd/pcom/deletePrdcrCrclOgnPurSalMng >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ PrdcrCrclOgnPurSalMngService.deletePrdcrCrclOgnPurSalMng(PrdcrCrclOgnPurSalMngVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

}
