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
import com.at.apcss.fm.fclt.service.FcltUnityMngInfoService;
import com.at.apcss.fm.fclt.vo.FcltUnityMngInfoVO;


/**
 * @Class Name : FcltUnityMngInfoController.java
 * @Description : 통합관리시스템에대한 Controller 클래스
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
public class FcltUnityMngInfoController extends BaseController {


	// 통합관리시스템
	@Resource(name= "fcltUnityMngInfoService")
	private FcltUnityMngInfoService fcltUnityMngInfoService;

	// 통합관리시스템 화면이동
	@GetMapping("/fm/fclt/fcltUnityMngInfo.do")
	public String doFcltUnityMngInfo() {
		return "apcss/fm/fclt/fcltUnityMngInfo";
	}

	// 통합관리시스템 조회
	@PostMapping(value = "/fm/fclt/selectFcltUnityMngInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltUnityMngInfoVO fcltUnityMngInfoVO, HttpServletRequest request) throws Exception{
		logger.info("=============selectMenuList=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltUnityMngInfoVO> resultList = new ArrayList<>();

		try {
			 resultList = fcltUnityMngInfoService.selectFcltUnityMngInfoList(fcltUnityMngInfoVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltUnityMngInfoVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		logger.info("=============selectMenuList=====end========");
		return getSuccessResponseEntity(resultMap);
	}

	// 통합관리시스템 등록
	@PostMapping(value = "/fm/fclt/insertFcltUnityMngInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltUnityMngInfo(@RequestBody FcltUnityMngInfoVO fcltUnityMngInfoVO, HttpServletRequest requset) throws Exception{
		logger.info("=============insert=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltUnityMngInfoVO.setSysFrstInptUserId(getUserId());
		fcltUnityMngInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltUnityMngInfoVO.setSysLastChgUserId(getUserId());
		fcltUnityMngInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = fcltUnityMngInfoService.insertFcltUnityMngInfo(fcltUnityMngInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);
		logger.info("=============insert=====end========");
		return getSuccessResponseEntity(resultMap);
	}

	// 통합관리시스템 변경
	@PostMapping(value = "/fm/fclt/updateFcltUnityMngInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltUnityMngInfo(@RequestBody FcltUnityMngInfoVO fcltUnityMngInfoVO, HttpServletRequest requset) throws Exception{
		logger.info("=============update=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltUnityMngInfoVO.setSysLastChgUserId(getUserId());
		fcltUnityMngInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltUnityMngInfoService.updateFcltUnityMngInfo(fcltUnityMngInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============update=====end========");
		return getSuccessResponseEntity(resultMap);
	}

	// 통합관리시스템 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltUnityMngInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltUnityMngInfo(@RequestBody FcltUnityMngInfoVO fcltUnityMngInfoVO, HttpServletRequest requset) throws Exception{
		logger.info("=============delete=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltUnityMngInfoVO.setSysLastChgUserId(getUserId());
		fcltUnityMngInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltUnityMngInfoService.deleteFcltUnityMngInfo(fcltUnityMngInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============delete=====end========");
		return getSuccessResponseEntity(resultMap);
	}

	// 통합관리시스템 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltUnityMngInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltUnityMngInfoList(@RequestBody List<FcltUnityMngInfoVO> fcltUnityMngInfoList, HttpServletRequest requset) throws Exception{
		logger.info("=============deleteList=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (FcltUnityMngInfoVO fcltUnityMngInfoVO : fcltUnityMngInfoList ) {
			fcltUnityMngInfoVO.setSysLastChgUserId(getUserId());
			fcltUnityMngInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		}



		int deletedCnt = 0;

		try {
			deletedCnt = fcltUnityMngInfoService.deleteFcltUnityMngInfoList(fcltUnityMngInfoList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============deleteList=====end========");
		return getSuccessResponseEntity(resultMap);
	}
}