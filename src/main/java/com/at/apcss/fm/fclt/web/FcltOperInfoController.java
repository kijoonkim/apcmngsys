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
import com.at.apcss.fm.fclt.vo.FcltOperInfoVO;


/**
 * @Class Name : FcltOperInfoController.java
 * @Description : 운영자개요에 대한 Controller 클래스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
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
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltOperInfoVO fcltOperInfoVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltOperInfoVO> resultList = new ArrayList<>();

		try {
			 resultList = fcltOperInfoService.selectFcltOperInfoList(fcltOperInfoVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltOperInfoVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
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


	/*
	 * 주소 팝업
	 */
	@GetMapping("/fm/popup/jusoPopup.do")
	public String jusoPopupGet(Model model, HttpServletRequest request) {
		return "apcss/fm/popup/jusoPopup";
	}

	@PostMapping("/fm/popup/jusoPopup.do")
	public String jusoPopupPost(Model model, HttpServletRequest request) {
		return "apcss/fm/popup/jusoPopup";
	}
}