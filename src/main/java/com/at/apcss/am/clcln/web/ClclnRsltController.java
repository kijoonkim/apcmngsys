package com.at.apcss.am.clcln.web;

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

import com.at.apcss.am.clcln.service.ClclnRsltService;
import com.at.apcss.am.clcln.vo.ClclnMngVO;
import com.at.apcss.am.clcln.vo.ClclnRsltVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : ClclnRsltController.java
 * @Description : 정산결과관리 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.21  신정철        최초 생성
 *      </pre>
 */
@Controller
public class ClclnRsltController extends BaseController {

	// 정산결과
	@Resource(name = "clclnRsltService")
	private ClclnRsltService clclnRsltService;

	
	// APC 정산결과 조회
	@PostMapping(value = "/am/clcln/selectClclnRsltList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectClclnRsltList(@RequestBody ClclnRsltVO clclnRsltVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ClclnRsltVO> resultList = new ArrayList<>();
		
		try {
			resultList = clclnRsltService.selectClclnRsltList(clclnRsltVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 정산결과 조회
	@PostMapping(value = "/api/mobile/am/clcln/selectClclnRsltList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectClclnRsltListMobile(@RequestBody ClclnRsltVO clclnRsltVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ClclnRsltVO> resultList = new ArrayList<>();

		try {
			resultList = clclnRsltService.selectClclnRsltList(clclnRsltVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	
	// 정산실적 변경
	@PostMapping(value = "/am/clcln/updateClclnRslt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateClclnRslt(@RequestBody ClclnMngVO clclnMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			clclnMngVO.setSysFrstInptUserId(getUserId());
			clclnMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			clclnMngVO.setSysLastChgUserId(getUserId());
			clclnMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = clclnRsltService.updateClclnRslt(clclnMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
			
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}


	// 정산실적 생성
	@PostMapping(value = "/am/clcln/insertClclnRsltReg.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertClclnRsltReg(@RequestBody ClclnMngVO clclnMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			clclnMngVO.setSysFrstInptUserId(getUserId());
			clclnMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			clclnMngVO.setSysLastChgUserId(getUserId());
			clclnMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = clclnRsltService.insertClclnRsltReg(clclnMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
			
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
	
}

