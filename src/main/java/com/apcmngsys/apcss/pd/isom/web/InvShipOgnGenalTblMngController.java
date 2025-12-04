package com.apcmngsys.apcss.pd.isom.web;

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

import com.apcmngsys.apcss.co.constants.ComConstants;
import com.apcmngsys.apcss.co.sys.controller.BaseController;
import com.apcmngsys.apcss.pd.isom.service.InvShipOgnGenalTblMngService;
import com.apcmngsys.apcss.pd.isom.vo.InvShipOgnGenalTblMngVO;

@Controller
public class InvShipOgnGenalTblMngController extends BaseController{

	@Resource(name= "invShipOgnGenalTblMngService")
	private InvShipOgnGenalTblMngService invShipOgnGenalTblMngService;

	//화면이동
	@RequestMapping(value = "/pd/isom/InvShipOgnGenalTblMng.do")
	public String InvShipOgnGenalTblMng() {
		return "apcss/pd/isom/InvShipOgnGenalTblMng";
	}

	// 조회
	@PostMapping(value = "/pd/isom/selectInvShipOgnGenalTblMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectInvShipOgnGenalTblMngList(Model model, @RequestBody InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnGenalTblMngVO> resultList = new ArrayList<>();
		try {
			 resultList = invShipOgnGenalTblMngService.selectInvShipOgnGenalTblMngList(invShipOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 조회
	@PostMapping(value = "/pd/isom/selectInvShipOgnGenalTblMngIsoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectInvShipOgnGenalTblMngIsoList(Model model, @RequestBody InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnGenalTblMngVO> resultList = new ArrayList<>();
		try {
			 resultList = invShipOgnGenalTblMngService.selectInvShipOgnGenalTblMngIsoList(invShipOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//적합여부 업데이트
	//예외적인 상황에 관리자가 임의로 적합여부 변경
	@PostMapping(value = "/pd/isom/updateStbltYn.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateStbltYn(@RequestBody InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();

		// validation check

		// audit 항목
		invShipOgnGenalTblMngVO.setSysFrstInptUserId(getUserId());
		invShipOgnGenalTblMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		invShipOgnGenalTblMngVO.setSysLastChgUserId(getUserId());
		invShipOgnGenalTblMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = invShipOgnGenalTblMngService.updateStbltYn(invShipOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 출자출하조직 총괄표 로우데이터 리스트 조회
	@PostMapping(value = "/pd/isom/selectInvShipOgnGenalTblMngSelectRawDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataList(Model model, @RequestBody InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnGenalTblMngVO> resultList = new ArrayList<>();
		try {
			 resultList = invShipOgnGenalTblMngService.selectRawDataList(invShipOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 조회
	@PostMapping(value = "/pd/isom/selectInvShipOgnGenalTblMngListNew.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectInvShipOgnGenalTblMngListNew(Model model, @RequestBody InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnGenalTblMngVO> resultList = new ArrayList<>();
		try {
			 resultList = invShipOgnGenalTblMngService.selectInvShipOgnGenalTblMngListNew(invShipOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 출자출하조직 총괄표 조회 (육성 -> 승인)
	 * @param model
	 * @param invShipOgnGenalTblMngVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/pd/isom/selectIsoPrchsSlsSummaryListForUpbrToAprv.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectIsoPrchsSlsSummaryListForUpbrToAprv(Model model, @RequestBody InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnGenalTblMngVO> resultList = new ArrayList<>();
		try {
			resultList = invShipOgnGenalTblMngService.selectIsoPrchsSlsSummaryListForUpbrToAprv(invShipOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	@PostMapping(value = "/pd/isom/selectIsoPrchsSlsSummaryList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectIsoPrchsSlsSummaryList(Model model, @RequestBody InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnGenalTblMngVO> resultList = new ArrayList<>();
		try {
			resultList = invShipOgnGenalTblMngService.selectIsoPrchsSlsSummaryList(invShipOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	// 출자출하조직 총괄표 로우데이터 리스트 조회
	@PostMapping(value = "/pd/isom/selectInvShipOgnGenalTblMngSelectRawDataList2025.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDataList2025(Model model, @RequestBody InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnGenalTblMngVO> resultList = new ArrayList<>();
		try {
			 resultList = invShipOgnGenalTblMngService.selectRawDataList2025(invShipOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 출자출하조직 총괄표 rawdata 리스트 조회
	@PostMapping(value = "/pd/isom/selectIsoPrchsSlsRawdataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectIsoPrchsSlsRawdataList(Model model, @RequestBody InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnGenalTblMngVO> resultList = new ArrayList<>();
		try {
			resultList = invShipOgnGenalTblMngService.selectIsoPrchsSlsRawdataList(invShipOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}



	// 출자출하조직 총괄표 로우데이터 리스트 조회
	@PostMapping(value = "/pd/isom/selectIsoClsfTot.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectIsoClsfTot(Model model, @RequestBody InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<>();
		List<InvShipOgnGenalTblMngVO> resultList = new ArrayList<>();
		try {
			 resultList = invShipOgnGenalTblMngService.selectIsoClsfTot(invShipOgnGenalTblMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//조치사항 업데이트
	//예외적인 상황에 관리자가 임의로 조치사항 변경
	@PostMapping(value = "/pd/isom/multiSaveItemIsoActnMttr.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveItemUoActnMttr(@RequestBody List<InvShipOgnGenalTblMngVO> invShipOgnGenalTblMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<>();

		int savedCnt = 0;
		try {
			for (InvShipOgnGenalTblMngVO invShipOgnGenalTblMngVO : invShipOgnGenalTblMngVOList) {
				invShipOgnGenalTblMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				invShipOgnGenalTblMngVO.setSysFrstInptUserId(getUserId());
				invShipOgnGenalTblMngVO.setSysLastChgPrgrmId(getPrgrmId());
				invShipOgnGenalTblMngVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = invShipOgnGenalTblMngService.multiSaveItemIsoActnMttr(invShipOgnGenalTblMngVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}
}
