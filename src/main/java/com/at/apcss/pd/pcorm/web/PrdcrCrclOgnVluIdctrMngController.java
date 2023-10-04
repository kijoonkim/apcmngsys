package com.at.apcss.pd.pcorm.web;

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
import com.at.apcss.pd.pcorm.service.PrdcrCrclOgnVluIdctrMngService;
import com.at.apcss.pd.pcorm.vo.PrdcrCrclOgnVluIdctrMngVO;

@Controller
public class PrdcrCrclOgnVluIdctrMngController extends BaseController{

	@Resource(name= "prdcrCrclOgnVluIdctrMngService")
	private PrdcrCrclOgnVluIdctrMngService prdcrCrclOgnVluIdctrMngService;

//화면이동
	@RequestMapping(value = "/pd/pcorm/PrdcrCrclOgnVluIdctrMng.do")
	public String PrdcrCrclOgnVluIdctrMng() {
		return "apcss/pd/pcorm/PrdcrCrclOgnVluIdctrMng";
	}

// 조회
		@PostMapping(value = "/pd/pcorm/selectPrdcrCrclOgnVluIdctrMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnVluIdctrMngList(Model model, @RequestBody PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<PrdcrCrclOgnVluIdctrMngVO> resultList = new ArrayList<>();
			try {
				 resultList = prdcrCrclOgnVluIdctrMngService.selectPrdcrCrclOgnVluIdctrMngList(prdcrCrclOgnVluIdctrMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/pd/pcorm/insertPrdcrCrclOgnVluIdctrMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertPrdcrCrclOgnVluIdctrMng(@RequestBody PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			prdcrCrclOgnVluIdctrMngVO.setSysFrstInptUserId(getUserId());
			prdcrCrclOgnVluIdctrMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			prdcrCrclOgnVluIdctrMngVO.setSysLastChgUserId(getUserId());
			prdcrCrclOgnVluIdctrMngVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = prdcrCrclOgnVluIdctrMngService.insertPrdcrCrclOgnVluIdctrMng(prdcrCrclOgnVluIdctrMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/pd/pcorm/multiSavePrdcrCrclOgnVluIdctrMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavePrdcrCrclOgnVluIdctrMngList(@RequestBody List<PrdcrCrclOgnVluIdctrMngVO> prdcrCrclOgnVluIdctrMngVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO : prdcrCrclOgnVluIdctrMngVOList) {
					prdcrCrclOgnVluIdctrMngVO.setSysFrstInptPrgrmId(getPrgrmId());
					prdcrCrclOgnVluIdctrMngVO.setSysFrstInptUserId(getUserId());
					prdcrCrclOgnVluIdctrMngVO.setSysLastChgPrgrmId(getPrgrmId());
					prdcrCrclOgnVluIdctrMngVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = prdcrCrclOgnVluIdctrMngService.multiSavePrdcrCrclOgnVluIdctrMngList(prdcrCrclOgnVluIdctrMngVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/pd/pcorm/deletePrdcrCrclOgnVluIdctrMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletePrdcrCrclOgnVluIdctrMng(@RequestBody PrdcrCrclOgnVluIdctrMngVO prdcrCrclOgnVluIdctrMngVO, HttpServletRequest request) throws Exception {
			logger.debug("/pd/pcorm/deletePrdcrCrclOgnVluIdctrMng >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ prdcrCrclOgnVluIdctrMngService.deletePrdcrCrclOgnVluIdctrMng(prdcrCrclOgnVluIdctrMngVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

}
