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

import com.at.apcss.am.cmns.service.StdGrdService;
import com.at.apcss.am.cmns.vo.StdGrdDtlVO;
import com.at.apcss.am.cmns.vo.StdGrdJgmtVO;
import com.at.apcss.am.cmns.vo.StdGrdListVO;
import com.at.apcss.am.cmns.vo.StdGrdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : StdGrdController.java
 * @Description : 등급 정보관리에 대한 Controller 클래스
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
public class StdGrdController extends BaseController {

	@Resource(name = "stdGrdService")
	private StdGrdService stdGrdService;

	// APC 등급 목록 조회
	@PostMapping(value = "/am/cmns/selectStdGrdList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectStdGrdList(@RequestBody StdGrdVO stdGrdVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<StdGrdVO> resultList = new ArrayList<>();

		try {

			resultList = stdGrdService.selectStdGrdList(stdGrdVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 등급 삭제
	@PostMapping(value = "/am/cmns/deleteStdGrd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteStdGrd(@RequestBody StdGrdVO stdGrdVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// validation check

		// audit 항목
		stdGrdVO.setSysFrstInptUserId(getUserId());
		stdGrdVO.setSysFrstInptPrgrmId(getPrgrmId());
		stdGrdVO.setSysLastChgUserId(getUserId());
		stdGrdVO.setSysLastChgPrgrmId(getPrgrmId());

		try {
			HashMap<String, Object> rtnObj = stdGrdService.deleteStdGrd(stdGrdVO);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}

	// APC 등급List 등록
	@PostMapping(value = "/am/cmns/multiStdGrdList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiStdGrdList(@RequestBody List<StdGrdListVO> stdGrdLists, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			stdGrdLists.get(0).setSysFrstInptPrgrmId(getPrgrmId());
			stdGrdLists.get(0).setSysFrstInptUserId(getUserId());
			stdGrdLists.get(0).setSysLastChgPrgrmId(getPrgrmId());
			stdGrdLists.get(0).setSysLastChgUserId(getPrgrmId());

			HashMap<String, Object> rtnObj = stdGrdService.multiStdGrdList(stdGrdLists);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}

	// APC 등급 상세 목록 조회
	@PostMapping(value = "/am/cmns/selectStdGrdDtlList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectStdGrdDtlList(@RequestBody StdGrdDtlVO stdGrdDtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<StdGrdDtlVO> resultList = new ArrayList<>();

		try {

			resultList = stdGrdService.selectStdGrdDtlList(stdGrdDtlVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 등급 판정 목록 조회
	@PostMapping(value = "/am/cmns/selectStdGrdJgmtList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectStdGrdJgmtList(@RequestBody StdGrdJgmtVO stdGrdJgmtVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<StdGrdJgmtVO> resultList = new ArrayList<>();

		try {

			resultList = stdGrdService.selectStdGrdJgmtList(stdGrdJgmtVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 등급 상세 삭제
	@PostMapping(value = "/am/cmns/deleteStdGrdDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteStdGrdDtl(@RequestBody StdGrdDtlVO stdGrdDtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			HashMap<String, Object> rtnObj = stdGrdService.deleteStdGrdDtl(stdGrdDtlVO);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}
	// APC 등급 판정 삭제
	@PostMapping(value = "/am/cmns/deleteStdGrdJgmt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteStdGrdJgmt(@RequestBody StdGrdJgmtVO stdGrdJgmtVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			HashMap<String, Object> rtnObj =  stdGrdService.deleteStdGrdJgmt(stdGrdJgmtVO);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}
}
