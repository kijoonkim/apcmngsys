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
import com.at.apcss.pd.pom.service.PrdcrOgnCurntMngService;
import com.at.apcss.pd.pom.vo.PrdcrOgnCurntMngVO;

@Controller
public class PrdcrOgnCurntMngController extends BaseController{

	@Resource(name= "PrdcrOgnCurntMngService")
	private PrdcrOgnCurntMngService PrdcrOgnCurntMngService;

//화면이동
	@RequestMapping(value = "/pd/pom/PrdcrOgnCurntMng.do")
	public String PrdcrOgnCurntMng() {
		return "apcss/pd/pom/PrdcrOgnCurntMng";
	}

// 조회
		@PostMapping(value = "/pd/pom/selectPrdcrOgnCurntMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectPrdcrOgnCurntMngList(Model model, @RequestBody PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<PrdcrOgnCurntMngVO> resultList = new ArrayList<>();
			try {
				 resultList = PrdcrOgnCurntMngService.selectPrdcrOgnCurntMngList(PrdcrOgnCurntMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/pd/pom/insertPrdcrOgnCurntMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertPrdcrOgnCurntMng(@RequestBody PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			PrdcrOgnCurntMngVO.setSysFrstInptUserId(getUserId());
			PrdcrOgnCurntMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			PrdcrOgnCurntMngVO.setSysLastChgUserId(getUserId());
			PrdcrOgnCurntMngVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = PrdcrOgnCurntMngService.insertPrdcrOgnCurntMng(PrdcrOgnCurntMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/pd/pom/multiSavePrdcrOgnCurntMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavePrdcrOgnCurntMngList(@RequestBody List<PrdcrOgnCurntMngVO> PrdcrOgnCurntMngVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO : PrdcrOgnCurntMngVOList) {
					PrdcrOgnCurntMngVO.setSysFrstInptPrgrmId(getPrgrmId());
					PrdcrOgnCurntMngVO.setSysFrstInptUserId(getUserId());
					PrdcrOgnCurntMngVO.setSysLastChgPrgrmId(getPrgrmId());
					PrdcrOgnCurntMngVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = PrdcrOgnCurntMngService.multiSavePrdcrOgnCurntMngList(PrdcrOgnCurntMngVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/pd/pom/deletePrdcrOgnCurntMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletePrdcrOgnCurntMng(@RequestBody PrdcrOgnCurntMngVO PrdcrOgnCurntMngVO, HttpServletRequest request) throws Exception {
			logger.debug("/pd/pom/deletePrdcrOgnCurntMng >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ PrdcrOgnCurntMngService.deletePrdcrOgnCurntMng(PrdcrOgnCurntMngVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

}
