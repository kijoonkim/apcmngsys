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

import com.at.apcss.am.cmns.service.CmnsGrdService;
import com.at.apcss.am.cmns.vo.CmnsGrdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : CmnsGrdController.java
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
public class CmnsGrdController extends BaseController {

	@Resource(name = "cmnsGrdService")
	private CmnsGrdService cmnsGrdService;

	// 등급 마스터 목록 조회
	@PostMapping(value = "/am/cmns/selectCmnsGrdList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCmnsGrdList(@RequestBody CmnsGrdVO cmnsGrdVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsGrdVO> resultList = new ArrayList<>();

		try {

			resultList = cmnsGrdService.selectCmnsGrdList(cmnsGrdVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 등급 마스터 등록
	@PostMapping(value = "/am/cmns/insertCmnsGrd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertCmnsGrd(@RequestBody CmnsGrdVO cmnsGrdVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// validation check

		// audit 항목
		cmnsGrdVO.setSysFrstInptUserId(getUserId());
		cmnsGrdVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsGrdVO.setSysLastChgUserId(getUserId());
		cmnsGrdVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = cmnsGrdService.insertCmnsGrd(cmnsGrdVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 등급 마스터 변경
	@PostMapping(value = "/am/cmns/updateCmnsGrd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateCmnsGrd(@RequestBody CmnsGrdVO cmnsGrdVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// validation check

		// audit 항목
		cmnsGrdVO.setSysFrstInptUserId(getUserId());
		cmnsGrdVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsGrdVO.setSysLastChgUserId(getUserId());
		cmnsGrdVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = cmnsGrdService.updateCmnsGrd(cmnsGrdVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 등급 마스터 삭제
	@PostMapping(value = "/am/cmns/deleteCmnsGrd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteCmnsGrd(@RequestBody CmnsGrdVO cmnsGrdVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// validation check

		// audit 항목
		cmnsGrdVO.setSysFrstInptUserId(getUserId());
		cmnsGrdVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsGrdVO.setSysLastChgUserId(getUserId());
		cmnsGrdVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = cmnsGrdService.deleteCmnsGrd(cmnsGrdVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 등급 목록 조회
	@PostMapping(value = "/am/cmns/selectApcGrdList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcGrdList(@RequestBody CmnsGrdVO cmnsGrdVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsGrdVO> resultList = new ArrayList<>();

		try {

			resultList = cmnsGrdService.selectApcGrdList(cmnsGrdVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}


	// APC 등급 등록
	@PostMapping(value = "/am/cmns/insertApcGrd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertApcGrd(@RequestBody CmnsGrdVO cmnsGrdVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// validation check

		// audit 항목
		cmnsGrdVO.setSysFrstInptUserId(getUserId());
		cmnsGrdVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsGrdVO.setSysLastChgUserId(getUserId());
		cmnsGrdVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = cmnsGrdService.insertApcGrd(cmnsGrdVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	// APC 등급 변경
	@PostMapping(value = "/am/cmns/updateApcGrd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateApcGrd(@RequestBody CmnsGrdVO cmnsGrdVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// validation check

		// audit 항목
		cmnsGrdVO.setSysFrstInptUserId(getUserId());
		cmnsGrdVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsGrdVO.setSysLastChgUserId(getUserId());
		cmnsGrdVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = cmnsGrdService.updateApcGrd(cmnsGrdVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 등급 삭제
	@PostMapping(value = "/am/cmns/deleteApcGrd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteApcGrd(@RequestBody CmnsGrdVO cmnsGrdVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// validation check

		// audit 항목
		cmnsGrdVO.setSysFrstInptUserId(getUserId());
		cmnsGrdVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsGrdVO.setSysLastChgUserId(getUserId());
		cmnsGrdVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = cmnsGrdService.deleteApcGrd(cmnsGrdVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 등급List 등록
	@PostMapping(value = "/am/cmns/insertApcGrdList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertApcGrdList(@RequestBody List<CmnsGrdVO> cmnsGrdList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// validation check
		int insertedCnt = 0;
		try {
			for (CmnsGrdVO cmnsGrdVO : cmnsGrdList) {
				// audit 항목
				cmnsGrdVO.setSysFrstInptUserId(getUserId());
				cmnsGrdVO.setSysFrstInptPrgrmId(getPrgrmId());
				cmnsGrdVO.setSysLastChgUserId(getUserId());
				cmnsGrdVO.setSysLastChgPrgrmId(getPrgrmId());
				insertedCnt =+ cmnsGrdService.insertApcGrd(cmnsGrdVO);
			}

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 등급List 변경
	@PostMapping(value = "/am/cmns/updateApcGrdList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateApcGrdList(@RequestBody List<CmnsGrdVO> cmnsGrdList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// validation check
		int updatedCnt = 0;
		try {
			for (CmnsGrdVO cmnsGrdVO : cmnsGrdList) {
				// audit 항목
				cmnsGrdVO.setSysLastChgUserId(getUserId());
				cmnsGrdVO.setSysLastChgPrgrmId(getPrgrmId());

				updatedCnt =+ cmnsGrdService.updateApcGrd(cmnsGrdVO);
			}


		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}
