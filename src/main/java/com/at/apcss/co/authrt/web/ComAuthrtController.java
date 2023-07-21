package com.at.apcss.co.authrt.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.json.JsonObject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.ConvertUtils;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.co.authrt.service.ComAuthrtService;
import com.at.apcss.co.authrt.vo.ComAuthrtMenuVO;
import com.at.apcss.co.authrt.vo.ComAuthrtVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectReader;
/**
 * 권한관리 처리하는 컨트롤러 클래스
 * @author SI개발부 김호
 * @since 2023.06.12
 * @version 1.0
 * @see
 *
 * <pre>
 * << 권한관리(Modification Information) >>
 *
 *  수정일      	수정자      	수정내용
 *  ----------	----------	---------------------------
 *  2023.06.12  김호     	최초 생성
 *
 *  </pre>
 */
@RestController
@Controller
public class ComAuthrtController extends BaseController{

	@Resource(name = "comAuthrtService")
	private ComAuthrtService comAuthrtService;

	// 권한그룹관리
	@RequestMapping("/co/authrt/comAuthrtMng.do")
	public String doAuth() {

		return "apcss/co/authrt/comAuthrtMng";
	}

	// 권한그룹별 사용자관리
	@RequestMapping("/co/authrt/comAuthrtUserMng.do")
	public String doAuthUser() {

		return "apcss/co/authrt/comAuthrtUserMng";
	}
	
	/**
	 * 권한그룹 목록 조회
	 * @param comAuthrtVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/co/authrt/selectComAuthrtList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComAuthrtList(@RequestBody ComAuthrtVO comAuthrtVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ComAuthrtVO> resultList;
		
		try {
			resultList = comAuthrtService.selectComAuthrtList(comAuthrtVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	/**
	 * 권한그룹 단건 등록
	 * @param comAuthrtVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/co/authrt/insertComAuthrt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertComAuthrt(@RequestBody ComAuthrtVO comAuthrtVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		// validation check
		
		// audit 항목
		comAuthrtVO.setSysFrstInptUserId(getUserId());
		comAuthrtVO.setSysFrstInptPrgrmId(getPrgrmId());
		comAuthrtVO.setSysLastChgUserId(getUserId());
		comAuthrtVO.setSysLastChgPrgrmId(getPrgrmId());
		
		int insertedCnt = 0;
		
		try {
			insertedCnt = comAuthrtService.insertComAuthrt(comAuthrtVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	/**
	 * 권한그룹 변경
	 * @param comAuthrtVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/co/authrt/updateComAuthrt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateComAuthrt(@RequestBody ComAuthrtVO comAuthrtVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		// validation check
		
		// audit 항목
		comAuthrtVO.setSysLastChgUserId(getUserId());
		comAuthrtVO.setSysLastChgPrgrmId(getPrgrmId());
		
		int updatedCnt = 0;
		
		try {
			updatedCnt = comAuthrtService.updateComAuthrt(comAuthrtVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	/**
	 * 권한그룹 삭제
	 * @param comAuthrtVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/co/authrt/deleteComAuthrt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteComAuthrt(@RequestBody ComAuthrtVO comAuthrtVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		// validation check
		
		// audit 항목
		comAuthrtVO.setSysLastChgUserId(getUserId());
		comAuthrtVO.setSysLastChgPrgrmId(getPrgrmId());
		
		int deletedCnt = 0;
		
		try {
			deletedCnt = comAuthrtService.deleteComAuthrt(comAuthrtVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	
	@PostMapping(value = "/co/authrt/selectComAuthrtMenuList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComAuthrtMenuList(@RequestBody ComAuthrtMenuVO comAuthrtMenuVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		List<ComAuthrtMenuVO> resultList;
		
		try {
			resultList = comAuthrtService.selectComAuthrtMenuList(comAuthrtMenuVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/co/authrt/selectComAuthrtMenuTreeList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComAuthrtMenuTreeList(@RequestBody ComAuthrtMenuVO comAuthrtMenuVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		List<ComAuthrtMenuVO> resultList;
		
		try {
			resultList = comAuthrtService.selectComAuthrtMenuTreeList(comAuthrtMenuVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	/**
	 * 권한메뉴 목록 등록
	 */
	@PostMapping(value = "/co/authrt/insertComAuthrtMenuList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertComAuthrtMenuList(@RequestBody ComAuthrtVO comAuthrtVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String,Object>();
/*		
		ObjectMapper objMapper = new ObjectMapper();
		
		logger.debug("authrtId: {}", authrtId);
		logger.debug("comAuthrtMenuList: {}", comAuthrtMenuList);
		
		ComAuthrtVO comAuthrtVO = new ComAuthrtVO();
		comAuthrtVO.setAuthrtId(paramMap.get("authrtId"));
		comAuthrtVO.setComAuthrtMenuList(comAuthrtMenuList);
*/
		//logger.debug("comAuthrtMenuList: {}", comAuthrtMenuList.size());
		
		try {
			
			logger.debug("$$$$$$$$$$$$$$$$$$$");
			
			// validation check

			//ComAuthrtVO comAuthrtVO = new ComAuthrtVO();
			//comAuthrtVO.setComAuthrtMenuList(comAuthrtMenuList);
			
			comAuthrtVO.setSysFrstInptUserId(getUserId());
			comAuthrtVO.setSysFrstInptPrgrmId(getPrgrmId());
			comAuthrtVO.setSysLastChgUserId(getUserId());
			comAuthrtVO.setSysLastChgPrgrmId(getPrgrmId());
			logger.debug("$$$$$	111	$$$$$$$$$$$$$$");
			HashMap<String, Object> rtnObj = comAuthrtService.insertComAuthrtMenuList(comAuthrtVO);
			if (rtnObj != null) {
				logger.debug("$$$$$	222	$$$$$$$$$$$$$$");
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		return getSuccessResponseEntity(resultMap);
	}
	
}
