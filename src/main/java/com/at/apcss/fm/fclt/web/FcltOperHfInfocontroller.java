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
import com.at.apcss.fm.fclt.service.FcltOperHfInfoService;
import com.at.apcss.fm.fclt.vo.FcltOperHfInfoVO;

/**
 * @Class Name : FcltOperHfInfocontroller.java
 * @Description : 시설고용인력에 대한 Controller 클래스
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
public class FcltOperHfInfocontroller extends BaseController {


	// 시설현황
	@Resource(name= "fcltOperHfInfoService")
	private FcltOperHfInfoService fcltOperHfInfoService;

	// 시설현황 화면이동
	@GetMapping("/fm/fclt/fcltOperHfInfo.do")
	public String doFcltOperHfInfo() {
		return "apcss/fm/fclt/fcltOperHfInfo";
	}

	// 시설현황 조회
	@PostMapping(value = "/fm/fclt/selectFcltOperHfInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltOperHfInfoVO fcltOperHfInfoVO, HttpServletRequest request) throws Exception{
		logger.info("=============selectFcltOperHfInfoList=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltOperHfInfoVO> resultList = new ArrayList<>();

		logger.info(fcltOperHfInfoVO.getApcCd());
		logger.info(fcltOperHfInfoVO.toString());
		try {
			 resultList = fcltOperHfInfoService.selectFcltOperHfInfoList(fcltOperHfInfoVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltOperHfInfoVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		logger.info("=============selectFcltOperHfInfoList=====end========");
		return getSuccessResponseEntity(resultMap);
	}

	// 시설현황 등록
	@PostMapping(value = "/fm/fclt/insertFcltOperHfInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltOperHfInfo(@RequestBody FcltOperHfInfoVO fcltOperHfInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============insertFcltOperHfInfo=======start======");
		// validation check

		logger.info(fcltOperHfInfoVO.getTrgtYr());
		logger.info(fcltOperHfInfoVO.getHireSeCd());
//		logger.info(fcltOperHfInfoVO.getHireNope());
//		logger.info(fcltOperHfInfoVO.getHireNope2());
//		logger.info(fcltOperHfInfoVO.getHireNope3());
//		logger.info(fcltOperHfInfoVO.getHireNope4());
		logger.info(fcltOperHfInfoVO.getTrgtYr());
		logger.info(fcltOperHfInfoVO.getTrgtYr());
		logger.info(fcltOperHfInfoVO.toString());



		// audit 항목
		fcltOperHfInfoVO.setSysFrstInptUserId(getUserId());
		fcltOperHfInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltOperHfInfoVO.setSysLastChgUserId(getUserId());
		fcltOperHfInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {


			logger.info("==========================");
			insertedCnt = fcltOperHfInfoService.insertFcltOperHfInfo(fcltOperHfInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);
		logger.info("=============insertFcltOperHfInfo=======end======");
		return getSuccessResponseEntity(resultMap);
	}

	// 시설현황 변경
	@PostMapping(value = "/fm/fclt/updateFcltOperHfInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltOperHfInfo(@RequestBody FcltOperHfInfoVO fcltOperHfInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============updateFcltOperHfInfo=========start====");
		// validation check

		// audit 항목
		fcltOperHfInfoVO.setSysLastChgUserId(getUserId());
		fcltOperHfInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = fcltOperHfInfoService.updateFcltOperHfInfo(fcltOperHfInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		logger.info("=============updateFcltOperHfInfo======end=======");
		return getSuccessResponseEntity(resultMap);
	}

	// 시설현황 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltOperHfInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltOperHfInfo(@RequestBody FcltOperHfInfoVO fcltOperHfInfoVO, HttpServletRequest requset) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltOperHfInfoVO.setSysLastChgUserId(getUserId());
		fcltOperHfInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltOperHfInfoService.deleteFcltOperHfInfo(fcltOperHfInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 시설현황 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltOperHfInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltOperHfInfoList(@RequestBody List<FcltOperHfInfoVO> fcltOperHfInfoList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		logger.info("=============delete=====start========");
		// validation check

		// audit 항목
		for (FcltOperHfInfoVO fcltOperHfInfoVO : fcltOperHfInfoList ) {
			fcltOperHfInfoVO.setSysLastChgUserId(getUserId());
			fcltOperHfInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = fcltOperHfInfoService.deleteFcltOperHfInfoList(fcltOperHfInfoList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		logger.info("=============delete=====end========");
		return getSuccessResponseEntity(resultMap);
	}
}
