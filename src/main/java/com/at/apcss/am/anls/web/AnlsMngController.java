package com.at.apcss.am.anls.web;

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

import com.at.apcss.am.anls.service.AnlsCrtrService;
import com.at.apcss.am.anls.vo.AnlsCrtrVO;
import com.at.apcss.am.anls.vo.AnlsMngVO;
import com.at.apcss.am.clcln.vo.ClclnMngVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : AnlsMngController.java
 * @Description : 분석관리 대한 Controller 클래스
 * @author 신정철
 * @since 2024.06.21
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.10.21  신정철        최초 생성
 *      </pre>
 */
@Controller
public class AnlsMngController extends BaseController {

	
	// 분석기준
	@Resource(name = "anlsCrtrService")
	private AnlsCrtrService anlsCrtrService;
	
	// APC 분석기준 조회
	@PostMapping(value = "/am/anls/selectAnlsCrtrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectAnlsCrtrList(@RequestBody AnlsCrtrVO anlsCrtrVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<AnlsCrtrVO> resultList = new ArrayList<>();
		
		try {
			resultList = anlsCrtrService.selectAnlsCrtrList(anlsCrtrVO);
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
	
	// APC 분석기준상세 조회
	@PostMapping(value = "/am/anls/selectAnlsCrtrDtlList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectAnlsCrtrDtlList(@RequestBody AnlsCrtrVO anlsCrtrVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<AnlsCrtrVO> resultList = new ArrayList<>();
		
		try {
			resultList = anlsCrtrService.selectAnlsCrtrDtlList(anlsCrtrVO);
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
	

	// APC 분석기준 등록
	@PostMapping(value = "/am/anls/insertAnlsCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertAnlsCrtr(@RequestBody AnlsMngVO anlsMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			anlsMngVO.setSysFrstInptUserId(getUserId());
			anlsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			anlsMngVO.setSysLastChgUserId(getUserId());
			anlsMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = anlsCrtrService.insertAnlsCrtr(anlsMngVO);
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
	

	// APC 분석기준 삭제
	@PostMapping(value = "/am/anls/deleteAnlsCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteAnlsCrtr(@RequestBody AnlsMngVO anlsMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			anlsMngVO.setSysFrstInptUserId(getUserId());
			anlsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			anlsMngVO.setSysLastChgUserId(getUserId());
			anlsMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = anlsCrtrService.deleteAnlsCrtr(anlsMngVO);
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
	
	// APC 분석기준상세 등록
	@PostMapping(value = "/am/anls/insertAnlsCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertAnlsCrtrDtl(@RequestBody AnlsMngVO anlsMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			anlsMngVO.setSysFrstInptUserId(getUserId());
			anlsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			anlsMngVO.setSysLastChgUserId(getUserId());
			anlsMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = anlsCrtrService.insertAnlsCrtrDtl(anlsMngVO);
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
	
	// APC 분석기준상세 삭제
	@PostMapping(value = "/am/anls/deleteAnlsCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteAnlsCrtrDtl(@RequestBody AnlsMngVO anlsMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			anlsMngVO.setSysFrstInptUserId(getUserId());
			anlsMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			anlsMngVO.setSysLastChgUserId(getUserId());
			anlsMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = anlsCrtrService.deleteAnlsCrtrDtl(anlsMngVO);
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
