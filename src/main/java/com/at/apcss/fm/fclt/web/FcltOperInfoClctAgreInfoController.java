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
import com.at.apcss.fm.fclt.service.FcltOperInfoClctAgreInfoService;
import com.at.apcss.fm.fclt.vo.FcltOperInfoClctAgreInfoVO;


/**
 * @Class Name : FcltOperInfoClctAgreInfoController.java
 * @Description : 개인정보이용동의에 대한 Controller 클래스
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
public class FcltOperInfoClctAgreInfoController extends BaseController {


	// 개인정보이용동의
	@Resource(name= "fcltOperInfoClctAgreInfoService")
	private FcltOperInfoClctAgreInfoService fcltOperInfoClctAgreInfoService;

	// 개인정보이용동의 화면이동
	@RequestMapping("/fm/fclt/fcltOperInfoClctAgreInfo.do")
	public String doFcltOperInfoClctAgreInfo() {
		return "apcss/fm/fclt/fcltOperInfoClctAgreInfo";
	}

	// 개인정보이용동의 조회
	@PostMapping(value = "/fm/fclt/selectFcltOperInfoClctAgreInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltOperInfoClctAgreInfoVO> resultList = new ArrayList<>();

		try {
			 resultList = fcltOperInfoClctAgreInfoService.selectFcltOperInfoClctAgreInfoList(fcltOperInfoClctAgreInfoVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (FcltOperInfoClctAgreInfoVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 개인정보이용동의 등록
	@PostMapping(value = "/fm/fclt/insertFcltOperInfoClctAgreInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltOperInfoClctAgreInfo(@RequestBody FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		logger.debug("============insertFcltOperInfoClctAgreInfo===========");
		// validation check

		// audit 항목
		fcltOperInfoClctAgreInfoVO.setSysFrstInptUserId(getUserId());
		fcltOperInfoClctAgreInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltOperInfoClctAgreInfoVO.setSysLastChgUserId(getUserId());
		fcltOperInfoClctAgreInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		logger.debug(fcltOperInfoClctAgreInfoVO.getTrgtYr());
		logger.debug(fcltOperInfoClctAgreInfoVO.getApcCd());

		int insertedCnt = 0;

		try {
			insertedCnt = fcltOperInfoClctAgreInfoService.insertFcltOperInfoClctAgreInfo(fcltOperInfoClctAgreInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 개인정보이용동의 변경
	@PostMapping(value = "/fm/fclt/updateFcltOperInfoClctAgreInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateFcltOperInfoClctAgreInfo(@RequestBody FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltOperInfoClctAgreInfoVO.setSysLastChgUserId(getUserId());
		fcltOperInfoClctAgreInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		logger.debug("==================updateFcltOperInfoClctAgreInfo=======================");
		int updatedCnt = 0;

		try {
			updatedCnt = fcltOperInfoClctAgreInfoService.updateFcltOperInfoClctAgreInfo(fcltOperInfoClctAgreInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 개인정보이용동의 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltOperInfoClctAgreInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltOperInfoClctAgreInfo(@RequestBody FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltOperInfoClctAgreInfoVO.setSysLastChgUserId(getUserId());
		fcltOperInfoClctAgreInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = fcltOperInfoClctAgreInfoService.deleteFcltOperInfoClctAgreInfo(fcltOperInfoClctAgreInfoVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 개인정보이용동의 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteFcltOperInfoClctAgreInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFcltOperInfoClctAgreInfoList(@RequestBody List<FcltOperInfoClctAgreInfoVO> fcltOperInfoClctAgreInfoList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (FcltOperInfoClctAgreInfoVO fcltOperInfoClctAgreInfoVO : fcltOperInfoClctAgreInfoList ) {
			fcltOperInfoClctAgreInfoVO.setSysLastChgUserId(getUserId());
			fcltOperInfoClctAgreInfoVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = fcltOperInfoClctAgreInfoService.deleteFcltOperInfoClctAgreInfoList(fcltOperInfoClctAgreInfoList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}