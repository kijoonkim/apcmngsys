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
import com.at.apcss.fm.fclt.service.FcltSortMchnOperInfoService;
import com.at.apcss.fm.fclt.vo.FcltSortMchnOperInfoVO;


/**
 * @Class Name : FcltSortMchnOperInfoController.java
 * @Description : 선별기운영기간에 대한 Controller 클래스
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
public class FcltSortMchnOperInfoController extends BaseController {


	// 선별기운영기간
	@Resource(name= "fcltSortMchnOperInfoService")
	private FcltSortMchnOperInfoService fcltSortMchnOperInfoService;

	// 선별기운영기간 화면이동
	@RequestMapping("/fm/fclt/fcltSortMchnOperInfo.do")
	public String doFcltSortMchnOperInfo() {
		return "apcss/fm/fclt/fcltSortMchnOperInfo";
	}

	// 선별기운영기간 조회
	@PostMapping(value = "/fm/fclt/selectFcltSortMchnOperInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltSortMchnOperInfoVO> resultList = new ArrayList<>();

		try {
			 resultList = fcltSortMchnOperInfoService.selectFcltSortMchnOperInfoList(fcltSortMchnOperInfoVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltSortMchnOperInfoVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 선별기운영기간 등록
	@PostMapping(value = "/fm/fclt/insertFcltSortMchnOperInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltSortMchnOperInfo(@RequestBody FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltSortMchnOperInfoVO.setSysFrstInptUserId(getUserId());
		fcltSortMchnOperInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltSortMchnOperInfoVO.setSysLastChgUserId(getUserId());
		fcltSortMchnOperInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = fcltSortMchnOperInfoService.insertFcltSortMchnOperInfo(fcltSortMchnOperInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 선별기운영기간 변경
	@PostMapping(value = "/fm/fclt/updateFcltSortMchnOperInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltSortMchnOperInfo(@RequestBody FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltSortMchnOperInfoVO.setSysLastChgUserId(getUserId());
		fcltSortMchnOperInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltSortMchnOperInfoService.updateFcltSortMchnOperInfo(fcltSortMchnOperInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 선별기운영기간 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltSortMchnOperInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltSortMchnOperInfo(@RequestBody FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltSortMchnOperInfoVO.setSysLastChgUserId(getUserId());
		fcltSortMchnOperInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltSortMchnOperInfoService.deleteFcltSortMchnOperInfo(fcltSortMchnOperInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 선별기운영기간 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltSortMchnOperInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltSortMchnOperInfoList(@RequestBody List<FcltSortMchnOperInfoVO> fcltSortMchnOperInfoList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (FcltSortMchnOperInfoVO fcltSortMchnOperInfoVO : fcltSortMchnOperInfoList ) {
			fcltSortMchnOperInfoVO.setSysLastChgUserId(getUserId());
			fcltSortMchnOperInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = fcltSortMchnOperInfoService.deleteFcltSortMchnOperInfoList(fcltSortMchnOperInfoList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}