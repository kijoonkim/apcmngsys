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
import com.at.apcss.fm.fclt.service.FcltInstlInfoCurntStnService;
import com.at.apcss.fm.fclt.vo.FcltInstlInfoCurntStnVO;


/**
 * @Class Name : FcltInstlInfoCurntStnController.java
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
public class FcltInstlInfoCurntStnController extends BaseController {


	// 시설설치보완
	@Resource(name= "fcltInstlInfoCurntStnService")
	private FcltInstlInfoCurntStnService fcltInstlInfoCurntStnService;

	// 시설설치보완 화면이동
	@GetMapping("/fm/fclt/fcltInstlInfoCurntStn.do")
	public String doFcltInstlInfoCurntStn() {
		return "apcss/fm/fclt/fcltInstlInfoCurntStn";
	}

	// 시설설치보완 조회
	@PostMapping(value = "/fm/fclt/selectFcltInstlInfoCurntStnList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO, HttpServletRequest request) throws Exception{
		logger.info("=============selectFcltInstlinfo=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltInstlInfoCurntStnVO> resultList = new ArrayList<>();

		try {
			 resultList = fcltInstlInfoCurntStnService.selectFcltInstlInfoCurntStnList(fcltInstlInfoCurntStnVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltInstlInfoCurntStnVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		logger.info("=============selectFcltInstlinfo=====end========");
		return getSuccessResponseEntity(resultMap);
	}

	// 시설설치보완 등록
	@PostMapping(value = "/fm/fclt/insertFcltInstlInfoCurntStn.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltInstlInfoCurntStn(@RequestBody FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO, HttpServletRequest requset) throws Exception{
		logger.info("=============insertFcltInstlinfo=====start========");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int insertedCnt = 0;

		try {
			insertedCnt = fcltInstlInfoCurntStnService.insertFcltInstlInfoCurntStn(fcltInstlInfoCurntStnVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);
		logger.info("=============insertFcltInstlinfo=====end========");

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/fm/fclt/insertFcltInstlInfoCurntStnList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltInstlInfoCurntStnList(@RequestBody List<FcltInstlInfoCurntStnVO> fcltInstlInfoCurntStnList, HttpServletRequest requset) throws Exception {
	    logger.info("=============insertFcltInstlInfoCurntStnList=====start========");

	    HashMap<String, Object> resultMap = new HashMap<String, Object>();

	    int totalInsertedCnt = 0;

	    try {
	        for (FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO : fcltInstlInfoCurntStnList) {
	            int insertedCnt = fcltInstlInfoCurntStnService.insertFcltInstlInfoCurntStn(fcltInstlInfoCurntStnVO);
	            totalInsertedCnt += insertedCnt;
	        }
	    } catch (Exception e) {
	        logger.debug(e.getMessage());
	        return getErrorResponseEntity(e);
	    }

	    resultMap.put(ComConstants.PROP_INSERTED_CNT, totalInsertedCnt);
	    logger.info("=============insertFcltInstlInfoCurntStnList=====end========");

	    return getSuccessResponseEntity(resultMap);
	}


	// 시설설치보완 변경
	@PostMapping(value = "/fm/fclt/updateFcltInstlInfoCurntStn.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltInstlInfoCurntStn(@RequestBody FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO, HttpServletRequest requset) throws Exception{
		logger.info("=============updateFcltInstlinfo=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltInstlInfoCurntStnVO.setSysLastChgUserId(getUserId());
		fcltInstlInfoCurntStnVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltInstlInfoCurntStnService.updateFcltInstlInfoCurntStn(fcltInstlInfoCurntStnVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============updateFcltInstlinfo=====end========");
		return getSuccessResponseEntity(resultMap);
	}

	// 시설설치보완 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltInstlInfoCurntStn.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltInstlInfoCurntStn(@RequestBody FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO, HttpServletRequest requset) throws Exception{
		logger.info("=============deleteFcltInstlinfo=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltInstlInfoCurntStnVO.setSysLastChgUserId(getUserId());
		fcltInstlInfoCurntStnVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltInstlInfoCurntStnService.deleteFcltInstlInfoCurntStn(fcltInstlInfoCurntStnVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============deleteFcltInstlinfo=====end========");
		return getSuccessResponseEntity(resultMap);
	}

	// 시설설치보완 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltInstlInfoCurntStnList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltInstlInfoCurntStnList(@RequestBody List<FcltInstlInfoCurntStnVO> fcltInstlInfoCurntStnList, HttpServletRequest requset) throws Exception{
		logger.info("=============deleteFcltInstlinfoList=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (FcltInstlInfoCurntStnVO fcltInstlInfoCurntStnVO : fcltInstlInfoCurntStnList ) {
			fcltInstlInfoCurntStnVO.setSysLastChgUserId(getUserId());
			fcltInstlInfoCurntStnVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = fcltInstlInfoCurntStnService.deleteFcltInstlInfoCurntStnList(fcltInstlInfoCurntStnList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============deleteFcltInstlinfoList=====end========");
		return getSuccessResponseEntity(resultMap);
	}
}