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
import com.at.apcss.fm.fclt.service.FcltInstlInfoService;
import com.at.apcss.fm.fclt.vo.FcltInstlInfoVO;


/**
 * @Class Name : FcltInstlInfoController.java
 * @Description : 시설설치보완 대한 Controller 클래스
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
public class FcltInstlInfoController extends BaseController {


	// 시설설치보완
	@Resource(name= "fcltInstlInfoService")
	private FcltInstlInfoService fcltInstlInfoService;

	// 시설설치보완 화면이동
	@RequestMapping("/fm/fclt/fcltInstlInfo.do")
	public String doFcltInstlInfo() {
		return "apcss/fm/fclt/fcltInstlInfo";
	}

	// 시설설치보완 조회
	@PostMapping(value = "/fm/fclt/selectFcltInstlInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltInstlInfoVO fcltInstlInfoVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltInstlInfoVO> resultList = new ArrayList<>();

		try {
			 resultList = fcltInstlInfoService.selectFcltInstlInfoList(fcltInstlInfoVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltInstlInfoVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 시설설치보완 등록
	@PostMapping(value = "/fm/fclt/insertFcltInstlInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltInstlInfo(@RequestBody FcltInstlInfoVO fcltInstlInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltInstlInfoVO.setSysFrstInptUserId(getUserId());
		fcltInstlInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltInstlInfoVO.setSysLastChgUserId(getUserId());
		fcltInstlInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = fcltInstlInfoService.insertFcltInstlInfo(fcltInstlInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 시설설치보완 변경
	@PostMapping(value = "/fm/fclt/updateFcltInstlInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltInstlInfo(@RequestBody FcltInstlInfoVO fcltInstlInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltInstlInfoVO.setSysLastChgUserId(getUserId());
		fcltInstlInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltInstlInfoService.updateFcltInstlInfo(fcltInstlInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 시설설치보완 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltInstlInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltInstlInfo(@RequestBody FcltInstlInfoVO fcltInstlInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltInstlInfoVO.setSysLastChgUserId(getUserId());
		fcltInstlInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltInstlInfoService.deleteFcltInstlInfo(fcltInstlInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 시설설치보완 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltInstlInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltInstlInfoList(@RequestBody List<FcltInstlInfoVO> fcltInstlInfoList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (FcltInstlInfoVO fcltInstlInfoVO : fcltInstlInfoList ) {
			fcltInstlInfoVO.setSysLastChgUserId(getUserId());
			fcltInstlInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = fcltInstlInfoService.deleteFcltInstlInfoList(fcltInstlInfoList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}