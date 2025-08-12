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

	@Resource(name= "prdcrCrclOgnGenalTblMngService")
	private PrdcrCrclOgnGenalTblMngService prdcrCrclOgnGenalTblMngService;

	//화면이동
	@RequestMapping(value = "/pd/pcom/PrdcrCrclOgnGenalTblMng.do")
	public String PrdcrCrclOgnGenalTblMng() {
		return "apcss/pd/pcom/PrdcrCrclOgnGenalTblMng";
	}

	// 통합조직 리스트 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnGenalTblMngUoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnGenalTblMngUoList(Model model, @RequestBody PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnGenalTblMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnGenalTblMngService.selectPrdcrCrclOgnGenalTblMngUoList(prdcrCrclOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 총괄표 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnGenalTblMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnGenalTblMngList(Model model, @RequestBody ItemUoStbltYnVO itemUoStbltYnVo, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ItemUoStbltYnVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnGenalTblMngService.selectPrdcrCrclOgnGenalTblMngList(itemUoStbltYnVo);
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
	public ResponseEntity<HashMap<String, Object>> updateStbltYn(@RequestBody PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO, HttpServletRequest requset) throws Exception{
		logger.debug("/pd/aom/updateStbltYn.do >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		prdcrCrclOgnGenalTblMngVO.setSysFrstInptUserId(getUserId());
		prdcrCrclOgnGenalTblMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		prdcrCrclOgnGenalTblMngVO.setSysLastChgUserId(getUserId());
		prdcrCrclOgnGenalTblMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = prdcrCrclOgnGenalTblMngService.updateStbltYn(prdcrCrclOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	//실적 법인체 마감 업데이트
	@PostMapping(value = "/pd/pcom/updatePrfmncCorpDdlnYn.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updatePrfmncCorpDdlnYn(@RequestBody PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO, HttpServletRequest request) throws Exception {

		int result = 0;
		try {
			result = prdcrCrclOgnGenalTblMngService.updatePrfmncCorpDdlnYn(prdcrCrclOgnGenalTblMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	//유저 실적 법인체 마감 업데이트
	@PostMapping(value = "/pd/pcom/updateUserPrfmncCorpDdlnYn.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateUserPrfmncCorpDdlnYn(@RequestBody PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int resultCnt = 0;
		String tempList = "";
		try {
			List<PrdcrCrclOgnGenalTblMngVO> pstList = new ArrayList<>();
			pstList = prdcrCrclOgnGenalTblMngService.selectPstTmepChk(prdcrCrclOgnGenalTblMngVO);

			for (PrdcrCrclOgnGenalTblMngVO pst : pstList) {
				tempList += "전문품목 매입매출" + "(" + pst.getApoSeNm() + "," + pst.getCorpNm() + "," + pst.getBrno() + ")\n";
			}

			List<PrdcrCrclOgnGenalTblMngVO> aspList = new ArrayList<>();
			aspList = prdcrCrclOgnGenalTblMngService.selectApsTmepChk(prdcrCrclOgnGenalTblMngVO);
			for (PrdcrCrclOgnGenalTblMngVO asp : aspList) {
				tempList += "총 매입매출" + "(" + asp.getApoSeNm() + "," + asp.getCorpNm() + "," + asp.getBrno() + ")\n";
			}

			if(pstList.size() > 0 || aspList.size() > 0) {
				resultMap.put("tempList", tempList);
				return getErrorResponseEntity(resultMap);
			}

			resultCnt = prdcrCrclOgnGenalTblMngService.updatePrfmncCorpDdlnYn(prdcrCrclOgnGenalTblMngVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put("resultCnt", resultCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//적합여부 전체 갱신
	//2024년 기준으로 되어 있음 사용시 수정 필요
	@PostMapping(value = "/pd/pcom/updateAllUoStbltYn.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateAllUoStbltYn(@RequestBody PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO, HttpServletRequest requset) throws Exception{
		logger.debug("/pd/aom/updateAllUoStbltYn.do >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		prdcrCrclOgnGenalTblMngVO.setSysFrstInptUserId(getUserId());
		prdcrCrclOgnGenalTblMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		prdcrCrclOgnGenalTblMngVO.setSysLastChgUserId(getUserId());
		prdcrCrclOgnGenalTblMngVO.setSysLastChgPrgrmId(getPrgrmId());

		try {
			/*
			//생산자조직 세부정보 갱신
			int frmhsItemChk = prdcrCrclOgnGenalTblMngService.updateFrmhsItem(PrdcrCrclOgnGenalTblMngVO);
			//전문품목 매입매출 세부정보 갱신
			int uoIsoItemChk = prdcrCrclOgnGenalTblMngService.updateUoIsoItem(PrdcrCrclOgnGenalTblMngVO);

			//생산자조직 적합여부 갱신
			int frmhsCnt = prdcrCrclOgnGenalTblMngService.updateAllFrmhsStbltYn(PrdcrCrclOgnGenalTblMngVO);
			//출자출하조직 적합여부 갱신
			int isoCnt = prdcrCrclOgnGenalTblMngService.updateAllIsoStbltYn(PrdcrCrclOgnGenalTblMngVO);
			//통합조직 적합여부 갱신
			int uoCnt = prdcrCrclOgnGenalTblMngService.updateAllUoStbltYn(PrdcrCrclOgnGenalTblMngVO);

			resultMap.put("frmhsItemChk", frmhsItemChk);
			resultMap.put("uoIsoItemChk", uoIsoItemChk);
			resultMap.put("frmhsCnt", frmhsCnt);
			resultMap.put("isoCnt", isoCnt);
			resultMap.put("uoCnt", uoCnt);
			*/
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}

	// 총괄표 로우데이터 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnGenalTblMngRawDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataList(Model model, @RequestBody ItemUoStbltYnVO itemUoStbltYnVo, HttpServletRequest request) throws Exception{
		logger.debug("/pd/aom/selectPrdcrCrclOgnGenalTblMngRawDataList.do >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ItemUoStbltYnVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnGenalTblMngService.selectRawDataList(itemUoStbltYnVo);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 총괄표 로우데이터 조회 2025년
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnGenalTblMngRawDataList2025.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataList2025(Model model, @RequestBody ItemUoStbltYnVO itemUoStbltYnVo, HttpServletRequest request) throws Exception{
		logger.debug("/pd/aom/selectPrdcrCrclOgnGenalTblMngRawDataList2025.do >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ItemUoStbltYnVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnGenalTblMngService.selectRawDataList2025(itemUoStbltYnVo);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	//조치사항 업데이트
	//예외적인 상황에 관리자가 임의로 조치사항 변경
	@PostMapping(value = "/pd/pcom/multiSaveItemUoActnMttr.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveItemUoActnMttr(@RequestBody List<PrdcrCrclOgnGenalTblMngVO> prdcrCrclOgnGenalTblMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO : prdcrCrclOgnGenalTblMngVOList) {
				prdcrCrclOgnGenalTblMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				prdcrCrclOgnGenalTblMngVO.setSysFrstInptUserId(getUserId());
				prdcrCrclOgnGenalTblMngVO.setSysLastChgPrgrmId(getPrgrmId());
				prdcrCrclOgnGenalTblMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = prdcrCrclOgnGenalTblMngService.multiSaveItemUoActnMttr(prdcrCrclOgnGenalTblMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	// 부류별 합계
	@PostMapping(value = "/pd/pcom/selectUoClsfTot.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUoClsfTot(Model model, @RequestBody PrdcrCrclOgnGenalTblMngVO prdcrCrclOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PrdcrCrclOgnGenalTblMngVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnGenalTblMngService.selectUoClsfTot(prdcrCrclOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 신규 총괄표 조회
	@PostMapping(value = "/pd/pcom/selectPrdcrCrclOgnGenalTblMngListNew.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCrclOgnGenalTblMngListNew(Model model, @RequestBody ItemUoStbltYnVO itemUoStbltYnVo, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ItemUoStbltYnVO> resultList = new ArrayList<>();
		try {
			 resultList = prdcrCrclOgnGenalTblMngService.selectPrdcrCrclOgnGenalTblMngListNew(itemUoStbltYnVo);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 신규 총괄표 조회
	@PostMapping(value = "/pd/pcom/selectUoPrchsSlsSummaryList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUoPrchsSlsSummaryList(Model model, @RequestBody ItemUoStbltYnVO itemUoStbltYnVo, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ItemUoStbltYnVO> resultList = new ArrayList<>();
		try {
			resultList = prdcrCrclOgnGenalTblMngService.selectUoPrchsSlsSummaryList(itemUoStbltYnVo);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

}
