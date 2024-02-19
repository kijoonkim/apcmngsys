package com.at.apcss.am.apc.web;

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

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.am.apc.vo.ApcLinkVO;
import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.user.service.ComUserService;
import com.at.apcss.co.user.vo.ComUserVO;


@Controller
public class ApcEvrmntStngController extends BaseController{


	// APC 환경설정
	@Resource(name = "apcEvrmntStngService")
	private ApcEvrmntStngService apcEvrmntStngService;

	// 사용자
	@Resource(name = "comUserService")
	private ComUserService comUserService;

	// 공통코드
	@Resource(name = "comCdService")
	private ComCdService comCdSerivce;
	
	// APC 환경설정 - APC 정보 조회
	@PostMapping(value = "/am/apc/selectApcEvrmntStng.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcEvrmntStng(@RequestBody ApcEvrmntStngVO apcEvrmntStngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		ApcEvrmntStngVO resultVO = new ApcEvrmntStngVO();
		try {
			resultVO = apcEvrmntStngService.selectApcEvrmntStng(apcEvrmntStngVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		
		resultMap.put("resultVO", resultVO);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 환경설정 - 사용자 목록 조회
	@PostMapping(value = "/am/apc/selectApcUserList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcUserList(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ComUserVO> resultList = new ArrayList<>();
		try {
			comUserVO.setSysUserId(getUserId());
			resultList = apcEvrmntStngService.selectApcUserList(comUserVO);
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

	// APC 환경설정 - 사용자 정보 등록
	@PostMapping(value = "/am/apc/updateComUserList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateComUserList(@RequestBody List<ComUserVO> comUserList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {

			for (ComUserVO comUserVO : comUserList) {
				comUserVO.setSysLastChgPrgrmId(getUserId());
				comUserVO.setSysLastChgUserId(getPrgrmId());
				resultMap = comUserService.updateComUser(comUserVO);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}


	/**
	 * APC 메뉴간편설정 등록 시 APC의 권한 등록 (관리자, 사용자)
	 */
	@PostMapping(value = "/am/apc/insertApcSimpleAuthrt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertApcSimpleAuthrt(@RequestBody ApcEvrmntStngVO apcEvrmntStngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String,Object>();

		try {

			// validation check
			apcEvrmntStngVO.setSysFrstInptUserId(getUserId());
			apcEvrmntStngVO.setSysFrstInptPrgrmId(getPrgrmId());
			apcEvrmntStngVO.setSysLastChgUserId(getUserId());
			apcEvrmntStngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = apcEvrmntStngService.insertApcSimpleAuthrt(apcEvrmntStngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * APC 메뉴일반설정 등록 시 APC의 권한 등록 (관리자, 사용자)
	 */
	@PostMapping(value = "/am/apc/insertApcNormalAuthrt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertApcNormalAuthrt(@RequestBody ApcEvrmntStngVO apcEvrmntStngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String,Object>();

		try {

			// validation check
			apcEvrmntStngVO.setSysFrstInptUserId(getUserId());
			apcEvrmntStngVO.setSysFrstInptPrgrmId(getPrgrmId());
			apcEvrmntStngVO.setSysLastChgUserId(getUserId());
			apcEvrmntStngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = apcEvrmntStngService.insertApcNormalAuthrt(apcEvrmntStngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * APC 환경설정 - APC 환경설정 수정
	 */
	@PostMapping(value = "/am/apc/updateApcEvrmntStng.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateApcEvrmntStng(@RequestBody ApcEvrmntStngVO apcEvrmntStngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		int inserted = 0;
		try {

			apcEvrmntStngVO.setSysFrstInptUserId(getUserId());
			apcEvrmntStngVO.setSysFrstInptPrgrmId(getPrgrmId());
			apcEvrmntStngVO.setSysLastChgUserId(getUserId());
			apcEvrmntStngVO.setSysLastChgPrgrmId(getPrgrmId());

			inserted = apcEvrmntStngService.updateApcEvrmntStng(apcEvrmntStngVO);


		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, inserted);

		return getSuccessResponseEntity(resultMap);
	}
	/**
	 * APC 메뉴일반설정 등록 시 APC의 권한 등록 (관리자, 사용자)
	 */
	@PostMapping(value = "/am/apc/updateApcMenuAuthrt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateApcMenuAuthrt(@RequestBody ApcEvrmntStngVO apcEvrmntStngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String,Object>();

		try {
			// validation check
			apcEvrmntStngVO.setSysFrstInptUserId(getUserId());
			apcEvrmntStngVO.setSysFrstInptPrgrmId(getPrgrmId());
			apcEvrmntStngVO.setSysLastChgUserId(getUserId());
			apcEvrmntStngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = apcEvrmntStngService.updateApcMenuAuthrt(apcEvrmntStngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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
