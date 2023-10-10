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
import com.at.apcss.fm.fclt.service.FcltPrcsPrfmncService;
import com.at.apcss.fm.fclt.vo.FcltPrcsPrfmncVO;


/**
 * @Class Name : FcltPrcsPrfmncController.java
 * @Description : 산지유통처리실적에 대한 Controller 클래스
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
public class FcltPrcsPrfmncController extends BaseController {


	// 산지유통처리실적
	@Resource(name= "fcltPrcsPrfmncService")
	private FcltPrcsPrfmncService fcltPrcsPrfmncService;

	// 산지유통처리실적 화면이동
	@GetMapping("/fm/fclt/fcltPrcsPrfmnc.do")
	public String doFcltPrcsPrfmnc() {
		return "apcss/fm/fclt/fcltPrcsPrfmnc";
	}

	// 산지유통처리실적 조회
	@PostMapping(value = "/fm/fclt/selectFcltPrcsPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltPrcsPrfmncVO fcltPrcsPrfmncVO, HttpServletRequest request) throws Exception{
		logger.info("=============select=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltPrcsPrfmncVO> resultList = new ArrayList<>();

		try {
			 resultList = fcltPrcsPrfmncService.selectFcltPrcsPrfmncList(fcltPrcsPrfmncVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltPrcsPrfmncVO msg : resultList ) {
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

	// 산지유통처리실적 등록
	@PostMapping(value = "/fm/fclt/insertFcltPrcsPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltPrcsPrfmnc(@RequestBody FcltPrcsPrfmncVO fcltPrcsPrfmncVO, HttpServletRequest requset) throws Exception{
		logger.info("=============insert=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltPrcsPrfmncVO.setSysFrstInptUserId(getUserId());
		fcltPrcsPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltPrcsPrfmncVO.setSysLastChgUserId(getUserId());
		fcltPrcsPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = fcltPrcsPrfmncService.insertFcltPrcsPrfmnc(fcltPrcsPrfmncVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);
		logger.info("=============insert=====end========");

		return getSuccessResponseEntity(resultMap);
	}

	// 산지유통처리실적 변경
	@PostMapping(value = "/fm/fclt/updateFcltPrcsPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltPrcsPrfmnc(@RequestBody FcltPrcsPrfmncVO fcltPrcsPrfmncVO, HttpServletRequest requset) throws Exception{
		logger.info("=============update=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltPrcsPrfmncVO.setSysLastChgUserId(getUserId());
		fcltPrcsPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltPrcsPrfmncService.updateFcltPrcsPrfmnc(fcltPrcsPrfmncVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============update=====end========");

		return getSuccessResponseEntity(resultMap);
	}

	// 산지유통처리실적 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltPrcsPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltPrcsPrfmnc(@RequestBody FcltPrcsPrfmncVO fcltPrcsPrfmncVO, HttpServletRequest requset) throws Exception{
		logger.info("=============delete=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltPrcsPrfmncVO.setSysLastChgUserId(getUserId());
		fcltPrcsPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltPrcsPrfmncService.deleteFcltPrcsPrfmnc(fcltPrcsPrfmncVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============delete=====end========");

		return getSuccessResponseEntity(resultMap);
	}

	// 산지유통처리실적 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltPrcsPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltPrcsPrfmncList(@RequestBody List<FcltPrcsPrfmncVO> fcltPrcsPrfmncList, HttpServletRequest requset) throws Exception{
		logger.info("=============deleteList=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (FcltPrcsPrfmncVO fcltPrcsPrfmncVO : fcltPrcsPrfmncList ) {
			fcltPrcsPrfmncVO.setSysLastChgUserId(getUserId());
			fcltPrcsPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = fcltPrcsPrfmncService.deleteFcltPrcsPrfmncList(fcltPrcsPrfmncList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============deleteList=====end========");

		return getSuccessResponseEntity(resultMap);
	}
}