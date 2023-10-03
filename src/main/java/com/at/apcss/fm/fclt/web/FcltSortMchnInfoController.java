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
import com.at.apcss.fm.fclt.service.FcltSortMchnInfoService;
import com.at.apcss.fm.fclt.vo.FcltSortMchnInfoVO;


/**
 * @Class Name : FcltSortMchnInfoController.java
 * @Description : 선별기운영에 대한 Controller 클래스
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
public class FcltSortMchnInfoController extends BaseController {


	// 선별기운영
	@Resource(name= "fcltSortMchnInfoService")
	private FcltSortMchnInfoService fcltSortMchnInfoService;

	// 선별기운영 화면이동
	@RequestMapping("/fm/fclt/fcltSortMchnInfo.do")
	public String doFcltSortMchnInfo() {
		return "apcss/fm/fclt/fcltSortMchnInfo";
	}

	// 선별기운영 조회
	@PostMapping(value = "/fm/fclt/selectFcltSortMchnInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltSortMchnInfoVO fcltSortMchnInfoVO, HttpServletRequest request) throws Exception{
		logger.info("=============selectMenuList=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltSortMchnInfoVO> resultList = new ArrayList<>();

		try {
			 resultList = fcltSortMchnInfoService.selectFcltSortMchnInfoList(fcltSortMchnInfoVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltSortMchnInfoVO msg : resultList ) {
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

	// 선별기운영 등록
	@PostMapping(value = "/fm/fclt/insertFcltSortMchnInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltSortMchnInfo(@RequestBody FcltSortMchnInfoVO fcltSortMchnInfoVO, HttpServletRequest requset) throws Exception{
		logger.info("=============insert=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltSortMchnInfoVO.setSysFrstInptUserId(getUserId());
		fcltSortMchnInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltSortMchnInfoVO.setSysLastChgUserId(getUserId());
		fcltSortMchnInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = fcltSortMchnInfoService.insertFcltSortMchnInfo(fcltSortMchnInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);
		logger.info("=============insert=====end========");
		return getSuccessResponseEntity(resultMap);
	}

	// 선별기운영 변경
	@PostMapping(value = "/fm/fclt/updateFcltSortMchnInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltSortMchnInfo(@RequestBody FcltSortMchnInfoVO fcltSortMchnInfoVO, HttpServletRequest requset) throws Exception{
		logger.info("=============update=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltSortMchnInfoVO.setSysLastChgUserId(getUserId());
		fcltSortMchnInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltSortMchnInfoService.updateFcltSortMchnInfo(fcltSortMchnInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============update=====end========");
		return getSuccessResponseEntity(resultMap);
	}

	// 선별기운영 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltSortMchnInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltSortMchnInfo(@RequestBody FcltSortMchnInfoVO fcltSortMchnInfoVO, HttpServletRequest requset) throws Exception{
		logger.info("=============delete=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltSortMchnInfoVO.setSysLastChgUserId(getUserId());
		fcltSortMchnInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltSortMchnInfoService.deleteFcltSortMchnInfo(fcltSortMchnInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============delete=====end========");
		return getSuccessResponseEntity(resultMap);
	}

	// 선별기운영 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltSortMchnInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltSortMchnInfoList(@RequestBody List<FcltSortMchnInfoVO> fcltSortMchnInfoList, HttpServletRequest requset) throws Exception{
		logger.info("=============deleteList=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (FcltSortMchnInfoVO fcltSortMchnInfoVO : fcltSortMchnInfoList ) {
			fcltSortMchnInfoVO.setSysLastChgUserId(getUserId());
			fcltSortMchnInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = fcltSortMchnInfoService.deleteFcltSortMchnInfoList(fcltSortMchnInfoList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============deleteList=====end========");
		return getSuccessResponseEntity(resultMap);
	}
}