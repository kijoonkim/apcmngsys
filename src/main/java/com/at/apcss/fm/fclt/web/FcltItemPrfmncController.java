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
import com.at.apcss.fm.fclt.service.FcltItemPrfmncService;
import com.at.apcss.fm.fclt.vo.FcltItemPrfmncVO;


/**
 * @Class Name : FcltItemPrfmncController.java
 * @Description : 산지유통품목처리실적에 대한 Controller 클래스
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
public class FcltItemPrfmncController extends BaseController {


	// 산지유통품목처리실적
	@Resource(name= "fcltItemPrfmncService")
	private FcltItemPrfmncService fcltItemPrfmncService;

	// 산지유통품목처리실적 화면이동
	@RequestMapping("/fm/fclt/fcltItemPrfmnc.do")
	public String doFcltItemPrfmnc() {
		return "apcss/fm/fclt/fcltItemPrfmnc";
	}

	// 산지유통품목처리실적 조회
	@PostMapping(value = "/fm/fclt/selectFcltItemPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltItemPrfmncVO fcltItemPrfmncVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltItemPrfmncVO> resultList = new ArrayList<>();

		try {
			 resultList = fcltItemPrfmncService.selectFcltItemPrfmncList(fcltItemPrfmncVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltItemPrfmncVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 산지유통품목처리실적 등록
	@PostMapping(value = "/fm/fclt/insertFcltItemPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltItemPrfmnc(@RequestBody FcltItemPrfmncVO fcltItemPrfmncVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltItemPrfmncVO.setSysFrstInptUserId(getUserId());
		fcltItemPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltItemPrfmncVO.setSysLastChgUserId(getUserId());
		fcltItemPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = fcltItemPrfmncService.insertFcltItemPrfmnc(fcltItemPrfmncVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 산지유통품목처리실적 변경
	@PostMapping(value = "/fm/fclt/updateFcltItemPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltItemPrfmnc(@RequestBody FcltItemPrfmncVO fcltItemPrfmncVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltItemPrfmncVO.setSysLastChgUserId(getUserId());
		fcltItemPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltItemPrfmncService.updateFcltItemPrfmnc(fcltItemPrfmncVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 산지유통품목처리실적 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltItemPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltItemPrfmnc(@RequestBody FcltItemPrfmncVO fcltItemPrfmncVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltItemPrfmncVO.setSysLastChgUserId(getUserId());
		fcltItemPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltItemPrfmncService.deleteFcltItemPrfmnc(fcltItemPrfmncVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 산지유통품목처리실적 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltItemPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltItemPrfmncList(@RequestBody List<FcltItemPrfmncVO> fcltItemPrfmncList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (FcltItemPrfmncVO fcltItemPrfmncVO : fcltItemPrfmncList ) {
			fcltItemPrfmncVO.setSysLastChgUserId(getUserId());
			fcltItemPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = fcltItemPrfmncService.deleteFcltItemPrfmncList(fcltItemPrfmncList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}