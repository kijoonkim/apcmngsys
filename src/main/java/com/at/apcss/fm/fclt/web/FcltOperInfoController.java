package com.at.apcss.fm.fclt.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.fclt.service.FcltOperInfoService;
import com.at.apcss.fm.fclt.vo.FcltApcVO;
import com.at.apcss.fm.fclt.vo.FcltItemVO;
import com.at.apcss.fm.fclt.vo.FcltOperInfoVO;


/**
 * @Class Name : FcltOperInfoController.java
 * @Description : 운영자개요에 대한 Controller 클래스
 * @author
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21             최초 생성
 * </pre>
 */
@Controller
public class FcltOperInfoController extends BaseController {


	// 운영자개요
	@Resource(name= "fcltOperInfoService")
	private FcltOperInfoService fcltOperInfoService;

	// 운영자개요 화면이동
	@GetMapping("/fm/fclt/fcltOperInfo.do")
	public String doFcltOperInfo() {
		return "apcss/fm/fclt/fcltOperInfo";
	}

	// 운영자개요 조회
	@PostMapping(value = "/fm/fclt/selectFcltOperInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFcltOperInfoList(Model model, @RequestBody FcltOperInfoVO fcltOperInfoVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltOperInfoVO> resultList = new ArrayList<>();
		FcltOperInfoVO userInfo = new FcltOperInfoVO();

		fcltOperInfoVO.setUserId(getUserId());

		try {
			resultList = fcltOperInfoService.selectFcltOperInfoList(fcltOperInfoVO);
			userInfo = fcltOperInfoService.selectUserInfo(fcltOperInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		resultMap.put(ComConstants.PROP_RESULT_MAP, userInfo);

		return getSuccessResponseEntity(resultMap);
	}

	// 운영자개요 등록
	@PostMapping(value = "/fm/fclt/insertFcltOperInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltOperInfo(@RequestBody FcltOperInfoVO fcltOperInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltOperInfoVO.setSysFrstInptUserId(getUserId());
		fcltOperInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltOperInfoVO.setSysLastChgUserId(getUserId());
		fcltOperInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = fcltOperInfoService.insertFcltOperInfo(fcltOperInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 운영자개요 변경
	@PostMapping(value = "/fm/fclt/updateFcltOperInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltOperInfo(@RequestBody FcltOperInfoVO fcltOperInfoVO, HttpServletRequest requset) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltOperInfoVO.setSysLastChgUserId(getUserId());
		fcltOperInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltOperInfoService.updateFcltOperInfo(fcltOperInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	// 운영자개요 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltOperInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltOperInfo(@RequestBody FcltOperInfoVO fcltOperInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltOperInfoVO.setSysLastChgUserId(getUserId());
		fcltOperInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltOperInfoService.deleteFcltOperInfo(fcltOperInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 운영자개요 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltOperInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltOperInfoList(@RequestBody List<FcltOperInfoVO> fcltOperInfoList, HttpServletRequest requset) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (FcltOperInfoVO fcltOperInfoVO : fcltOperInfoList ) {
			fcltOperInfoVO.setSysLastChgUserId(getUserId());
			fcltOperInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = fcltOperInfoService.deleteFcltOperInfoList(fcltOperInfoList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	// 품목 조회
	@PostMapping(value = "/fm/fclt/selectFcltOperInfoItemList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFcltOperInfoItemList(Model model, @RequestBody FcltItemVO fcltItemVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltItemVO> resultList = new ArrayList<>();

		try {
			resultList = fcltOperInfoService.selectFcltOperInfoItemList(fcltItemVO);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 운영자개요 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteItem.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteItem(@RequestBody FcltItemVO fcltItemVO, HttpServletRequest requset) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		//fcltItemVO.setSysLastChgUserId(getUserId());
		//fcltItemVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltOperInfoService.deleteItem(fcltItemVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		return getSuccessResponseEntity(resultMap);
	}


	/*
	 * 주소 팝업
	 */
//	@GetMapping("/fm/popup/jusoPopup.do")
//	public String jusoPopupGet(Model model, HttpServletRequest request) {
//		return "apcss/fm/popup/jusoPopup";
//	}
//
//	@PostMapping("/fm/popup/jusoPopup.do")
//	public String jusoPopupPost(Model model, HttpServletRequest request) {
//		return "apcss/fm/popup/jusoPopup";
//	}

	/*
	 * 주소 팝업
	 */
	@RequestMapping("/fm/popup/jusoPopup.do")
	public String jusoPopup(Model model, HttpServletRequest request) {
		return "apcss/fm/popup/jusoPopup";
	}


	// APC목록 조회
	@PostMapping(value = "/fm/fclt/selectApcList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectApcList(Model model, @RequestBody FcltApcVO fcltApcVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltApcVO> resultList = new ArrayList<>();

		fcltApcVO.setUserId(getUserId());//유저아이디
		fcltApcVO.setUserType(getUserType());//유저권한

		try {
			resultList = fcltOperInfoService.selectApcList(fcltApcVO);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//로우데이터 조회
	@PostMapping(value = "/fm/fclt/selectFcltOperInfoRawDataList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFcltOperInfoRawDataList(Model model, @RequestBody FcltApcVO fcltApcVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltApcVO> resultList = new ArrayList<>();

		fcltApcVO.setUserId(getUserId());//유저아이디
		fcltApcVO.setUserType(getUserType());//유저권한

		try {
			resultList = fcltOperInfoService.selectFcltOperInfoRawDataList(fcltApcVO);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	// 선택가능한 APC목록 조회
	@PostMapping(value = "/fm/fclt/selectUserApcList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUserApcList(Model model, @RequestBody FcltApcVO fcltApcVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltApcVO> resultList = new ArrayList<>();

		fcltApcVO.setUserId(getUserId());//유저아이디
		fcltApcVO.setUserType(getUserType());//유저권한

		try {
			resultList = fcltOperInfoService.selectUserApcList(fcltApcVO);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}
}