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
import com.at.apcss.fm.fclt.service.FcltLwtpStrgMchnInfoService;
import com.at.apcss.fm.fclt.vo.FcltLwtpStrgMchnInfoVO;


/**
 * @Class Name : FcltLwtpStrgMchnInfoController.java
 * @Description : 저온저장고운영에 대한 Controller 클래스
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
public class FcltLwtpStrgMchnInfoController extends BaseController {


	// 저온저장고운영
	@Resource(name= "fcltLwtpStrgMchnInfoService")
	private FcltLwtpStrgMchnInfoService fcltLwtpStrgMchnInfoService;

	// 저온저장고운영 화면이동
	@RequestMapping("/fm/fclt/fcltLwtpStrgMchnInfo.do")
	public String doFcltLwtpStrgMchnInfo() {
		return "apcss/fm/fclt/fcltLwtpStrgMchnInfo";
	}

	// 저온저장고운영 조회
	@PostMapping(value = "/fm/fclt/selectFcltLwtpStrgMchnInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltLwtpStrgMchnInfoVO> resultList = new ArrayList<>();

		try {
			 resultList = fcltLwtpStrgMchnInfoService.selectFcltLwtpStrgMchnInfoList(fcltLwtpStrgMchnInfoVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltLwtpStrgMchnInfoVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 저온저장고운영 등록
	@PostMapping(value = "/fm/fclt/insertFcltLwtpStrgMchnInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltLwtpStrgMchnInfo(@RequestBody FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltLwtpStrgMchnInfoVO.setSysFrstInptUserId(getUserId());
		fcltLwtpStrgMchnInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltLwtpStrgMchnInfoVO.setSysLastChgUserId(getUserId());
		fcltLwtpStrgMchnInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = fcltLwtpStrgMchnInfoService.insertFcltLwtpStrgMchnInfo(fcltLwtpStrgMchnInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 저온저장고운영 변경
	@PostMapping(value = "/fm/fclt/updateFcltLwtpStrgMchnInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltLwtpStrgMchnInfo(@RequestBody FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltLwtpStrgMchnInfoVO.setSysLastChgUserId(getUserId());
		fcltLwtpStrgMchnInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltLwtpStrgMchnInfoService.updateFcltLwtpStrgMchnInfo(fcltLwtpStrgMchnInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 저온저장고운영 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltLwtpStrgMchnInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltLwtpStrgMchnInfo(@RequestBody FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltLwtpStrgMchnInfoVO.setSysLastChgUserId(getUserId());
		fcltLwtpStrgMchnInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltLwtpStrgMchnInfoService.deleteFcltLwtpStrgMchnInfo(fcltLwtpStrgMchnInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 저온저장고운영 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltLwtpStrgMchnInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltLwtpStrgMchnInfoList(@RequestBody List<FcltLwtpStrgMchnInfoVO> fcltLwtpStrgMchnInfoList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (FcltLwtpStrgMchnInfoVO fcltLwtpStrgMchnInfoVO : fcltLwtpStrgMchnInfoList ) {
			fcltLwtpStrgMchnInfoVO.setSysLastChgUserId(getUserId());
			fcltLwtpStrgMchnInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = fcltLwtpStrgMchnInfoService.deleteFcltLwtpStrgMchnInfoList(fcltLwtpStrgMchnInfoList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}