package com.at.apcss.am.apc.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.apc.service.ApcLinkService;
import com.at.apcss.am.apc.vo.ApcLinkVO;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;


@Controller
public class ApcLinkController extends BaseController{


	// APC 환경설정
	@Resource(name = "apcLinkService")
	private ApcLinkService apcLinkService;

	// APC 연계정보 조회
	@PostMapping(value = "/am/apc/selectApcLinkStts.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcLinkStts(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		ApcLinkVO resultVO = new ApcLinkVO();
		try {
			resultVO = apcLinkService.selectApcLink(apcLinkVO);
			
			if (resultVO != null) {
				resultVO.setApcKey(null);
			} else {
				resultVO = new ApcLinkVO();
				BeanUtils.copyProperties(apcLinkVO, resultVO);
			}
			
			if (!StringUtils.hasText(resultVO.getTrsmMatSttsCd())) {
				resultVO.setTrsmMatSttsCd(AmConstants.CON_TRSM_MAT_STTS_CD_NONE);
			}
			
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

		return getSuccessResponseEntity(resultMap);
	}
	
	// APC 연계 상태 update
	@PostMapping(value = "/am/apc/updateApcLinkStts.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateApcLinkStts(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			
			apcLinkVO.setSysFrstInptUserId(getUserId());
			apcLinkVO.setSysFrstInptPrgrmId(getPrgrmId());
			apcLinkVO.setSysLastChgUserId(getUserId());
			apcLinkVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = apcLinkService.updateLinkStts(apcLinkVO);
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

	// APC 연계기기 조회
	@PostMapping(value = "/am/apc/selectApcLinkTrsmMatStts.do")
	public ResponseEntity<HashMap<String, Object>> selectApcLinkTrsmMat(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		ApcLinkVO resultVO = new ApcLinkVO();
		
		try {

			resultVO = apcLinkService.selectApcLinkTrsmMat(apcLinkVO);
			
			if (resultVO != null) {
				resultVO.setApcKey(null);
			} else {
				resultVO = new ApcLinkVO();
				BeanUtils.copyProperties(apcLinkVO, resultVO);
			}
			
			if (!StringUtils.hasText(resultVO.getTrsmMatSttsCd())) {
				resultVO.setTrsmMatSttsCd(AmConstants.CON_TRSM_MAT_STTS_CD_NONE);
			}
			
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

		return getSuccessResponseEntity(resultMap);
	}
	
	
	// APC 연계기기 목록 조회
	@PostMapping(value = "/am/apc/selectApcLinkTrsmMatList.do")
	public ResponseEntity<HashMap<String, Object>> selectApcLinkTrsmMatList(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		List<ApcLinkVO> resultList = new ArrayList<>();
		
		try {

			resultList = apcLinkService.selectApcLinkTrsmMatList(apcLinkVO);
			
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
		
	// APC 연계기기 등록
	@PostMapping(value = "/am/apc/insertApcLinkTrsmMatList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertApcLinkTrsmMatList(@RequestBody List<ApcLinkVO> trsmMatList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			
			for ( ApcLinkVO trsmMat : trsmMatList ) {
				trsmMat.setSysFrstInptUserId(getUserId());
				trsmMat.setSysFrstInptPrgrmId(getPrgrmId());
				trsmMat.setSysLastChgUserId(getUserId());
				trsmMat.setSysLastChgPrgrmId(getPrgrmId());
			}
			
			HashMap<String, Object> rtnObj = apcLinkService.insertApcLinkTrsmMatList(trsmMatList);
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
	
	
	// APC 연계기기 삭제
	@PostMapping(value = "/am/apc/deleteApcLinkTrsmMat.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteApcLinkTrsmMat(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			
			apcLinkVO.setSysFrstInptUserId(getUserId());
			apcLinkVO.setSysFrstInptPrgrmId(getPrgrmId());
			apcLinkVO.setSysLastChgUserId(getUserId());
			apcLinkVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = apcLinkService.deleteApcLinkTrsmMat(apcLinkVO);
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
	
	// APC 연계기기 종류 등록
	@PostMapping(value = "/am/apc/insertApcLinkTrsmKndList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertApcLinkTrsmKndList(@RequestBody List<ApcLinkVO> trsmKndList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			
			for ( ApcLinkVO trsmKnd : trsmKndList ) {
				trsmKnd.setSysFrstInptUserId(getUserId());
				trsmKnd.setSysFrstInptPrgrmId(getPrgrmId());
				trsmKnd.setSysLastChgUserId(getUserId());
				trsmKnd.setSysLastChgPrgrmId(getPrgrmId());
			}
			
			HashMap<String, Object> rtnObj = apcLinkService.insertApcLinkTrsmKndList(trsmKndList);
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
	
	// APC 연계기기 삭제
	@PostMapping(value = "/am/apc/deleteApcLinkTrsmKnd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteApcLinkTrsmKnd(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			
			apcLinkVO.setSysFrstInptUserId(getUserId());
			apcLinkVO.setSysFrstInptPrgrmId(getPrgrmId());
			apcLinkVO.setSysLastChgUserId(getUserId());
			apcLinkVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = apcLinkService.deleteApcLinkTrsmKnd(apcLinkVO);
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
	
	
	// APC 연계기기 조회
	@PostMapping(value = "/am/apc/selectApcLinkTrsmMatSttsList.do")
	public ResponseEntity<HashMap<String, Object>> selectApcLinkTrsmMatSttsList(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		List<ApcLinkVO> resultList = new ArrayList<>();
		
		try {

			resultList = apcLinkService.selectApcLinkTrsmMatSttsList(apcLinkVO);
			
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
	
	// APC 연계기기 상태 update
	@PostMapping(value = "/am/apc/updateLinkTrsmMatStts.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateLinkTrsmMatStts(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			
			apcLinkVO.setSysFrstInptUserId(getUserId());
			apcLinkVO.setSysFrstInptPrgrmId(getPrgrmId());
			apcLinkVO.setSysLastChgUserId(getUserId());
			apcLinkVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = apcLinkService.updateLinkTrsmMatStts(apcLinkVO);
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
	
	// APC 연계기기 상태 update : 요청
	@PostMapping(value = "/am/apc/updateLinkTrsmReq.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateLinkTrsmReq(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			
			apcLinkVO.setSysFrstInptUserId(getUserId());
			apcLinkVO.setSysFrstInptPrgrmId(getPrgrmId());
			apcLinkVO.setSysLastChgUserId(getUserId());
			apcLinkVO.setSysLastChgPrgrmId(getPrgrmId());
			
			apcLinkVO.setLinkStts(AmConstants.CON_LINK_STTS_REQ_DONE);
			
			HashMap<String, Object> rtnObj = apcLinkService.updateLinkTrsmMatStts(apcLinkVO);
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
	
	// APC 연계기기 상태 update : 요청
	@PostMapping(value = "/am/apc/updateLinkTrsmReqCncl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateLinkTrsmReqCncl(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			
			apcLinkVO.setSysFrstInptUserId(getUserId());
			apcLinkVO.setSysFrstInptPrgrmId(getPrgrmId());
			apcLinkVO.setSysLastChgUserId(getUserId());
			apcLinkVO.setSysLastChgPrgrmId(getPrgrmId());
			
			apcLinkVO.setLinkStts(AmConstants.CON_LINK_STTS_REQ_CNCL);
			
			HashMap<String, Object> rtnObj = apcLinkService.updateLinkTrsmMatStts(apcLinkVO);
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
