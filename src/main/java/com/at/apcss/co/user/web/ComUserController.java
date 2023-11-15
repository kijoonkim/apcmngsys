package com.at.apcss.co.user.web;

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
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.user.service.ComUserService;
import com.at.apcss.co.user.vo.ComUserVO;

/**
 * 사용자 정보를 관리하는 컨트롤러 클래스
 * @author 신정철
 * @since 2023.07.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      수정자      수정내용
 *  -------            --------        ---------------------------
 *  2023.07.10  신정철     최초 생성
 *
 *  </pre>
 */
@Controller
public class ComUserController extends BaseController {

	@Resource(name = "comUserService")
	private ComUserService comUserService;

	@PostMapping(value = "/co/user/selectComUserList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComUserList(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComUserVO> resultList = new ArrayList<>();

		try {
			resultList = comUserService.selectComUserList(comUserVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/co/user/selectUserAprvList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUserAprvList(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComUserVO> resultList = new ArrayList<>();

		try {
			comUserVO.setUserStts(ComConstants.CON_USER_STTS_STANDBY);
			comUserVO.setUserType(ComConstants.CON_USER_TYPE_ADMIN);

			resultList = comUserService.selectComUserList(comUserVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/insertUserAprvList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertUserAprvList(@RequestBody List<ComUserVO> comUserList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for ( ComUserVO user : comUserList ) {
				user.setSysFrstInptUserId(getUserId());
				user.setSysFrstInptPrgrmId(getPrgrmId());
				user.setSysLastChgUserId(getUserId());
				user.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = comUserService.insertUserAprvList(comUserList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/co/user/updateUserSttsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateUserSttsList(@RequestBody List<ComUserVO> comUserList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for ( ComUserVO user : comUserList ) {
				user.setSysFrstInptUserId(getUserId());
				user.setSysFrstInptPrgrmId(getPrgrmId());
				user.setSysLastChgUserId(getUserId());
				user.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = comUserService.updateUserSttsList(comUserList);
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