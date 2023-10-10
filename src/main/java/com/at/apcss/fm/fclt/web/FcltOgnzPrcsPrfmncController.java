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
import com.at.apcss.fm.fclt.service.FcltOgnzPrcsPrfmncService;
import com.at.apcss.fm.fclt.vo.FcltOgnzPrcsPrfmncVO;


/**
 * @Class Name : FcltOgnzPrcsPrfmncController.java
 * @Description : 유통조직처리실적에 대한 Controller 클래스
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
public class FcltOgnzPrcsPrfmncController extends BaseController {


	// 유통조직처리실적
	@Resource(name= "fcltOgnzPrcsPrfmncService")
	private FcltOgnzPrcsPrfmncService fcltOgnzPrcsPrfmncService;

	// 유통조직처리실적 화면이동
	@GetMapping("/fm/fclt/fcltOgnzPrcsPrfmnc.do")
	public String doFcltOgnzPrcsPrfmnc() {
		return "apcss/fm/fclt/fcltOgnzPrcsPrfmnc";
	}

	// 유통조직처리실적 조회
	@PostMapping(value = "/fm/fclt/selectFcltOgnzPrcsPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO, HttpServletRequest request) throws Exception{
		logger.info("=============select=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltOgnzPrcsPrfmncVO> resultList = new ArrayList<>();

		try {
			 resultList = fcltOgnzPrcsPrfmncService.selectFcltOgnzPrcsPrfmncList(fcltOgnzPrcsPrfmncVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltOgnzPrcsPrfmncVO msg : resultList ) {
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
	// 유통조직처리실적 등록
	@PostMapping(value = "/fm/fclt/insertFcltOgnzPrcsPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltOgnzPrcsPrfmnc(@RequestBody FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO, HttpServletRequest requset) throws Exception{
		logger.info("=============insert=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltOgnzPrcsPrfmncVO.setSysFrstInptUserId(getUserId());
		fcltOgnzPrcsPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltOgnzPrcsPrfmncVO.setSysLastChgUserId(getUserId());
		fcltOgnzPrcsPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = fcltOgnzPrcsPrfmncService.insertFcltOgnzPrcsPrfmnc(fcltOgnzPrcsPrfmncVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);
		logger.info("=============insert=====end========");

		return getSuccessResponseEntity(resultMap);
	}

	// 유통조직처리실적 변경
	@PostMapping(value = "/fm/fclt/updateFcltOgnzPrcsPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltOgnzPrcsPrfmnc(@RequestBody FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO, HttpServletRequest requset) throws Exception{
		logger.info("=============update=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltOgnzPrcsPrfmncVO.setSysLastChgUserId(getUserId());
		fcltOgnzPrcsPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltOgnzPrcsPrfmncService.updateFcltOgnzPrcsPrfmnc(fcltOgnzPrcsPrfmncVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============update=====end========");

		return getSuccessResponseEntity(resultMap);
	}

	// 유통조직처리실적 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltOgnzPrcsPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltOgnzPrcsPrfmnc(@RequestBody FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO, HttpServletRequest requset) throws Exception{
		logger.info("=============delete=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltOgnzPrcsPrfmncVO.setSysLastChgUserId(getUserId());
		fcltOgnzPrcsPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltOgnzPrcsPrfmncService.deleteFcltOgnzPrcsPrfmnc(fcltOgnzPrcsPrfmncVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============delete=====end========");

		return getSuccessResponseEntity(resultMap);
	}

	// 유통조직처리실적 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltOgnzPrcsPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltOgnzPrcsPrfmncList(@RequestBody List<FcltOgnzPrcsPrfmncVO> fcltOgnzPrcsPrfmncList, HttpServletRequest requset) throws Exception{
		logger.info("=============deleteList=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (FcltOgnzPrcsPrfmncVO fcltOgnzPrcsPrfmncVO : fcltOgnzPrcsPrfmncList ) {
			fcltOgnzPrcsPrfmncVO.setSysLastChgUserId(getUserId());
			fcltOgnzPrcsPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = fcltOgnzPrcsPrfmncService.deleteFcltOgnzPrcsPrfmncList(fcltOgnzPrcsPrfmncList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============deleteList=====end========");

		return getSuccessResponseEntity(resultMap);
	}
}