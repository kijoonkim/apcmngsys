package com.at.apcss.am.shpgot.web;

import com.at.apcss.am.shpgot.service.ShpgotMngService;
import com.at.apcss.am.shpgot.vo.ShpgotCrtrVO;
import com.at.apcss.am.shpgot.vo.ShpgotMngVO;
import com.at.apcss.am.shpgot.vo.ShpgotRsltVO;
import com.at.apcss.am.stat.service.StatMngService;
import com.at.apcss.am.stat.vo.StatCrtrVO;
import com.at.apcss.am.stat.vo.StatMngVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : statController.java
 * @Description : 집계정보관리
 * @author 박승진
 * @since 2024.10.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.10.23   박승진         최초 생성
 * </pre>
 */
@Controller
public class ShpgotMngController extends BaseController {

	@Resource(name = "shpgotMngService")
	private ShpgotMngService shpgotMngService;


	@PostMapping(value = "/am/shpgot/selectCrtrList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCrtrList(@RequestBody ShpgotCrtrVO shpgotCrtrVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ShpgotCrtrVO> resultList = new ArrayList<>();

		try {
			resultList = shpgotMngService.selectCrtrList(shpgotCrtrVO);
		} catch(Exception e) {
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

	@PostMapping(value = "/am/shpgot/selectCrtrDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCrtrDtlList(@RequestBody ShpgotCrtrVO shpgotCrtrVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ShpgotCrtrVO> resultList = new ArrayList<>();

		try {
			resultList = shpgotMngService.selectCrtrDtlList(shpgotCrtrVO);
		} catch(Exception e) {
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


	// 기준 등록
	@PostMapping(value = "/am/shpgot/insertCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertCrtr(@RequestBody ShpgotMngVO shpgotMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			shpgotMngVO.setSysFrstInptUserId(getUserId());
			shpgotMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			shpgotMngVO.setSysLastChgUserId(getUserId());
			shpgotMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = shpgotMngService.insertCrtr(shpgotMngVO);
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


	// 기준 삭제
	@PostMapping(value = "/am/shpgot/deleteCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteCrtr(@RequestBody ShpgotMngVO shpgotMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			shpgotMngVO.setSysFrstInptUserId(getUserId());
			shpgotMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			shpgotMngVO.setSysLastChgUserId(getUserId());
			shpgotMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = shpgotMngService.deleteCrtr(shpgotMngVO);
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


	// 기준 상세 등록
	@PostMapping(value = "/am/shpgot/insertCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertCrtrDtl(@RequestBody ShpgotMngVO shpgotMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			shpgotMngVO.setSysFrstInptUserId(getUserId());
			shpgotMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			shpgotMngVO.setSysLastChgUserId(getUserId());
			shpgotMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = shpgotMngService.insertCrtrDtl(shpgotMngVO);
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


	// 기준 상세 삭제
	@PostMapping(value = "/am/shpgot/deleteCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteCrtrDtl(@RequestBody ShpgotMngVO shpgotMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			shpgotMngVO.setSysFrstInptUserId(getUserId());
			shpgotMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			shpgotMngVO.setSysLastChgUserId(getUserId());
			shpgotMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = shpgotMngService.deleteCrtrDtl(shpgotMngVO);
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

	// 원물반출 등록
	@PostMapping(value = "/am/shpgot/insertShpgotRsltRawMtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertShpgotRsltRawMtr(@RequestBody ShpgotMngVO shpgotMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			shpgotMngVO.setSysFrstInptUserId(getUserId());
			shpgotMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			shpgotMngVO.setSysLastChgUserId(getUserId());
			shpgotMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = shpgotMngService.insertShpgotRsltRawMtr(shpgotMngVO);
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

	// 원물반출 취소
	@PostMapping(value = "/am/shpgot/deleteShpgotRsltRawMtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteShpgotRsltRawMtr(@RequestBody ShpgotMngVO shpgotMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			shpgotMngVO.setSysFrstInptUserId(getUserId());
			shpgotMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			shpgotMngVO.setSysLastChgUserId(getUserId());
			shpgotMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = shpgotMngService.deleteShpgotRsltRawMtr(shpgotMngVO);
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


	@PostMapping(value = "/am/shpgot/selectShpgotRsltRawMtrList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectShpgotRsltRawMtrList(@RequestBody ShpgotRsltVO shpgotRsltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ShpgotRsltVO> resultList = new ArrayList<>();

		try {
			resultList = shpgotMngService.selectShpgotRsltRawMtrList(shpgotRsltVO);
		} catch(Exception e) {
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

	@PostMapping(value = "/am/shpgot/insertShpgotRsltGds.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertShpgotRsltGds(@RequestBody ShpgotMngVO shpgotMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			shpgotMngVO.setSysFrstInptUserId(getUserId());
			shpgotMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			shpgotMngVO.setSysLastChgUserId(getUserId());
			shpgotMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = shpgotMngService.insertShpgotRsltGds(shpgotMngVO);
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


	@PostMapping(value = "/am/shpgot/deleteShpgotRsltGds.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteShpgotRsltGds(@RequestBody ShpgotMngVO shpgotMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			shpgotMngVO.setSysFrstInptUserId(getUserId());
			shpgotMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			shpgotMngVO.setSysLastChgUserId(getUserId());
			shpgotMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = shpgotMngService.deleteShpgotRsltGds(shpgotMngVO);
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



	@PostMapping(value = "/am/shpgot/selectShpgotRsltGdsComList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectShpgotRsltGdsComList(@RequestBody ShpgotRsltVO shpgotRsltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ShpgotRsltVO> resultList = new ArrayList<>();

		try {
			resultList = shpgotMngService.selectShpgotRsltGdsComList(shpgotRsltVO);
		} catch(Exception e) {
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



	@PostMapping(value = "/am/shpgot/selectShpgotRsltGdsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectShpgotRsltGdsList(@RequestBody ShpgotRsltVO shpgotRsltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ShpgotRsltVO> resultList = new ArrayList<>();

		try {
			resultList = shpgotMngService.selectShpgotRsltGdsList(shpgotRsltVO);
		} catch(Exception e) {
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