package com.at.apcss.am.cmns.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.cmns.service.CmnsVrtyService;
import com.at.apcss.am.cmns.vo.CmnsVrtyVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : CmnsVrtyController.java
 * @Description : 품종 정보관리에 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Controller
public class CmnsVrtyController extends BaseController {


	@Resource(name= "cmnsVrtyService")
	private CmnsVrtyService cmnsVrtyService;

	// APC 환경설정 - 품종 목록 조회
	@PostMapping(value = "/am/cmns/selectCmnsVrtyList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCmnsVrtyList(@RequestBody CmnsVrtyVO cmnsVrtyVO, HttpServletRequest request) throws Exception {

		logger.debug("selectCmnsVrtyList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsVrtyVO> resultList = new ArrayList<>();

		try {

			resultList = cmnsVrtyService.selectCmnsVrtyList(cmnsVrtyVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);

	}

	// APC 환경설정 - APC품종 목록 조회
	@PostMapping(value = "/am/cmns/selectApcCmnsVrtyList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcCmnsVrtyList(@RequestBody CmnsVrtyVO cmnsVrtyVO, HttpServletRequest request) throws Exception {

		logger.debug("selectApcCmnsVrtyList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsVrtyVO> resultList = new ArrayList<>();

		try {

			resultList = cmnsVrtyService.selectApcCmnsVrtyList(cmnsVrtyVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);

	}

	// APC 환경설정 - APC품종 등록
	@PostMapping(value = "/am/cmns/insertApcCmnsVrty.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertApcCmnsVrty(@RequestBody CmnsVrtyVO cmnsVrtyVO, HttpServletRequest request) throws Exception {

		logger.debug("insertApcCmnsVrtyList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;

		try {
			cmnsVrtyVO.setSysFrstInptPrgrmId(getPrgrmId());
			cmnsVrtyVO.setSysFrstInptUserId(getUserId());
			cmnsVrtyVO.setSysLastChgPrgrmId(getPrgrmId());
			cmnsVrtyVO.setSysLastChgUserId(getUserId());
			result = cmnsVrtyService.insertCmnsVrty(cmnsVrtyVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);

	}

	// APC 환경설정 - APC품종 삭제
	@PostMapping(value = "/am/cmns/deleteApcCmnsVrty.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteApcCmnsVrty(@RequestBody CmnsVrtyVO cmnsVrtyVO, HttpServletRequest request) throws Exception {

		logger.debug("deleteApcCmnsVrtyList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;

		try {

			result = cmnsVrtyService.deleteCmnsVrty(cmnsVrtyVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);

	}

}
