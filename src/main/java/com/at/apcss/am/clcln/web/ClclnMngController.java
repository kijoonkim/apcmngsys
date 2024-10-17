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

import com.at.apcss.am.clcln.service.ClclnCrtrService;
import com.at.apcss.am.clcln.service.ClclnUntprcService;
import com.at.apcss.am.clcln.vo.ClclnCrtrVO;
import com.at.apcss.am.clcln.vo.ClclnMngVO;
import com.at.apcss.am.clcln.vo.ClclnUntprcVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : ClclnUntprcController.java
 * @Description : 정산단가관리 대한 Controller 클래스
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
public class ClclnMngController extends BaseController {

	// 정산기준
	@Resource(name = "clclnCrtrService")
	private ClclnCrtrService clclnCrtrService;

	// 정산단가
	@Resource(name = "clclnUntprcService")
	private ClclnUntprcService clclnUntprcService;

	
	// APC 정산기준 조회
	@PostMapping(value = "/am/clcln/selectClclnCrtrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectClclnCrtrList(@RequestBody ClclnCrtrVO clclnCrtrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ClclnCrtrVO> resultList = new ArrayList<>();
		
		try {
			resultList = clclnCrtrService.selectClclnCrtrList(clclnCrtrVO);
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
	
	// APC 정산기준 등록
	@PostMapping(value = "/am/clcln/insertClclnCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertClclnCrtr(@RequestBody ClclnMngVO clclnMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			clclnMngVO.setSysFrstInptUserId(getUserId());
			clclnMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			clclnMngVO.setSysLastChgUserId(getUserId());
			clclnMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = clclnCrtrService.insertClclnCrtr(clclnMngVO);
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
	
	// APC 정산기준 삭제
	@PostMapping(value = "/am/clcln/deleteClclnCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteClclnCrtr(@RequestBody ClclnMngVO clclnMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			clclnMngVO.setSysFrstInptUserId(getUserId());
			clclnMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			clclnMngVO.setSysLastChgUserId(getUserId());
			clclnMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = clclnCrtrService.deleteClclnCrtr(clclnMngVO);
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
	
	// APC 정산기준 상세 등록
	@PostMapping(value = "/am/clcln/insertClclnCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertClclnCrtrDtl(@RequestBody ClclnMngVO clclnMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			clclnMngVO.setSysFrstInptUserId(getUserId());
			clclnMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			clclnMngVO.setSysLastChgUserId(getUserId());
			clclnMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = clclnCrtrService.insertClclnCrtrDtl(clclnMngVO);
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
	
	// APC 정산기준 상세 삭제
	@PostMapping(value = "/am/clcln/deleteClclnCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteClclnCrtrDtl(@RequestBody ClclnMngVO clclnMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			clclnMngVO.setSysFrstInptUserId(getUserId());
			clclnMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			clclnMngVO.setSysLastChgUserId(getUserId());
			clclnMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = clclnCrtrService.deleteClclnCrtrDtl(clclnMngVO);
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
	
	// APC 정산기준 상세 조회
	@PostMapping(value = "/am/clcln/selectClclnCrtrDtlList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectClclnCrtrDtlList(@RequestBody ClclnCrtrVO clclnCrtrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ClclnCrtrVO> resultList = new ArrayList<>();
		
		try {
			resultList = clclnCrtrService.selectClclnCrtrDtlList(clclnCrtrVO);
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
	
	
	// APC 정산기준 상세 조회 (사용중)
	@PostMapping(value = "/am/clcln/selectCrtrDtlListInUse.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCrtrDtlListInUse(@RequestBody ClclnCrtrVO clclnCrtrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ClclnCrtrVO> resultList = new ArrayList<>();
		
		try {
			resultList = clclnCrtrService.selectCrtrDtlListInUse(clclnCrtrVO);
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
	
	
	// APC 정산단가 조회
	@PostMapping(value = "/am/clcln/selectApcClclnUntprcList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcClclnUntprcList(@RequestBody ClclnUntprcVO clclnUntprcVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ClclnUntprcVO> resultList = new ArrayList<>();
		try {
			resultList = clclnUntprcService.selectApcClclnUntprcList(clclnUntprcVO);
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
	
	

	// APC 정산단가 마스터 등록
	@PostMapping(value = "/am/clcln/insertClclnUntprcMstr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertClclnUntprcMstr(@RequestBody ClclnUntprcVO clclnUntprcVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			clclnUntprcVO.setSysFrstInptUserId(getUserId());
			clclnUntprcVO.setSysFrstInptPrgrmId(getPrgrmId());
			clclnUntprcVO.setSysLastChgUserId(getUserId());
			clclnUntprcVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = clclnUntprcService.insertClclnUntprcMstr(clclnUntprcVO);
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
	
	// APC 정산단가 마스터 변경
	@PostMapping(value = "/am/clcln/updateClclnUntprcMstr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateClclnUntprcMstr(@RequestBody ClclnUntprcVO clclnUntprcVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			clclnUntprcVO.setSysFrstInptUserId(getUserId());
			clclnUntprcVO.setSysFrstInptPrgrmId(getPrgrmId());
			clclnUntprcVO.setSysLastChgUserId(getUserId());
			clclnUntprcVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = clclnUntprcService.updateClclnUntprcMstr(clclnUntprcVO);
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
	
	// APC 정산단가 등록
	@PostMapping(value = "/am/clcln/insertApcUntprc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertApcUntprc(@RequestBody ClclnMngVO clclnMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			clclnMngVO.setSysFrstInptUserId(getUserId());
			clclnMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			clclnMngVO.setSysLastChgUserId(getUserId());
			clclnMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = clclnUntprcService.insertApcUntprc(clclnMngVO);
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
	
	// APC 정산단가 등록
	@PostMapping(value = "/am/clcln/deleteApcUntprc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteApcUntprc(@RequestBody ClclnMngVO clclnMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			clclnMngVO.setSysFrstInptUserId(getUserId());
			clclnMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			clclnMngVO.setSysLastChgUserId(getUserId());
			clclnMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = clclnUntprcService.deleteApcUntprc(clclnMngVO);
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
	
	
	// APC 정산단가 마스터 조회
	@PostMapping(value = "/am/clcln/selectClclnUntprcMstrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectClclnUntprcMstrList(@RequestBody ClclnUntprcVO clclnUntprcVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ClclnUntprcVO> resultList = new ArrayList<>();
		try {
			resultList = clclnUntprcService.selectClclnUntprcMstrList(clclnUntprcVO);
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
/*		
	// 정산단가 변경
	@PostMapping(value = "/am/clcln/updateClclnUntprcList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateClclnUntprcList(@RequestBody List<ClclnUntprcVO> clclnUntprcList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			
			for ( ClclnUntprcVO clcln : clclnUntprcList ) {
				clcln.setSysFrstInptPrgrmId(getPrgrmId());
				clcln.setSysFrstInptUserId(getUserId());
				clcln.setSysLastChgPrgrmId(getPrgrmId());
				clcln.setSysLastChgUserId(getUserId());
			}
			
			HashMap<String, Object> rtnObj = clclnUntprcService.updateClclnUntprcList(clclnUntprcList);
			
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

*/	
	
	
}

