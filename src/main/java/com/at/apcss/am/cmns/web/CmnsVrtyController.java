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

	@Resource(name = "cmnsVrtyService")
	private CmnsVrtyService cmnsVrtyService;

	// 품종 마스터 목록 조회
	@PostMapping(value = "/am/cmns/selectCmnsVrtyList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCmnsVrtyList(@RequestBody CmnsVrtyVO cmnsVrtyVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsVrtyVO> resultList = new ArrayList<>();

		try {

			resultList = cmnsVrtyService.selectCmnsVrtyList(cmnsVrtyVO);

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

	// 품종 마스터 등록
	@PostMapping(value = "/am/cmns/insertCmnsVrty.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertCmnsVrty(@RequestBody CmnsVrtyVO cmnsVrtyVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// validation check

		// audit 항목
		cmnsVrtyVO.setSysFrstInptUserId(getUserId());
		cmnsVrtyVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsVrtyVO.setSysLastChgUserId(getUserId());
		cmnsVrtyVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = cmnsVrtyService.insertCmnsVrty(cmnsVrtyVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 품종 마스터 변경
	@PostMapping(value = "/am/cmns/updateCmnsVrty.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateCmnsVrty(@RequestBody CmnsVrtyVO cmnsVrtyVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// validation check

		// audit 항목
		cmnsVrtyVO.setSysFrstInptUserId(getUserId());
		cmnsVrtyVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsVrtyVO.setSysLastChgUserId(getUserId());
		cmnsVrtyVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = cmnsVrtyService.updateCmnsVrty(cmnsVrtyVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 품종 마스터 삭제
	@PostMapping(value = "/am/cmns/deleteCmnsVrty.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteCmnsVrty(@RequestBody CmnsVrtyVO cmnsVrtyVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// validation check

		// audit 항목
		cmnsVrtyVO.setSysFrstInptUserId(getUserId());
		cmnsVrtyVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsVrtyVO.setSysLastChgUserId(getUserId());
		cmnsVrtyVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = cmnsVrtyService.deleteCmnsVrty(cmnsVrtyVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 품종 목록 조회
	@PostMapping(value = "/am/cmns/selectApcVrtyList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcVrtyList(@RequestBody CmnsVrtyVO cmnsVrtyVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsVrtyVO> resultList = new ArrayList<>();

		try {

			resultList = cmnsVrtyService.selectApcVrtyList(cmnsVrtyVO);

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


	// APC 품종 등록
	@PostMapping(value = "/am/cmns/insertApcVrty.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertApcVrty(@RequestBody CmnsVrtyVO cmnsVrtyVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// validation check

		// audit 항목
		cmnsVrtyVO.setSysFrstInptUserId(getUserId());
		cmnsVrtyVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsVrtyVO.setSysLastChgUserId(getUserId());
		cmnsVrtyVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = cmnsVrtyService.insertApcVrty(cmnsVrtyVO);

			if(insertedCnt != 0) {
				resultMap.put(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.");
				return getErrorResponseEntity(resultMap);
			}

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}


	// APC 품종 변경
	@PostMapping(value = "/am/cmns/updateApcVrty.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateApcVrty(@RequestBody CmnsVrtyVO cmnsVrtyVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// validation check

		// audit 항목
		cmnsVrtyVO.setSysFrstInptUserId(getUserId());
		cmnsVrtyVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsVrtyVO.setSysLastChgUserId(getUserId());
		cmnsVrtyVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = cmnsVrtyService.updateApcVrty(cmnsVrtyVO);

			if(updatedCnt != 0) {
				resultMap.put(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다.");
				return  getErrorResponseEntity(resultMap);
			}

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}

	// APC 품종 삭제
	@PostMapping(value = "/am/cmns/deleteApcVrty.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteApcVrty(@RequestBody CmnsVrtyVO cmnsVrtyVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		// validation check

		// audit 항목
		cmnsVrtyVO.setSysFrstInptUserId(getUserId());
		cmnsVrtyVO.setSysFrstInptPrgrmId(getPrgrmId());
		cmnsVrtyVO.setSysLastChgUserId(getUserId());
		cmnsVrtyVO.setSysLastChgPrgrmId(getPrgrmId());

		try {

			HashMap<String, Object> rtnObj = cmnsVrtyService.deleteApcVrty(cmnsVrtyVO);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	// APC 품종 등록
	@PostMapping(value = "/am/cmns/multiApcVrtyList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiApcVrtyList(@RequestBody List<CmnsVrtyVO> cmnsVrtyList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			for (CmnsVrtyVO cmnsVrtyVO : cmnsVrtyList) {
				cmnsVrtyVO.setSysFrstInptUserId(getUserId());
				cmnsVrtyVO.setSysFrstInptPrgrmId(getPrgrmId());
				cmnsVrtyVO.setSysLastChgUserId(getUserId());
				cmnsVrtyVO.setSysLastChgPrgrmId(getPrgrmId());
			}
			HashMap<String, Object> rtnObj = cmnsVrtyService.multiSaveApcVrtyList(cmnsVrtyList);
            if(rtnObj != null) {
            	return getErrorResponseEntity(rtnObj);
            }
		} catch (Exception e) {
			logger.debug(e.getMessage());
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
