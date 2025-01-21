package com.at.apcss.am.invntr.web;

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

import com.at.apcss.am.invntr.service.InvntrAiMngService;
import com.at.apcss.am.invntr.service.InvntrAtrbService;
import com.at.apcss.am.invntr.service.InvntrGrdMngService;
import com.at.apcss.am.invntr.service.InvntrGrdService;
import com.at.apcss.am.invntr.vo.InvntrAiMngVO;
import com.at.apcss.am.invntr.vo.InvntrMngVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SortInvntrController.java
 * @Description : 선별재고관리 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.23  김현호        최초 생성
 * </pre>
 */
@Controller
public class InvntrGrdMngController extends BaseController {
	@Resource(name = "invntrGrdMngService")
	private InvntrGrdMngService invntrGrdMngService;

	@Resource(name = "invntrGrdService")
	private InvntrGrdService invntrGrdService;

	@Resource(name = "invntrAtrbService")
	private InvntrAtrbService invntrAtrbService;

	@Resource(name = "invntrAiMngService")
	private InvntrAiMngService invntrAiMngService;





	@PostMapping(value = "/am/invntr/selectInvntrGrdMng.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectInvntrGrdMng(@RequestBody InvntrMngVO invntrMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrMngVO> resultList = new ArrayList<>();
		try {

			resultList = invntrGrdMngService.selectInvntrGrdMng(invntrMngVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	@PostMapping(value = "/am/invntr/updateRawMtrInvntrGrd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateRawMtrInvntrGrd(@RequestBody InvntrMngVO invntrMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrMngVO> resultList = new ArrayList<>();
		try {

			invntrMngVO.setSysLastChgUserId(getUserId());
			invntrMngVO.setSysLastChgPrgrmId(getPrgrmId());
			invntrGrdService.updateRawMtrInvntrGrd(invntrMngVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	@PostMapping(value = "/am/invntr/updateSortInvntrGrd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateSortInvntrGrd(@RequestBody InvntrMngVO invntrMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrMngVO> resultList = new ArrayList<>();
		try {
			invntrMngVO.setSysLastChgUserId(getUserId());
			invntrMngVO.setSysLastChgPrgrmId(getPrgrmId());
			invntrGrdService.updateSortInvntrGrd(invntrMngVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	@PostMapping(value = "/am/invntr/updateGdsInvntrGrd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateGdsInvntrGrd(@RequestBody InvntrMngVO invntrMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrMngVO> resultList = new ArrayList<>();
		try {

			invntrMngVO.setSysLastChgUserId(getUserId());
			invntrMngVO.setSysLastChgPrgrmId(getPrgrmId());
			invntrGrdService.updateGdsInvntrGrd(invntrMngVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	@PostMapping(value = "/am/invntr/updateRawMtrInvntrType.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateRawMtrInvntrType(@RequestBody List<InvntrMngVO> invntrMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrMngVO> resultList = new ArrayList<>();
		try {
			invntrMngVOList.forEach(invntrMngVO -> {
				invntrMngVO.setSysLastChgUserId(getUserId());
				invntrMngVO.setSysLastChgPrgrmId(getPrgrmId());
			});
			invntrAtrbService.updateRawMtrInvntrType(invntrMngVOList);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	@PostMapping(value = "/am/invntr/updateSortInvntrType.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateSortInvntrType(@RequestBody List<InvntrMngVO> invntrMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrMngVO> resultList = new ArrayList<>();
		try {
			invntrMngVOList.forEach(invntrMngVO -> {
				invntrMngVO.setSysLastChgUserId(getUserId());
				invntrMngVO.setSysLastChgPrgrmId(getPrgrmId());
			});
			invntrAtrbService.updateSortInvntrType(invntrMngVOList);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	@PostMapping(value = "/am/invntr/updateGdsInvntrType.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateGdsInvntrType(@RequestBody List<InvntrMngVO> invntrMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrMngVO> resultList = new ArrayList<>();
		try {
			invntrMngVOList.forEach(invntrMngVO -> {
				invntrMngVO.setSysLastChgUserId(getUserId());
				invntrMngVO.setSysLastChgPrgrmId(getPrgrmId());
			});
			invntrAtrbService.updateGdsInvntrType(invntrMngVOList);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	@PostMapping(value = "/am/invntr/selectInvntrAiCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectInvntrAiCrtr(@RequestBody InvntrAiMngVO invntrAiMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrAiMngVO> resultList = new ArrayList<>();
		try {
			resultList = invntrAiMngService.selectInvntrAiCrtr(invntrAiMngVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	@PostMapping(value = "/am/invntr/insertInvntrAiCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertInvntrAiCrtr(@RequestBody List<InvntrAiMngVO> invntrMngVOList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrAiMngVO> resultList = new ArrayList<>();
		try {
			invntrMngVOList.forEach(invntrMngVO -> {
				invntrMngVO.setSysFrstInptUserId(getUserId());
				invntrMngVO.setSysFrstInptPrgrmId(getPrgrmId());
				invntrMngVO.setSysLastChgUserId(getUserId());
				invntrMngVO.setSysLastChgPrgrmId(getPrgrmId());
			});
			invntrAiMngService.insertInvntrAiCrtr(invntrMngVOList);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	@PostMapping(value = "/am/invntr/deleteInvntrAiCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteInvntrAiCrtr(@RequestBody InvntrAiMngVO invntrMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrAiMngVO> resultList = new ArrayList<>();
		try {
			invntrAiMngService.deleteInvntrAiCrtr(invntrMngVO);
		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	@PostMapping(value = "/am/invntr/selectInvntrAiPlan.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectInvntrAiPlan(@RequestBody InvntrAiMngVO invntrAiMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrAiMngVO> resultList = new ArrayList<>();
		try {
			resultList = invntrAiMngService.selectInvntrAiPlan(invntrAiMngVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	@PostMapping(value = "/am/invntr/insertInvntrAiPlan.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertInvntrAiPlan(@RequestBody InvntrAiMngVO invntrMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrAiMngVO> resultList = new ArrayList<>();
		try {

			invntrMngVO.setSysFrstInptUserId(getUserId());
			invntrMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			invntrMngVO.setSysLastChgUserId(getUserId());
			invntrMngVO.setSysLastChgPrgrmId(getPrgrmId());
			invntrAiMngService.insertInvntrAiPlan(invntrMngVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	@PostMapping(value = "/am/invntr/deleteInvntrAiPlan.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteInvntrAiPlan(@RequestBody InvntrAiMngVO invntrMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrAiMngVO> resultList = new ArrayList<>();
		try {
			invntrAiMngService.deleteInvntrAiPlan(invntrMngVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	@PostMapping(value = "/am/invntr/selectInvntrAiMng.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectInvntrAiMng(@RequestBody InvntrAiMngVO invntrAiMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrAiMngVO> resultList = new ArrayList<>();
		try {
			resultList = invntrAiMngService.selectInvntrAiMng(invntrAiMngVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	@PostMapping(value = "/am/invntr/insertInvntrAiMng.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertInvntrAiMng(@RequestBody InvntrAiMngVO invntrMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrAiMngVO> resultList = new ArrayList<>();
		try {

			invntrMngVO.setSysFrstInptUserId(getUserId());
			invntrMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			invntrMngVO.setSysLastChgUserId(getUserId());
			invntrMngVO.setSysLastChgPrgrmId(getPrgrmId());
			invntrAiMngService.insertInvntrAiMng(invntrMngVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

	@PostMapping(value = "/am/invntr/deleteInvntrAiMng.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteInvntrAiMng(@RequestBody InvntrAiMngVO invntrMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<InvntrAiMngVO> resultList = new ArrayList<>();
		try {
			invntrAiMngService.deleteInvntrAiMng(invntrMngVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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




}
