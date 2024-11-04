package com.at.apcss.co.ognz.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.ognz.service.UntyOgnzService;
import com.at.apcss.co.ognz.vo.UntyOgnzApcUserVO;
import com.at.apcss.co.ognz.vo.UntyOgnzVO;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : UntyOgnzController.java
 * @Description : 통합조직에 대한 Controller 클래스
 * @author 신정철
 * @since 2024.07.22
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.22  신정철        최초 생성
 * </pre>
 */
@Controller
public class UntyOgnzController extends BaseController {

	@Resource(name = "untyOgnzService")
	private UntyOgnzService untyOgnzService;
	
	// 통합조직 트리 목록 조회
	@PostMapping(value = "/co/ognz/selectUntyOgnzTreeList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUntyOgnzTreeList(@RequestBody UntyOgnzVO untyOgnzVO, HttpServletRequest request) throws Exception{
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		List<UntyOgnzVO> resultList = new ArrayList<UntyOgnzVO>();
		
		String untyAuthrtType = getUntyAuthrtType();
		String untyOgnzCd = getUntyOgnzCd();
		String authrtMngrYn = getAuthrtMngrYn();
		
		if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
			
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
			
		} else if (ComConstants.CON_YES.equals(authrtMngrYn)) {
			
			if (!StringUtils.hasText(untyOgnzCd)) {
				return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "권한"));
			}
			
			untyOgnzVO.setUntyOgnzId(untyOgnzCd);
			
		} else {
			return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "조회권한"));
		}
		
		
		try {
			 resultList = untyOgnzService.selectUntyOgnzTreeList(untyOgnzVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
		
	}	
	
	// 조직 목록 조회
	@PostMapping(value = "/co/ognz/selectOgnzList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectOgnzList(@RequestBody UntyOgnzVO untyOgnzVO, HttpServletRequest request) throws Exception{
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		List<UntyOgnzVO> resultList = new ArrayList<UntyOgnzVO>();
		try {
			 resultList = untyOgnzService.selectOgnzList(untyOgnzVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
		
	}	
	
	// 통합조직 관리APC 목록 조회
	@PostMapping(value = "/co/ognz/selectUntyOgnzApcList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUntyOgnzApcList(@RequestBody UntyOgnzVO untyOgnzVO, HttpServletRequest request) throws Exception{
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		List<UntyOgnzVO> resultList = new ArrayList<UntyOgnzVO>();
		try {
			 resultList = untyOgnzService.selectUntyOgnzApcList(untyOgnzVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
		
	}	
	
	// 관리APC  등록
	@PostMapping(value = "/co/ognz/insertOgnzApcList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertUntyOgnz(@RequestBody List<UntyOgnzVO> ognzApcList, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {

			for ( UntyOgnzVO apc: ognzApcList ) {
				apc.setSysFrstInptUserId(getUserId());
				apc.setSysFrstInptPrgrmId(getPrgrmId());
				apc.setSysLastChgUserId(getUserId());
				apc.setSysLastChgPrgrmId(getPrgrmId());
			}
			
			HashMap<String, Object> rtnObj = untyOgnzService.insertOgnzApcList(ognzApcList);
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
	
	// 관리APC 삭제
	@PostMapping(value = "/co/ognz/deleteOgnzApc.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteOgnzApc(@RequestBody UntyOgnzVO ognzApcVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			ognzApcVO.setSysFrstInptUserId(getUserId());
			ognzApcVO.setSysFrstInptPrgrmId(getPrgrmId());
			ognzApcVO.setSysLastChgUserId(getUserId());
			ognzApcVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = untyOgnzService.deleteOgnzApc(ognzApcVO);
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
	
	// 통합조직  등록
	@PostMapping(value = "/co/ognz/insertUntyOgnz.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertUntyOgnz(@RequestBody UntyOgnzVO untyOgnzVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {

			untyOgnzVO.setSysFrstInptUserId(getUserId());
			untyOgnzVO.setSysFrstInptPrgrmId(getPrgrmId());
			untyOgnzVO.setSysLastChgUserId(getUserId());
			untyOgnzVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = untyOgnzService.insertUntyOgnz(untyOgnzVO);
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
	
	// 통합조직  변경
	@PostMapping(value = "/co/ognz/updateUntyOgnz.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateUntyOgnz(@RequestBody UntyOgnzVO untyOgnzVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			untyOgnzVO.setSysFrstInptUserId(getUserId());
			untyOgnzVO.setSysFrstInptPrgrmId(getPrgrmId());
			untyOgnzVO.setSysLastChgUserId(getUserId());
			untyOgnzVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = untyOgnzService.updateUntyOgnz(untyOgnzVO);
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
	
	// 통합조직 삭제
	@PostMapping(value = "/co/ognz/deleteUntyOgnz.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteUntyOgnz(@RequestBody UntyOgnzVO untyOgnzVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			untyOgnzVO.setSysFrstInptUserId(getUserId());
			untyOgnzVO.setSysFrstInptPrgrmId(getPrgrmId());
			untyOgnzVO.setSysLastChgUserId(getUserId());
			untyOgnzVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = untyOgnzService.deleteUntyOgnz(untyOgnzVO);
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
	

	// 관리APC 승인대상 목록 조회
	@PostMapping(value = "/co/ognz/selectApcAprvList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectApcAprvList(@RequestBody UntyOgnzVO untyOgnzVO, HttpServletRequest request) throws Exception{
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		String untyAuthrtType = getUntyAuthrtType();
		
		if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
			
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
			
		} else {
			return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "조회권한"));
		}
		
		List<UntyOgnzVO> resultList = new ArrayList<UntyOgnzVO>();
		try {
			 resultList = untyOgnzService.selectApcAprvList(untyOgnzVO);	
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
		
	}	
	
	// 법인별 관리 APC 목록 조회
	@PostMapping(value = "/co/ognz/selectCorpApcList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCorpApcList(@RequestBody UntyOgnzVO untyOgnzVO, HttpServletRequest request) throws Exception{
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		String untyAuthrtType = getUntyAuthrtType();
		String untyOgnzCd = getUntyOgnzCd();
		String authrtMngrYn = getAuthrtMngrYn();
		
		untyOgnzVO.setSuperUserYn(null);
		if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
			untyOgnzVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
			untyOgnzVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_YES.equals(authrtMngrYn)) {
			untyOgnzVO.setUntyOgnzCd(untyOgnzCd);
			untyOgnzVO.setAuthrtMngrYn(authrtMngrYn);
		} else {
			return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "조회권한"));
		}
		
		List<UntyOgnzVO> resultList = new ArrayList<UntyOgnzVO>();
		try {
			 resultList = untyOgnzService.selectCorpApcList(untyOgnzVO);	
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}
	
	// APC별 사용자 목록 조회
	@PostMapping(value = "/co/ognz/selectCorpApcUserList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCorpApcUserList(@RequestBody UntyOgnzApcUserVO untyOgnzApcUserVO, HttpServletRequest request) throws Exception{
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		String untyAuthrtType = getUntyAuthrtType();
		String untyOgnzCd = getUntyOgnzCd();
		String authrtMngrYn = getAuthrtMngrYn();
		
		untyOgnzApcUserVO.setSuperUserYn(null);
		if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
			untyOgnzApcUserVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
			untyOgnzApcUserVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_YES.equals(authrtMngrYn)) {
			untyOgnzApcUserVO.setUntyOgnzCd(untyOgnzCd);
			untyOgnzApcUserVO.setAuthrtMngrYn(authrtMngrYn);
		} else {
			return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "조회권한"));
		}
		
		List<UntyOgnzApcUserVO> resultList = new ArrayList<UntyOgnzApcUserVO>();
		try {	
			 resultList = untyOgnzService.selectCorpApcUserList(untyOgnzApcUserVO);	
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}
	

	
	// 관리APC 사용자 등록
	@PostMapping(value = "/co/ognz/insertCorpApcUser.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCorpApcUser(@RequestBody UntyOgnzVO untyOgnzVO, HttpServletRequest request) throws Exception{
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		String untyAuthrtType = getUntyAuthrtType();
		String untyOgnzCd = getUntyOgnzCd();
		String authrtMngrYn = getAuthrtMngrYn();
		
		if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
			
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
			
		} else if (ComConstants.CON_YES.equals(authrtMngrYn)) {
			untyOgnzVO.setAuthrtMngrYn(authrtMngrYn);
			if (!ComUtil.nullToEmpty(untyOgnzCd).equals(untyOgnzVO.getUntyOgnzCd())) {
				return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "권한"));
			}
		} else {
			return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "권한"));
		}
		
		untyOgnzVO.setSysFrstInptUserId(getUserId());
		untyOgnzVO.setSysFrstInptPrgrmId(getPrgrmId());
		untyOgnzVO.setSysLastChgUserId(getUserId());
		untyOgnzVO.setSysLastChgPrgrmId(getPrgrmId());
		
		try {
			
			HashMap<String, Object> rtnObj = untyOgnzService.insertCorpApcUser(untyOgnzVO);

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
	
	
	// 관리APC 승인
	@PostMapping(value = "/co/ognz/deleteCorpApcUser.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteCorpApcUser(@RequestBody UntyOgnzVO untyOgnzVO, HttpServletRequest request) throws Exception{
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		String untyAuthrtType = getUntyAuthrtType();
		String untyOgnzCd = getUntyOgnzCd();
		String authrtMngrYn = getAuthrtMngrYn();
		
		if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
			
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
			
		} else if (ComConstants.CON_YES.equals(authrtMngrYn)) {
			untyOgnzVO.setAuthrtMngrYn(authrtMngrYn);
			if (!ComUtil.nullToEmpty(untyOgnzCd).equals(untyOgnzVO.getUntyOgnzCd())) {
				return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "권한"));
			}
		} else {
			return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "권한"));
		}
		
		untyOgnzVO.setSysFrstInptUserId(getUserId());
		untyOgnzVO.setSysFrstInptPrgrmId(getPrgrmId());
		untyOgnzVO.setSysLastChgUserId(getUserId());
		untyOgnzVO.setSysLastChgPrgrmId(getPrgrmId());
		
		try {
			
			HashMap<String, Object> rtnObj = untyOgnzService.deleteCorpApcUser(untyOgnzVO);

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
	
	// 관리APC 승인
	@PostMapping(value = "/co/ognz/insertApcAprvList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertApcAprvList(@RequestBody List<UntyOgnzVO> apcAprvList, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {

			for ( UntyOgnzVO apc: apcAprvList ) {
				apc.setSysFrstInptUserId(getUserId());
				apc.setSysFrstInptPrgrmId(getPrgrmId());
				apc.setSysLastChgUserId(getUserId());
				apc.setSysLastChgPrgrmId(getPrgrmId());
			}
			
			HashMap<String, Object> rtnObj = untyOgnzService.insertApcAprvList(apcAprvList);
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

	// 관리APC 승인취소
	@PostMapping(value = "/co/ognz/deleteApcAprvList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteApcAprvList(@RequestBody List<UntyOgnzVO> apcAprvList, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {

			for ( UntyOgnzVO apc: apcAprvList ) {
				apc.setSysFrstInptUserId(getUserId());
				apc.setSysFrstInptPrgrmId(getPrgrmId());
				apc.setSysLastChgUserId(getUserId());
				apc.setSysLastChgPrgrmId(getPrgrmId());
			}
			
			HashMap<String, Object> rtnObj = untyOgnzService.deleteApcAprvList(apcAprvList);
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
