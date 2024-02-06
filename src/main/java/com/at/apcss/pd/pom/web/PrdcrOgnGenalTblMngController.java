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
import com.at.apcss.pd.pom.service.PrdcrOgnGenalTblMngService;
import com.at.apcss.pd.pom.vo.PrdcrOgnGenalTblMngVO;

@Controller
public class PrdcrOgnGenalTblMngController extends BaseController{

	@Resource(name= "PrdcrOgnGenalTblMngService")
	private PrdcrOgnGenalTblMngService PrdcrOgnGenalTblMngService;

//화면이동
	@RequestMapping(value = "/pd/pom/PrdcrOgnGenalTblMng.do")
	public String PrdcrOgnGenalTblMng() {
		return "apcss/pd/pom/PrdcrOgnGenalTblMng";
	}

// 조회
		@PostMapping(value = "/pd/pom/selectPrdcrOgnGenalTblMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectPrdcrOgnGenalTblMngList(Model model, @RequestBody PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<PrdcrOgnGenalTblMngVO> resultList = new ArrayList<>();
			try {
				 resultList = PrdcrOgnGenalTblMngService.selectPrdcrOgnGenalTblMngList(PrdcrOgnGenalTblMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}
			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
			return getSuccessResponseEntity(resultMap);
		}



		//등록
		@PostMapping(value = "/pd/pom/insertPrdcrOgnGenalTblMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertPrdcrOgnGenalTblMng(@RequestBody PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			PrdcrOgnGenalTblMngVO.setSysFrstInptUserId(getUserId());
			PrdcrOgnGenalTblMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			PrdcrOgnGenalTblMngVO.setSysLastChgUserId(getUserId());
			PrdcrOgnGenalTblMngVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = PrdcrOgnGenalTblMngService.insertPrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}


		@PostMapping(value = "/pd/pom/multiSavePrdcrOgnGenalTblMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> multiSavePrdcrOgnGenalTblMngList(@RequestBody List<PrdcrOgnGenalTblMngVO> PrdcrOgnGenalTblMngVOList, HttpServletRequest request) throws Exception {

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			int savedCnt = 0;
			try {
				for (PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO : PrdcrOgnGenalTblMngVOList) {
					PrdcrOgnGenalTblMngVO.setSysFrstInptPrgrmId(getPrgrmId());
					PrdcrOgnGenalTblMngVO.setSysFrstInptUserId(getUserId());
					PrdcrOgnGenalTblMngVO.setSysLastChgPrgrmId(getPrgrmId());
					PrdcrOgnGenalTblMngVO.setSysLastChgUserId(getUserId());
				}

				savedCnt = PrdcrOgnGenalTblMngService.multiSavePrdcrOgnGenalTblMngList(PrdcrOgnGenalTblMngVOList);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
			return getSuccessResponseEntity(resultMap);
		}

		@PostMapping(value = "/pd/pom/deletePrdcrOgnGenalTblMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deletePrdcrOgnGenalTblMng(@RequestBody PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO, HttpServletRequest request) throws Exception {
			logger.debug("/pd/pom/deletePrdcrOgnGenalTblMng >>> 호출 >>> ");

			int result = 0;
			try {
				result =+ PrdcrOgnGenalTblMngService.deletePrdcrOgnGenalTblMng(PrdcrOgnGenalTblMngVO);
			}catch (Exception e) {
				return getErrorResponseEntity(e);
			}

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			resultMap.put("result", result);
			return getSuccessResponseEntity(resultMap);
		}

		//적합여부 업데이트
		//예외적인 상황에 관리자가 임의로 적합여부 변경
		@PostMapping(value = "/pd/pom/updateStbltYn.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> updateStbltYn(@RequestBody PrdcrOgnGenalTblMngVO PrdcrOgnGenalTblMngVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			PrdcrOgnGenalTblMngVO.setSysFrstInptUserId(getUserId());
			PrdcrOgnGenalTblMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			PrdcrOgnGenalTblMngVO.setSysLastChgUserId(getUserId());
			PrdcrOgnGenalTblMngVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;

			try {
				insertedCnt = PrdcrOgnGenalTblMngService.updateStbltYn(PrdcrOgnGenalTblMngVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}

}
