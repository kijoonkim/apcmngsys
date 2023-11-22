package com.at.apcss.co.cd.web;

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

import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
/**
 * 공통코드정보 처리하는 컨트롤러 클래스
 * @author SI개발부 김호
 * @since 2023.06.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      	수정자      	수정내용
 *  ----------	----------	---------------------------
 *  2023.06.12  김호     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ComCdController extends BaseController {

	@Resource(name ="comCdService")
	private ComCdService comCdService;


	// 공통코드 등록
	@PostMapping(value = "/co/cd/insertComCdList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertComCdList(@RequestBody List<ComCdVO> comCdList, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/insertComCdList >>> 호출 >>> ");

		logger.debug("size >>>>  {} ", comCdList.size());
		int result = 0;
		try {
			for (ComCdVO comCdVO : comCdList) {
				comCdVO.setSysFrstInptPrgrmId(getPrgrmId());
				comCdVO.setSysFrstInptUserId(getUserId());
				comCdVO.setSysLastChgPrgrmId(getPrgrmId());
				comCdVO.setSysLastChgUserId(getUserId());
				result += comCdService.insertComCd(comCdVO);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}


	// 공통코드 수정
	@PostMapping(value = "/co/cd/updateComCdList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateComCdList(@RequestBody List<ComCdVO> comCdList, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/updateComCdList >>> 호출 >>> ");

		logger.debug("size >>>>  {} ", comCdList.size());
		int result = 0;
		try {
			for (ComCdVO comCdVO : comCdList) {
				comCdVO.setSysLastChgPrgrmId(getPrgrmId());
				comCdVO.setSysLastChgUserId(getUserId());
				result += comCdService.updateComCd(comCdVO);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 공통코드 삭제
	@PostMapping(value = "/co/cd/deleteComCdList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteComCdList(@RequestBody List<ComCdVO> comCdList, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/deleteComCdList >>> 호출 >>> ");

		logger.debug("size >>>>  {} ", comCdList.size());
		int result = 0;
		try {
			for (ComCdVO comCdVO : comCdList) {
				result += comCdService.deleteComCd(comCdVO);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 공통코드 상세 등록
	@PostMapping(value = "/co/cd/insertComCdDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertComCdDtlList(@RequestBody List<ComCdVO> comCdList, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/insertComCdDtlList >>> 호출 >>> ");

		logger.debug("size >>>>  {} ", comCdList.size());
		int result = 0;
		try {
			for (ComCdVO comCdVO : comCdList) {
				comCdVO.setSysFrstInptPrgrmId(getPrgrmId());
				comCdVO.setSysFrstInptUserId(getUserId());
				comCdVO.setSysLastChgPrgrmId(getPrgrmId());
				comCdVO.setSysLastChgUserId(getUserId());
				result += comCdService.insertComCdDtl(comCdVO);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 공통코드 상세 수정
	@PostMapping(value = "/co/cd/updateComCdDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateComCdDtlList(@RequestBody List<ComCdVO> comCdList, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/updateComCdList >>> 호출 >>> ");

		logger.debug("size >>>>  {} ", comCdList.size());
		int result = 0;
		try {
			for (ComCdVO comCdVO : comCdList) {
				comCdVO.setSysLastChgPrgrmId(getPrgrmId());
				comCdVO.setSysLastChgUserId(getUserId());
				result += comCdService.updateComCdDtl(comCdVO);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 공통코드 상세 삭제
	@PostMapping(value = "/co/cd/deleteComCdDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteComCdDtlList(@RequestBody List<ComCdVO> comCdList, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/deleteComCdList >>> 호출 >>> ");

		logger.debug("size >>>>  {} ", comCdList.size());
		int result = 0;
		try {
			for (ComCdVO comCdVO : comCdList) {
				result += comCdService.deleteComCdDtl(comCdVO);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 공통코드 상세 삭제
	@PostMapping(value = "/co/cd/deleteComCdDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteComCdDtl(@RequestBody ComCdVO comCdVO, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/deleteComCdList >>> 호출 >>> ");

		int result = 0;
		try {
			result += comCdService.deleteComCdDtl(comCdVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}


	// 공통코드 중복 체크
	@PostMapping(value = "/co/cd/duplicateCheckCdId.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> duplicateCheckCdId(@RequestBody ComCdVO comCdVO, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/duplicateCheckCdId >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		try {
			result = comCdService.duplicateCheckCdId(comCdVO);
		}catch(Exception e){
			return getErrorResponseEntity(e);
		}
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// 공통코드 상세 중복 체크
	@PostMapping(value = "/co/cd/duplicateCheckCdIdDtl.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> duplicateCheckCdIdDtl(@RequestBody ComCdVO comCdVO, HttpServletRequest request) throws Exception {
		logger.debug("/co/cd/duplicateCheckCdId >>> 호출 >>> ");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		try {
			result = comCdService.duplicateCheckCdIdDtl(comCdVO);
		}catch(Exception e){
			return getErrorResponseEntity(e);
		}
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	// APC 설비 목록 조회
	@PostMapping(value = "/co/cd/selectFcltList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectFcltList(@RequestBody ComCdVO comCdVO, HttpServletRequest request) throws Exception {
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComCdVO> resultList = new ArrayList<>();
		try {
			resultList = comCdService.selectFcltList(comCdVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	// 공통코드 상세 등록
	@PostMapping(value = "/co/cd/multiSaveComCdDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveComCdDtlList(@RequestBody List<ComCdVO> comCdList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (ComCdVO comCdVO : comCdList) {
				comCdVO.setSysFrstInptPrgrmId(getPrgrmId());
				comCdVO.setSysFrstInptUserId(getUserId());
				comCdVO.setSysLastChgPrgrmId(getPrgrmId());
				comCdVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = comCdService.multiSaveComCdDtlList(comCdList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}
	
	// 공통코드 & 공통코드 상세 등록
	@PostMapping(value = "/co/cd/multiSaveComCdComCdDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveComCdComCdDtlList(@RequestBody ComCdVO saveList, HttpServletRequest request) throws Exception {
	
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
	
		List<ComCdVO> saveCdList = saveList.getComCdList();
		List<ComCdVO> saveCdDtlList = saveList.getComCdDtlList();
		int savedCnt = 0;
		
		try {
			for (ComCdVO comCd : saveCdList) {
				comCd.setSysFrstInptPrgrmId(getPrgrmId());
				comCd.setSysFrstInptUserId(getUserId());
				comCd.setSysLastChgPrgrmId(getPrgrmId());
				comCd.setSysLastChgUserId(getUserId());
			}
			for (ComCdVO comCdDtl : saveCdDtlList) {
				comCdDtl.setSysFrstInptPrgrmId(getPrgrmId());
				comCdDtl.setSysFrstInptUserId(getUserId());
				comCdDtl.setSysLastChgPrgrmId(getPrgrmId());
				comCdDtl.setSysLastChgUserId(getUserId());
			}
	
			savedCnt += comCdService.multiSaveComCdList(saveCdList);
			savedCnt += comCdService.multiSaveComCdDtlList(saveCdDtlList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	// 공통코드 & 공통코드 상세 삭제
	@PostMapping(value = "/co/cd/deleteComCdComCdDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteComCdComCdDtlList(@RequestBody ComCdVO deleteList, HttpServletRequest request) throws Exception {
	
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
	
		List<ComCdVO> deleteCdList = deleteList.getComCdList();
		List<ComCdVO> deleteCdDtlList = deleteList.getComCdDtlList();
		List<ComCdVO> resultList = new ArrayList<>();
		int deletedCnt = 0;
		
		try {
			for (ComCdVO comCd : deleteCdList) {
				resultList = comCdService.selectComCdDtlList(comCd);
				deletedCnt += comCdService.deleteComCd(comCd);
				for (ComCdVO result : resultList) {
					deletedCnt += comCdService.deleteComCdDtl(result);
				}
			}
			for (ComCdVO comCdDtl : deleteCdDtlList) {
				deletedCnt += comCdService.deleteComCdDtl(comCdDtl);
			}
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		return getSuccessResponseEntity(resultMap);
	}
}
