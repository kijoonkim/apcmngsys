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

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.pcom.service.PrdcrCrclOgnGenalTblMngService;
import com.at.apcss.pd.pcom.vo.ItemUoStbltYnVO;
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

	// 통합조직 리스트 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnGenalTblMngUoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnGenalTblMngUoList(Model model, @RequestBody PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
		logger.debug("/pd/aom/selectPrdcrCrclOgnGenalTblMngUoList.do >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnGenalTblMngVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrCrclOgnGenalTblMngService.selectPrdcrCrclOgnGenalTblMngUoList(PrdcrCrclOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 총괄표 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnGenalTblMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnGenalTblMngList(Model model, @RequestBody ItemUoStbltYnVO ItemUoStbltYnVo, HttpServletRequest request) throws Exception{
		logger.debug("/pd/aom/selectPrdcrCrclOgnGenalTblMngList.do >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ItemUoStbltYnVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrCrclOgnGenalTblMngService.selectPrdcrCrclOgnGenalTblMngList(ItemUoStbltYnVo);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//적합여부 업데이트
	//예외적인 상황에 관리자가 임의로 적합여부 변경
	@PostMapping(value = "/pd/pcom/updateStbltYn.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateStbltYn(@RequestBody PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO, HttpServletRequest requset) throws Exception{
		logger.debug("/pd/aom/updateStbltYn.do >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		PrdcrCrclOgnGenalTblMngVO.setSysFrstInptUserId(getUserId());
		PrdcrCrclOgnGenalTblMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		PrdcrCrclOgnGenalTblMngVO.setSysLastChgUserId(getUserId());
		PrdcrCrclOgnGenalTblMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = PrdcrCrclOgnGenalTblMngService.updateStbltYn(PrdcrCrclOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	//실적 법인체 마감 업데이트
	@PostMapping(value = "/pd/pcom/updatePrfmncCorpDdlnYn.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updatePrfmncCorpDdlnYn(@RequestBody PrdcrCrclOgnGenalTblMngVO PrdcrCrclOgnGenalTblMngVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/aom/updatePrfmncCorpDdlnYn.do >>> 호출 >>> ");

		int result = 0;
		try {
			result =+ PrdcrCrclOgnGenalTblMngService.updatePrfmncCorpDdlnYn(PrdcrCrclOgnGenalTblMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	//통합조직 적합여부 전체 갱신
	@PostMapping(value = "/pd/pcom/updateAllUoStbltYn.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateAllUoStbltYn(@RequestBody ItemUoStbltYnVO ItemUoStbltYnVo, HttpServletRequest requset) throws Exception{
		logger.debug("/pd/aom/updateAllUoStbltYn.do >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		ItemUoStbltYnVo.setSysFrstInptUserId(getUserId());
		ItemUoStbltYnVo.setSysFrstInptPrgrmId(getPrgrmId());
		ItemUoStbltYnVo.setSysLastChgUserId(getUserId());
		ItemUoStbltYnVo.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = PrdcrCrclOgnGenalTblMngService.updateAllUoStbltYn(ItemUoStbltYnVo);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 총괄표 로우데이터 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnGenalTblMngSelectRawDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataList(Model model, @RequestBody ItemUoStbltYnVO ItemUoStbltYnVo, HttpServletRequest request) throws Exception{
		logger.debug("/pd/aom/selectPrdcrCrclOgnGenalTblMngList.do >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ItemUoStbltYnVO> resultList = new ArrayList<>();
		try {
			 resultList = PrdcrCrclOgnGenalTblMngService.selectRawDataList(ItemUoStbltYnVo);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}
}
