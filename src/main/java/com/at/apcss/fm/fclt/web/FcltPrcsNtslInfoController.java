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
import com.at.apcss.fm.fclt.service.FcltPrcsNtslInfoService;
import com.at.apcss.fm.fclt.vo.FcltPrcsNtslInfoVO;


/**
 * @Class Name : FcltPrcsNtslInfoController.java
 * @Description : 산지유통판매처에 대한 Controller 클래스
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
public class FcltPrcsNtslInfoController extends BaseController {


	// 산지유통판매처
	@Resource(name= "fcltPrcsNtslInfoService")
	private FcltPrcsNtslInfoService fcltPrcsNtslInfoService;

	// 산지유통판매처 화면이동
	@GetMapping("/fm/fclt/fcltPrcsNtslInfo.do")
	public String doFcltPrcsNtslInfo() {
		return "apcss/fm/fclt/fcltPrcsNtslInfo";
	}

	// 산지유통판매처 조회
	@PostMapping(value = "/fm/fclt/selectFcltPrcsNtslInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO, HttpServletRequest request) throws Exception{
		logger.info("=============select=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltPrcsNtslInfoVO> resultList = new ArrayList<>();

		try {
			 resultList = fcltPrcsNtslInfoService.selectFcltPrcsNtslInfoList(fcltPrcsNtslInfoVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltPrcsNtslInfoVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		logger.info("=============select=====end========");

		return getSuccessResponseEntity(resultMap);
	}

	// 산지유통판매처 등록
	@PostMapping(value = "/fm/fclt/insertFcltPrcsNtslInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltPrcsNtslInfo(@RequestBody FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO, HttpServletRequest requset) throws Exception{
		logger.info("=============insert=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltPrcsNtslInfoVO.setSysFrstInptUserId(getUserId());
		fcltPrcsNtslInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltPrcsNtslInfoVO.setSysLastChgUserId(getUserId());
		fcltPrcsNtslInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = fcltPrcsNtslInfoService.insertFcltPrcsNtslInfo(fcltPrcsNtslInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);
		logger.info("=============insert=====end========");

		return getSuccessResponseEntity(resultMap);
	}

	// 산지유통판매처 변경
	@PostMapping(value = "/fm/fclt/updateFcltPrcsNtslInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltPrcsNtslInfo(@RequestBody FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO, HttpServletRequest requset) throws Exception{
		logger.info("=============update=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltPrcsNtslInfoVO.setSysLastChgUserId(getUserId());
		fcltPrcsNtslInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltPrcsNtslInfoService.updateFcltPrcsNtslInfo(fcltPrcsNtslInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============update=====end========");

		return getSuccessResponseEntity(resultMap);
	}

	// 산지유통판매처 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltPrcsNtslInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltPrcsNtslInfo(@RequestBody FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO, HttpServletRequest requset) throws Exception{
		logger.info("=============delete=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltPrcsNtslInfoVO.setSysLastChgUserId(getUserId());
		fcltPrcsNtslInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltPrcsNtslInfoService.deleteFcltPrcsNtslInfo(fcltPrcsNtslInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============delete=====end========");

		return getSuccessResponseEntity(resultMap);
	}

	// 산지유통판매처 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltPrcsNtslInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltPrcsNtslInfoList(@RequestBody List<FcltPrcsNtslInfoVO> fcltPrcsNtslInfoList, HttpServletRequest requset) throws Exception{
		logger.info("=============deleteList=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (FcltPrcsNtslInfoVO fcltPrcsNtslInfoVO : fcltPrcsNtslInfoList ) {
			fcltPrcsNtslInfoVO.setSysLastChgUserId(getUserId());
			fcltPrcsNtslInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = fcltPrcsNtslInfoService.deleteFcltPrcsNtslInfoList(fcltPrcsNtslInfoList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============deleteList=====end========");

		return getSuccessResponseEntity(resultMap);
	}
}