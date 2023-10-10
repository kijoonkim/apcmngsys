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
import com.at.apcss.fm.fclt.service.FcltOgnzItemPrfmncService;
import com.at.apcss.fm.fclt.vo.FcltOgnzItemPrfmncVO;


/**
 * @Class Name : FcltOgnzItemPrfmncController.java
 * @Description : 유통품목처리실적 대한 Controller 클래스
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
public class FcltOgnzItemPrfmncController extends BaseController {


	// 유통품목처리실적
	@Resource(name= "fcltOgnzItemPrfmncService")
	private FcltOgnzItemPrfmncService fcltOgnzItemPrfmncService;

	// 유통품목처리실적 화면이동
	@GetMapping("/fm/fclt/fcltOgnzItemPrfmnc.do")
	public String doFcltOgnzItemPrfmnc() {
		return "apcss/fm/fclt/fcltOgnzItemPrfmnc";
	}

	// 유통품목처리실적 조회
	@PostMapping(value = "/fm/fclt/selectFcltOgnzItemPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO, HttpServletRequest request) throws Exception{
		logger.info("=============select=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltOgnzItemPrfmncVO> resultList = new ArrayList<>();

		try {
			 resultList = fcltOgnzItemPrfmncService.selectFcltOgnzItemPrfmncList(fcltOgnzItemPrfmncVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltOgnzItemPrfmncVO msg : resultList ) {
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

	// 유통품목처리실적 등록
	@PostMapping(value = "/fm/fclt/insertFcltOgnzItemPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltOgnzItemPrfmnc(@RequestBody FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO, HttpServletRequest requset) throws Exception{
		logger.info("=============insert=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltOgnzItemPrfmncVO.setSysFrstInptUserId(getUserId());
		fcltOgnzItemPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltOgnzItemPrfmncVO.setSysLastChgUserId(getUserId());
		fcltOgnzItemPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = fcltOgnzItemPrfmncService.insertFcltOgnzItemPrfmnc(fcltOgnzItemPrfmncVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);
		logger.info("=============insert=====end========");

		return getSuccessResponseEntity(resultMap);
	}

	// 유통품목처리실적 변경
	@PostMapping(value = "/fm/fclt/updateFcltOgnzItemPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltOgnzItemPrfmnc(@RequestBody FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============update=====start========");

		// validation check

		// audit 항목
		fcltOgnzItemPrfmncVO.setSysLastChgUserId(getUserId());
		fcltOgnzItemPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltOgnzItemPrfmncService.updateFcltOgnzItemPrfmnc(fcltOgnzItemPrfmncVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============update=====end========");

		return getSuccessResponseEntity(resultMap);
	}

	// 유통품목처리실적 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltOgnzItemPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltOgnzItemPrfmnc(@RequestBody FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO, HttpServletRequest requset) throws Exception{
		logger.info("=============delete=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltOgnzItemPrfmncVO.setSysLastChgUserId(getUserId());
		fcltOgnzItemPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltOgnzItemPrfmncService.deleteFcltOgnzItemPrfmnc(fcltOgnzItemPrfmncVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============delete=====end========");

		return getSuccessResponseEntity(resultMap);
	}

	// 유통품목처리실적 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltOgnzItemPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltOgnzItemPrfmncList(@RequestBody List<FcltOgnzItemPrfmncVO> fcltOgnzItemPrfmncList, HttpServletRequest requset) throws Exception{
		logger.info("=============deleteList=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (FcltOgnzItemPrfmncVO fcltOgnzItemPrfmncVO : fcltOgnzItemPrfmncList ) {
			fcltOgnzItemPrfmncVO.setSysLastChgUserId(getUserId());
			fcltOgnzItemPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = fcltOgnzItemPrfmncService.deleteFcltOgnzItemPrfmncList(fcltOgnzItemPrfmncList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============deleteList=====end========");

		return getSuccessResponseEntity(resultMap);
	}
}