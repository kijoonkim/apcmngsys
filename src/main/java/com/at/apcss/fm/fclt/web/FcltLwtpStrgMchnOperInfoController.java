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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.fclt.service.FcltLwtpStrgMchnOperInfoService;
import com.at.apcss.fm.fclt.vo.FcltLwtpStrgMchnOperInfoVO;


/**
 * @Class Name : FcltLwtpStrgMchnOperInfoController.java
 * @Description : 저온저장고운영기간에 대한 Controller 클래스
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
public class FcltLwtpStrgMchnOperInfoController extends BaseController {


	// 저온저장고운영기간
	@Resource(name= "fcltLwtpStrgMchnOperInfoService")
	private FcltLwtpStrgMchnOperInfoService fcltLwtpStrgMchnOperInfoService;

	// 저온저장고운영기간 화면이동
	@RequestMapping("/fm/fclt/fcltLwtpStrgMchnOperInfo.do")
	public String doFcltLwtpStrgMchnOperInfo() {
		return "apcss/fm/fclt/fcltLwtpStrgMchnOperInfo";
	}

	// 저온저장고운영기간 조회
	@PostMapping(value = "/fm/fclt/selectFcltLwtpStrgMchnOperInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltLwtpStrgMchnOperInfoVO> resultList = new ArrayList<>();

		try {
			 resultList = fcltLwtpStrgMchnOperInfoService.selectFcltLwtpStrgMchnOperInfoList(fcltLwtpStrgMchnOperInfoVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltLwtpStrgMchnOperInfoVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 저온저장고운영기간 등록
	@PostMapping(value = "/fm/fclt/insertFcltLwtpStrgMchnOperInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltLwtpStrgMchnOperInfo(@RequestBody FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltLwtpStrgMchnOperInfoVO.setSysFrstInptUserId(getUserId());
		fcltLwtpStrgMchnOperInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltLwtpStrgMchnOperInfoVO.setSysLastChgUserId(getUserId());
		fcltLwtpStrgMchnOperInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = fcltLwtpStrgMchnOperInfoService.insertFcltLwtpStrgMchnOperInfo(fcltLwtpStrgMchnOperInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 저온저장고운영기간 변경
	@PostMapping(value = "/fm/fclt/updateFcltLwtpStrgMchnOperInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltLwtpStrgMchnOperInfo(@RequestBody FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltLwtpStrgMchnOperInfoVO.setSysLastChgUserId(getUserId());
		fcltLwtpStrgMchnOperInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltLwtpStrgMchnOperInfoService.updateFcltLwtpStrgMchnOperInfo(fcltLwtpStrgMchnOperInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 저온저장고운영기간 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltLwtpStrgMchnOperInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltLwtpStrgMchnOperInfo(@RequestBody FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltLwtpStrgMchnOperInfoVO.setSysLastChgUserId(getUserId());
		fcltLwtpStrgMchnOperInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltLwtpStrgMchnOperInfoService.deleteFcltLwtpStrgMchnOperInfo(fcltLwtpStrgMchnOperInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 저온저장고운영기간 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltLwtpStrgMchnOperInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltLwtpStrgMchnOperInfoList(@RequestBody List<FcltLwtpStrgMchnOperInfoVO> fcltLwtpStrgMchnOperInfoList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (FcltLwtpStrgMchnOperInfoVO fcltLwtpStrgMchnOperInfoVO : fcltLwtpStrgMchnOperInfoList ) {
			fcltLwtpStrgMchnOperInfoVO.setSysLastChgUserId(getUserId());
			fcltLwtpStrgMchnOperInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = fcltLwtpStrgMchnOperInfoService.deleteFcltLwtpStrgMchnOperInfoList(fcltLwtpStrgMchnOperInfoList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}