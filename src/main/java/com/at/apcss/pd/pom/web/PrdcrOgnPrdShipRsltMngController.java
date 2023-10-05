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

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.dashboard.service.DashboardService;
import com.at.apcss.fm.dashboard.vo.DashboardVO;
import com.at.apcss.fm.fclt.service.FcltOperInfoClctAgreInfoService;
import com.at.apcss.fm.fclt.vo.FcltOperInfoClctAgreInfoVO;
import com.at.apcss.pd.pom.service.PrdcrOgnPrdShipRsltMngService;
import com.at.apcss.pd.pom.vo.PrdcrOgnPrdShipRsltMngVO;

@Controller
public class PrdcrOgnPrdShipRsltMngController extends BaseController{

	@Resource(name= "PrdcrOgnPrdShipRsltMngService")
	private PrdcrOgnPrdShipRsltMngService PrdcrOgnPrdShipRsltMngService;

//화면이동
	@RequestMapping(value = "/pd/pom/PrdcrOgnPrdShipRsltMng.do")
	public String PrdcrOgnPrdShipRsltMng() {
		return "apcss/pd/pom/PrdcrOgnPrdShipRsltMng";
	}

// 조회
		@PostMapping(value = "/pd/pom/selectPrdcrOgnPrdShipRsltMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectPrdcrOgnPrdShipRsltMngList(Model model, @RequestBody PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<PrdcrOgnPrdShipRsltMngVO> resultList = new ArrayList<>();
			try {
				 resultList = PrdcrOgnPrdShipRsltMngService.selectPrdcrOgnPrdShipRsltMngList(PrdcrOgnPrdShipRsltMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/pd/pom/insertPrdcrOgnPrdShipRsltMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertPrdcrOgnPrdShipRsltMng(@RequestBody PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			PrdcrOgnPrdShipRsltMngVO.setSysFrstInptUserId(getUserId());
			PrdcrOgnPrdShipRsltMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			PrdcrOgnPrdShipRsltMngVO.setSysLastChgUserId(getUserId());
			PrdcrOgnPrdShipRsltMngVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = PrdcrOgnPrdShipRsltMngService.insertPrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/pd/pom/multiSavePrdcrOgnPrdShipRsltMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavePrdcrOgnPrdShipRsltMngList(@RequestBody List<PrdcrOgnPrdShipRsltMngVO> PrdcrOgnPrdShipRsltMngVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO : PrdcrOgnPrdShipRsltMngVOList) {
					PrdcrOgnPrdShipRsltMngVO.setSysFrstInptPrgrmId(getPrgrmId());
					PrdcrOgnPrdShipRsltMngVO.setSysFrstInptUserId(getUserId());
					PrdcrOgnPrdShipRsltMngVO.setSysLastChgPrgrmId(getPrgrmId());
					PrdcrOgnPrdShipRsltMngVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = PrdcrOgnPrdShipRsltMngService.multiSavePrdcrOgnPrdShipRsltMngList(PrdcrOgnPrdShipRsltMngVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/pd/pom/deletePrdcrOgnPrdShipRsltMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletePrdcrOgnPrdShipRsltMng(@RequestBody PrdcrOgnPrdShipRsltMngVO PrdcrOgnPrdShipRsltMngVO, HttpServletRequest request) throws Exception {
			logger.debug("/pd/pom/deletePrdcrOgnPrdShipRsltMng >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ PrdcrOgnPrdShipRsltMngService.deletePrdcrOgnPrdShipRsltMng(PrdcrOgnPrdShipRsltMngVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

}
