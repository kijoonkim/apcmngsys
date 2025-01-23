package com.at.apcss.am.stat.web;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.at.apcss.am.stat.vo.StatCrtrVO;
import com.at.apcss.am.tot.vo.TotCrtrVO;
import com.at.apcss.am.tot.vo.TotMngVO;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.stat.service.StatMngService;
import com.at.apcss.am.stat.vo.StatMngVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;

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
public class StatMngController extends BaseController {

	@Resource(name = "statMngService")
	private StatMngService statMngService;

	@PostMapping(value = "/am/stat/selectStatCrtrDtlInUseList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectStatCrtrDtlInUseList(@RequestBody StatCrtrVO statCrtrVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<>();
		List<StatCrtrVO> resultList = new ArrayList<>();

		try {
			resultList = statMngService.selectStatCrtrDtlInUseList(statCrtrVO);
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


	@PostMapping(value = "/am/stat/selectCrtrList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCrtrList(@RequestBody StatCrtrVO statCrtrVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<StatCrtrVO> resultList = new ArrayList<>();

		try {
			resultList = statMngService.selectCrtrList(statCrtrVO);
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

	@PostMapping(value = "/am/stat/selectCrtrDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCrtrDtlList(@RequestBody StatCrtrVO statCrtrVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<StatCrtrVO> resultList = new ArrayList<>();

		try {
			resultList = statMngService.selectCrtrDtlList(statCrtrVO);
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


	// 통계기준 등록
	@PostMapping(value = "/am/stat/insertCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertCrtr(@RequestBody StatMngVO statMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			statMngVO.setSysFrstInptUserId(getUserId());
			statMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			statMngVO.setSysLastChgUserId(getUserId());
			statMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = statMngService.insertCrtr(statMngVO);
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


	// 통계기준 삭제
	@PostMapping(value = "/am/stat/deleteCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteCrtr(@RequestBody StatMngVO statMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			statMngVO.setSysFrstInptUserId(getUserId());
			statMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			statMngVO.setSysLastChgUserId(getUserId());
			statMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = statMngService.deleteCrtr(statMngVO);
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


	// 통계기준 상세 등록
	@PostMapping(value = "/am/stat/insertCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertCrtrDtl(@RequestBody StatMngVO statMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			statMngVO.setSysFrstInptUserId(getUserId());
			statMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			statMngVO.setSysLastChgUserId(getUserId());
			statMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = statMngService.insertCrtrDtl(statMngVO);
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


	// 통계기준 상세 삭제
	@PostMapping(value = "/am/stat/deleteCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteCrtrDtl(@RequestBody StatMngVO statMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			statMngVO.setSysFrstInptUserId(getUserId());
			statMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			statMngVO.setSysLastChgUserId(getUserId());
			statMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = statMngService.deleteCrtrDtl(statMngVO);
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

	@PostMapping(value = "/am/stat/selectPrdWrhsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	    public ResponseEntity<HashMap<String, Object>> selectPrdWrhsList(@RequestBody HashMap<String, Object> param, HttpServletRequest request) throws Exception {
	        HashMap<String, Object> resultMap = new HashMap<String, Object>();
	        try{
				resultMap = statMngService.selectPrdWrhsList(param);

	        }catch (Exception e) {
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