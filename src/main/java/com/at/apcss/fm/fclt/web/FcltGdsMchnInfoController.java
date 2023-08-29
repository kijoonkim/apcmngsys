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
import com.at.apcss.fm.fclt.service.FcltGdsMchnInfoService;
import com.at.apcss.fm.fclt.vo.FcltGdsMchnInfoVO;


/**
 * @Class Name : FcltGdsMchnInfoController.java
 * @Description : 상품화설비현황에 대한 Controller 클래스
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
public class FcltGdsMchnInfoController extends BaseController {


	// 상품화설비현황
	@Resource(name= "fcltGdsMchnInfoService")
	private FcltGdsMchnInfoService fcltGdsMchnInfoService;

	// 상품화설비현황 화면이동
	@RequestMapping("/fm/fclt/fcltGdsMchnInfo.do")
	public String doFcltGdsMchnInfo() {
		return "apcss/fm/fclt/fcltGdsMchnInfo";
	}

	// 상품화설비현황 조회
	@PostMapping(value = "/fm/fclt/selectFcltGdsMchnInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltGdsMchnInfoVO fcltGdsMchnInfoVO, HttpServletRequest request) throws Exception{
		logger.info("=============selectFcltGdsMchnInfo=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltGdsMchnInfoVO> resultList = new ArrayList<>();

		try {
			 resultList = fcltGdsMchnInfoService.selectFcltGdsMchnInfoList(fcltGdsMchnInfoVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltGdsMchnInfoVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		logger.info("=============selectFcltGdsMchnInfo=====end========");
		return getSuccessResponseEntity(resultMap);
	}

	// 상품화설비현황 등록
	@PostMapping(value = "/fm/fclt/insertFcltGdsMchnInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltGdsMchnInfo(@RequestBody FcltGdsMchnInfoVO fcltGdsMchnInfoVO, HttpServletRequest requset) throws Exception{
		logger.info("=============insertFcltInfo=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		// validation check

		// audit 항목
		fcltGdsMchnInfoVO.setSysFrstInptUserId(getUserId());
		fcltGdsMchnInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltGdsMchnInfoVO.setSysLastChgUserId(getUserId());
		fcltGdsMchnInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = fcltGdsMchnInfoService.insertFcltGdsMchnInfo(fcltGdsMchnInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);
		logger.info("=============insertFcltInfo=====end========");
		return getSuccessResponseEntity(resultMap);
	}

	// 상품화설비현황 변경
	@PostMapping(value = "/fm/fclt/updateFcltGdsMchnInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltGdsMchnInfo(@RequestBody FcltGdsMchnInfoVO fcltGdsMchnInfoVO, HttpServletRequest requset) throws Exception{
		logger.info("=============updateFcltInfo=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltGdsMchnInfoVO.setSysLastChgUserId(getUserId());
		fcltGdsMchnInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltGdsMchnInfoService.updateFcltGdsMchnInfo(fcltGdsMchnInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============updateFcltInfo=====end========");
		return getSuccessResponseEntity(resultMap);
	}

	// 상품화설비현황 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltGdsMchnInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltGdsMchnInfo(@RequestBody FcltGdsMchnInfoVO fcltGdsMchnInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltGdsMchnInfoVO.setSysLastChgUserId(getUserId());
		fcltGdsMchnInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltGdsMchnInfoService.deleteFcltGdsMchnInfo(fcltGdsMchnInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 상품화설비현황 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltGdsMchnInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltGdsMchnInfoList(@RequestBody List<FcltGdsMchnInfoVO> fcltGdsMchnInfoList, HttpServletRequest requset) throws Exception{
		logger.info("=============delete=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (FcltGdsMchnInfoVO fcltGdsMchnInfoVO : fcltGdsMchnInfoList ) {
			fcltGdsMchnInfoVO.setSysLastChgUserId(getUserId());
			fcltGdsMchnInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = fcltGdsMchnInfoService.deleteFcltGdsMchnInfoList(fcltGdsMchnInfoList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============delete=====end========");
		return getSuccessResponseEntity(resultMap);
	}
}