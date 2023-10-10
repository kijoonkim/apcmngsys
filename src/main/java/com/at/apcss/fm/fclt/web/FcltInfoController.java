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
import com.at.apcss.fm.fclt.service.FcltInfoService;
import com.at.apcss.fm.fclt.vo.FcltInfoVO;


/**
 * @Class Name : FcltInfoController.java
 * @Description : 시설현황에 대한 Controller 클래스
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
public class FcltInfoController extends BaseController {


	// 시설현황
	@Resource(name= "fcltInfoService")
	private FcltInfoService fcltInfoService;

	// 시설현황 화면이동
	@GetMapping("/fm/fclt/fcltInfo.do")
	public String doFcltInfo() {
		return "apcss/fm/fclt/fcltInfo";
	}

	// 시설현황 조회
	@PostMapping(value = "/fm/fclt/selectFcltInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltInfoVO fcltInfoVO, HttpServletRequest request) throws Exception{
		logger.info("=============selectFcltInfoList=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltInfoVO> resultList = new ArrayList<>();

		logger.info(fcltInfoVO.getApcCd());
		logger.info(fcltInfoVO.toString());
		try {
			 resultList = fcltInfoService.selectFcltInfoList(fcltInfoVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltInfoVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		logger.info("=============selectFcltInfoList=====end========");
		return getSuccessResponseEntity(resultMap);
	}

	// 시설현황 등록
	@PostMapping(value = "/fm/fclt/insertFcltInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltInfo(@RequestBody FcltInfoVO fcltInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============insertFcltInfo=======start======");
		// validation check

		logger.info(fcltInfoVO.getTrgtYr());
		logger.info(fcltInfoVO.toString());
		// audit 항목
		fcltInfoVO.setSysFrstInptUserId(getUserId());
		fcltInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltInfoVO.setSysLastChgUserId(getUserId());
		fcltInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {


			logger.info("==========================");
			insertedCnt = fcltInfoService.insertFcltInfo(fcltInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);
		logger.info("=============insertFcltInfo=======end======");
		return getSuccessResponseEntity(resultMap);
	}

	// 시설현황 변경
	@PostMapping(value = "/fm/fclt/updateFcltInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltInfo(@RequestBody FcltInfoVO fcltInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============updateFcltInfo=========start====");
		// validation check

		// audit 항목
		fcltInfoVO.setSysLastChgUserId(getUserId());
		fcltInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		logger.info("");
		logger.info(fcltInfoVO.toString());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltInfoService.updateFcltInfo(fcltInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============updateFcltInfo======end=======");
		return getSuccessResponseEntity(resultMap);
	}

	// 시설현황 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltInfo(@RequestBody FcltInfoVO fcltInfoVO, HttpServletRequest requset) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltInfoVO.setSysLastChgUserId(getUserId());
		fcltInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltInfoService.deleteFcltInfo(fcltInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
	// 시설현황 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltInfoList(@RequestBody List<FcltInfoVO> fcltInfoList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============delete=====start========");
		// validation check

		// audit 항목
		for (FcltInfoVO fcltInfoVO : fcltInfoList ) {
			fcltInfoVO.setSysLastChgUserId(getUserId());
			fcltInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		}
		int deletedCnt = 0;

		try {
			deletedCnt = fcltInfoService.deleteFcltInfoList(fcltInfoList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============delete=====end========");
		return getSuccessResponseEntity(resultMap);
	}
}