package com.at.apcss.co.authrt.web;

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
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.co.authrt.service.ComAuthrtService;
import com.at.apcss.co.authrt.vo.ComAuthrtMenuVO;
import com.at.apcss.co.authrt.vo.ComAuthrtUserVO;
import com.at.apcss.co.authrt.vo.ComAuthrtVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
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
		
		try {
			
			logger.debug("$$$$$$$$$$$$$$$$$$$");
			
			// validation check
			
			comAuthrtVO.setSysFrstInptUserId(getUserId());
			comAuthrtVO.setSysFrstInptPrgrmId(getPrgrmId());
			comAuthrtVO.setSysLastChgUserId(getUserId());
			comAuthrtVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = comAuthrtService.insertComAuthrtMenuList(comAuthrtVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 권한 TOP 메뉴목록 조회
	 * @param comAuthrtMenuVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/co/authrt/selectTopMenuTreeList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectTopMenuTreeList(@RequestBody ComAuthrtMenuVO comAuthrtMenuVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		List<ComAuthrtMenuVO> resultList;
		
		try {
			resultList = comAuthrtService.selectTopMenuTreeList(comAuthrtMenuVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	/**
	 * 권한 SIDE메뉴 목록 조회
	 * @param comAuthrtMenuVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/co/authrt/selectSideMenuTreeList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSideMenuTreeList(@RequestBody ComAuthrtMenuVO comAuthrtMenuVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		List<ComAuthrtMenuVO> resultList = new ArrayList<>();
		
		try {
			comAuthrtMenuVO.setUserId(getUserId());
			List<ComAuthrtMenuVO> authrtMenuList = comAuthrtService.selectSideMenuTreeList(comAuthrtMenuVO);
			
			for ( ComAuthrtMenuVO menu : authrtMenuList ) {
				if (ComConstants.CON_YES.equals(menu.getUseYn())) {
					resultList.add(menu);
				}
			}
			
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	/**
	 * 권한 사용자 목록 조회
	 * @param comAuthrtUserVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/co/authrt/selectComAuthrtUserList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComAuthrtUserList(@RequestBody ComAuthrtUserVO comAuthrtUserVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		List<ComAuthrtUserVO> resultList;
		
		try {
			resultList = comAuthrtService.selectComAuthrtUserList(comAuthrtUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	/**
	 * 권한 미등록 사용자 목록 조회
	 * @param comAuthrtUserVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/co/authrt/selectAuthrtTrgtUserList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectAuthrtTrgtUserList(@RequestBody ComAuthrtUserVO comAuthrtUserVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		List<ComAuthrtUserVO> resultList;
		
		try {
			resultList = comAuthrtService.selectAuthrtTrgtUserList(comAuthrtUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	/**
	 * 권한사용자 목록 등록
	 */
	@PostMapping(value = "/co/authrt/insertComAuthrtUserList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertComAuthrtUserList(@RequestBody ComAuthrtVO comAuthrtVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			// validation check
			
			comAuthrtVO.setSysFrstInptUserId(getUserId());
			comAuthrtVO.setSysFrstInptPrgrmId(getPrgrmId());
			comAuthrtVO.setSysLastChgUserId(getUserId());
			comAuthrtVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = comAuthrtService.insertComAuthrtUserList(comAuthrtVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		return getSuccessResponseEntity(resultMap);
	}
	
	/**
	 * 권한사용자 목록 삭제
	 */
	@PostMapping(value = "/co/authrt/deleteComAuthrtUserList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteComAuthrtUserList(@RequestBody ComAuthrtVO comAuthrtVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			// validation check
			
			comAuthrtVO.setSysFrstInptUserId(getUserId());
			comAuthrtVO.setSysFrstInptPrgrmId(getPrgrmId());
			comAuthrtVO.setSysLastChgUserId(getUserId());
			comAuthrtVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = comAuthrtService.deleteComAuthrtUserList(comAuthrtVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		return getSuccessResponseEntity(resultMap);
	}
	
	/**
	 * APC 메뉴간편설정 등록 시 APC의 권한 등록 (관리자, 사용자)
	 */
	@PostMapping(value = "/co/authrt/insertApcSimpleAuthrt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertApcSimpleAuthrt(@RequestBody ComAuthrtVO comAuthrtVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			// validation check
			
			comAuthrtVO.setSysFrstInptUserId(getUserId());
			comAuthrtVO.setSysFrstInptPrgrmId(getPrgrmId());
			comAuthrtVO.setSysLastChgUserId(getUserId());
			comAuthrtVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = comAuthrtService.insertApcSimpleAuthrt(comAuthrtVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		return getSuccessResponseEntity(resultMap);
	}
	
	
	
}
