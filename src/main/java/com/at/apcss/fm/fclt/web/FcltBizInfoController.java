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

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.fclt.service.FcltBizInfoService;
import com.at.apcss.fm.fclt.vo.FcltBizInfoVO;


/**
 * @Class Name : FcltBizInfoController.java
 * @Description : 지원사업에 대한 Controller 클래스
 * @author ljw
 * @since 2024.07.30
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.30  ljw        최초 생성
 * </pre>
 */
@Controller
public class FcltBizInfoController extends BaseController {


	// 지원사업
	@Resource(name= "fcltBizInfoService")
	private FcltBizInfoService fcltBizInfoService;

	// 지원사업 조회
	@PostMapping(value = "/fm/fclt/popup/selectFcltBizInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFcltBizInfoList(Model model, @RequestBody FcltBizInfoVO bizInfoVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltBizInfoVO> resultList = new ArrayList<>();

		try {
			resultList = fcltBizInfoService.selectFcltBizInfoList(bizInfoVO);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 지원사업 등록
	@PostMapping(value = "/fm/fclt/popup/insertFcltBizInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltBizInfo(@RequestBody FcltBizInfoVO bizInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		bizInfoVO.setSysFrstInptUserId(getUserId());
		bizInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		bizInfoVO.setSysLastChgUserId(getUserId());
		bizInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = fcltBizInfoService.insertFcltBizInfo(bizInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 지원사업 변경
	@PostMapping(value = "/fm/fclt/popup/updateFcltBizInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltBizInfo(@RequestBody FcltBizInfoVO bizInfoVO, HttpServletRequest requset) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		bizInfoVO.setSysLastChgUserId(getUserId());
		bizInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltBizInfoService.updateFcltBizInfo(bizInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	// 지원사업 삭제
	@PostMapping(value = "/fm/fclt/popup/deleteFcltBizInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltBizInfo(@RequestBody FcltBizInfoVO bizInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		bizInfoVO.setSysLastChgUserId(getUserId());
		bizInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltBizInfoService.deleteFcltBizInfo(bizInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 지원사업 목록 삭제
	@PostMapping(value = "/fm/fclt/popup/deleteFcltBizInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltBizInfoList(@RequestBody List<FcltBizInfoVO> bizInfoList, HttpServletRequest requset) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (FcltBizInfoVO bizInfoVO : bizInfoList ) {
			bizInfoVO.setSysLastChgUserId(getUserId());
			bizInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = fcltBizInfoService.deleteFcltBizInfoList(bizInfoList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		return getSuccessResponseEntity(resultMap);
	}


}