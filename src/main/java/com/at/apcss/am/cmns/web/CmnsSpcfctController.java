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

import com.at.apcss.am.cmns.service.CmnsSpcfctService;
import com.at.apcss.am.cmns.vo.CmnsSpcfctVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : CmnsSpcfctController.java
 * @Description : 규격 정보관리에 대한 Controller 클래스
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
public class CmnsSpcfctController extends BaseController {

	@Resource(name = "cmnsSpcfctService")
	private CmnsSpcfctService cmnsSpcfctService;

	// 규격 마스터 목록 조회
	@PostMapping(value = "/am/cmns/selectCmnsSpcfctList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCmnsSpcfctList(@RequestBody CmnsSpcfctVO cmnsSpcfctVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsSpcfctVO> resultList = new ArrayList<>();

		try {

			resultList = cmnsSpcfctService.selectCmnsSpcfctList(cmnsSpcfctVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	// 규격 마스터 등록
	@PostMapping(value = "/am/cmns/insertCmnsSpcfct.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertCmnsSpcfct(@RequestBody CmnsSpcfctVO cmnsSpcfctVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		// validation check
		
		// audit 항목
		cmnsSpcfctVO.setSysFrstInptUserId(getUserId());
		cmnsSpcfctVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsSpcfctVO.setSysLastChgUserId(getUserId());
		cmnsSpcfctVO.setSysLastChgPrgrmId(getPrgrmId());
		
		int insertedCnt = 0;
		
		try {
			insertedCnt = cmnsSpcfctService.insertCmnsSpcfct(cmnsSpcfctVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	// 규격 마스터 변경
	@PostMapping(value = "/am/cmns/updateCmnsSpcfct.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateCmnsSpcfct(@RequestBody CmnsSpcfctVO cmnsSpcfctVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		// validation check
		
		// audit 항목
		cmnsSpcfctVO.setSysFrstInptUserId(getUserId());
		cmnsSpcfctVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsSpcfctVO.setSysLastChgUserId(getUserId());
		cmnsSpcfctVO.setSysLastChgPrgrmId(getPrgrmId());
		
		int updatedCnt = 0;
		
		try {
			updatedCnt = cmnsSpcfctService.updateCmnsSpcfct(cmnsSpcfctVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	// 규격 마스터 삭제
	@PostMapping(value = "/am/cmns/deleteCmnsSpcfct.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteCmnsSpcfct(@RequestBody CmnsSpcfctVO cmnsSpcfctVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		// validation check
		
		// audit 항목
		cmnsSpcfctVO.setSysFrstInptUserId(getUserId());
		cmnsSpcfctVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsSpcfctVO.setSysLastChgUserId(getUserId());
		cmnsSpcfctVO.setSysLastChgPrgrmId(getPrgrmId());
		
		int deletedCnt = 0;
		
		try {
			deletedCnt = cmnsSpcfctService.deleteCmnsSpcfct(cmnsSpcfctVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	// APC 규격 목록 조회
	@PostMapping(value = "/am/cmns/selectApcSpcfctList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcSpcfctList(@RequestBody CmnsSpcfctVO cmnsSpcfctVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsSpcfctVO> resultList = new ArrayList<>();

		try {

			resultList = cmnsSpcfctService.selectApcSpcfctList(cmnsSpcfctVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	

	// APC 규격 등록
	@PostMapping(value = "/am/cmns/insertApcSpcfct.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertApcSpcfct(@RequestBody CmnsSpcfctVO cmnsSpcfctVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		// validation check
		
		// audit 항목
		cmnsSpcfctVO.setSysFrstInptUserId(getUserId());
		cmnsSpcfctVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsSpcfctVO.setSysLastChgUserId(getUserId());
		cmnsSpcfctVO.setSysLastChgPrgrmId(getPrgrmId());
		
		int insertedCnt = 0;
		
		try {
			insertedCnt = cmnsSpcfctService.insertApcSpcfct(cmnsSpcfctVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);
		
		return getSuccessResponseEntity(resultMap);
	}
	

	// APC 규격 변경
	@PostMapping(value = "/am/cmns/updateApcSpcfct.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateApcSpcfct(@RequestBody CmnsSpcfctVO cmnsSpcfctVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		// validation check
		
		// audit 항목
		cmnsSpcfctVO.setSysFrstInptUserId(getUserId());
		cmnsSpcfctVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsSpcfctVO.setSysLastChgUserId(getUserId());
		cmnsSpcfctVO.setSysLastChgPrgrmId(getPrgrmId());
		
		int updatedCnt = 0;
		
		try {
			updatedCnt = cmnsSpcfctService.updateApcSpcfct(cmnsSpcfctVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		
		return getSuccessResponseEntity(resultMap);
	}

	// APC 규격 삭제
	@PostMapping(value = "/am/cmns/deleteApcSpcfct.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteApcSpcfct(@RequestBody CmnsSpcfctVO cmnsSpcfctVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		// validation check
		
		// audit 항목
		cmnsSpcfctVO.setSysFrstInptUserId(getUserId());
		cmnsSpcfctVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsSpcfctVO.setSysLastChgUserId(getUserId());
		cmnsSpcfctVO.setSysLastChgPrgrmId(getPrgrmId());
		
		int deletedCnt = 0;
		
		try {
			deletedCnt = cmnsSpcfctService.deleteApcSpcfct(cmnsSpcfctVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		
		return getSuccessResponseEntity(resultMap);
	}
}
