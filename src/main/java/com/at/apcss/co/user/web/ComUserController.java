package com.at.apcss.co.user.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.util.ComUtil;
import com.at.apcss.co.user.service.ComUserService;
import com.at.apcss.co.user.vo.ComUserApcVO;
import com.at.apcss.co.user.vo.ComUserAtchflVO;
import com.at.apcss.co.user.vo.ComUserVO;

import egovframework.let.utl.sim.service.EgovFileScrty;

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
			//comUserVO.setUserStts(ComConstants.CON_USER_STTS_STANDBY);
			comUserVO.setUserType(ComConstants.CON_USER_TYPE_ADMIN);

			resultList = comUserService.selectComUserApcList(comUserVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/selectCorpUserAprvList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCorpUserAprvList(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComUserVO> resultList = new ArrayList<>();
		
		// 회원유형코드
		String mbrTypeCd = ComConstants.CON_MBR_TYPE_CD_CORP;	// 법인회원 조회
		
		comUserVO.setMbrTypeCd(mbrTypeCd);
		
		String untyAuthrtType = getUntyAuthrtType();
		String untyOgnzCd = getUntyOgnzCd();
		String authrtMngrYn = getAuthrtMngrYn();
		
		comUserVO.setSuperUserYn(null);
		if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
			comUserVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
			comUserVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_YES.equals(authrtMngrYn)) {
			comUserVO.setUntyOgnzCd(untyOgnzCd);
			comUserVO.setAuthrtMngrYn(authrtMngrYn);
		} else {
			return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "조회권한"));
		}
		
		try {
			resultList = comUserService.selectCorpUserAprvList(comUserVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	
	@PostMapping(value = "/co/user/selectLocgovUserAprvList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectLocgovUserAprvList(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComUserVO> resultList = new ArrayList<>();
		
		// 회원유형코드
		String mbrTypeCd = ComConstants.CON_MBR_TYPE_CD_LOCGOV;	// 법인회원 조회
		
		comUserVO.setMbrTypeCd(mbrTypeCd);
		
		String untyAuthrtType = getUntyAuthrtType();
		String untyOgnzCd = getUntyOgnzCd();
		String authrtMngrYn = getAuthrtMngrYn();
		
		
		comUserVO.setSuperUserYn(null);
		if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
			comUserVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
			comUserVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_YES.equals(authrtMngrYn)) {
			comUserVO.setUntyOgnzCd(untyOgnzCd);
			comUserVO.setAuthrtMngrYn(authrtMngrYn);
		} else {
			return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "조회권한"));
		}
		
		try {
			resultList = comUserService.selectLocgovUserAprvList(comUserVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	
	@PostMapping(value = "/co/user/selectUntyUserAprvList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUntyUserAprvList(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComUserVO> resultList = new ArrayList<>();
		
		String untyAuthrtType = getUntyAuthrtType();
		String untyOgnzType = getUntyOgnzType();
		String untyOgnzId = getUntyOgnzId();
		String untyAuthrtMngYn = getUntyAuthrtMngYn();
		
		comUserVO.setSuperUserYn(null);
		
		if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
			comUserVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
			comUserVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_ADMIN.equals(untyAuthrtType)) {
			comUserVO.setUntyOgnzId(untyOgnzId);
			comUserVO.setUntyOgnzType(untyOgnzType);
			comUserVO.setUntyAuthrtMngYn(untyAuthrtMngYn);
		} else {
			return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "조회권한"));
		}
		
		try {
			resultList = comUserService.selectUntyUserAprvList(comUserVO);
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
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/updateUserTypeList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateUserTypeList(@RequestBody List<ComUserVO> comUserList, HttpServletRequest request) throws Exception {
		//update 하는 리스트, 기능 구현하기

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {

			for ( ComUserVO user : comUserList ) {
				user.setSysFrstInptUserId(getUserId());
				user.setSysFrstInptPrgrmId(getPrgrmId());
				user.setSysLastChgUserId(getUserId());
				user.setSysLastChgPrgrmId(getPrgrmId());

				result += comUserService.updateUserType(user);
			}


		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap.put("result", result);

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
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/updateApcUserAprv.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateApcUserAprv(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			comUserVO.setSysFrstInptUserId(getUserId());
			comUserVO.setSysFrstInptPrgrmId(getPrgrmId());
			comUserVO.setSysLastChgUserId(getUserId());
			comUserVO.setSysLastChgPrgrmId(getPrgrmId());
			HashMap<String, Object> rtnObj = comUserService.updateApcUserAprv(comUserVO);
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

	@PostMapping(value = "/co/user/insertAccount.do")
	public ResponseEntity<HashMap<String, Object>> insertAccount(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception{


		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		String password = comUserVO.getPswd();
		String userId = comUserVO.getUserId();
		//String prgrmId = "newAccount";
		comUserVO.setPswd(EgovFileScrty.encryptPassword(password,userId));
		comUserVO.setSysFrstInptUserId(getUserId());
		comUserVO.setSysFrstInptPrgrmId(getPrgrmId());
		comUserVO.setSysLastChgUserId(getUserId());
		comUserVO.setSysLastChgPrgrmId(getPrgrmId());

		try {
			comUserService.insertAccount(comUserVO);
			comUserService.insertLgnPlcy(comUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}


		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/selectAccountDupChk.do")
	public ResponseEntity<HashMap<String, Object>> selectAccountDupChk(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception{


		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		ComUserVO returnUserVO = new ComUserVO();

		try {
			returnUserVO = comUserService.selectAccountDupChk(comUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("userId", returnUserVO.getUserId());
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/selectComUserPrdcrAprvList.do")
	public ResponseEntity<HashMap<String, Object>> selectComUserPrdcrAprvList(@RequestBody HashMap<String,Object> comUserVO, HttpServletRequest request) throws Exception{

        HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String, Object>> resultVO;
		List<HashMap<String, Object>> resultVO2;

		try {
			resultVO = comUserService.selectComUserPrdcrAprvList(comUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		try {
			resultVO2 = comUserService.selectComUserPrdcrList(comUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultVO.addAll(resultVO2);
        resultMap.put(ComConstants.PROP_RESULT_LIST, resultVO);


		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/selectComUserPrdcrRegList.do")
	public ResponseEntity<HashMap<String, Object>> selectComUserPrdcrRegList(@RequestBody HashMap<String,Object> comUserVO, HttpServletRequest request) throws Exception{

        HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String, Object>> resultVO;

		try {
			resultVO = comUserService.selectComUserPrdcrRegList(comUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

        resultMap.put(ComConstants.PROP_RESULT_LIST, resultVO);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/saveComUserAprv.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateUserTypeList(@RequestBody HashMap<String,Object> comUser, HttpServletRequest request) throws Exception {
		//update 하는 리스트, 기능 구현하기

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
				comUser.put("sysFrstInptUserId",getUserId());
				comUser.put("sysFrstInptPrgrmId",getPrgrmId());
				comUser.put("sysLastChgUserId",getUserId());
				comUser.put("sysLastChgPrgrmId",getPrgrmId());
				HashMap<String, Object> check = comUserService.selectUserAprv(comUser);
				String status = comUser.get("rowStatus").toString();
				if(check == null &&  status.equals("1")) {
					comUser.put("chk","I");
					result += comUserService.savePrdcrUserId(comUser);
				}else {
					result += comUserService.updateUserAprv(comUser);
				}




		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/co/user/delComUserAprv.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> delComUserAprv(@RequestBody HashMap<String,Object> comUser, HttpServletRequest request) throws Exception {
		//update 하는 리스트, 기능 구현하기

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {							
				result += comUserService.delComUserAprv(comUser);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/savePrdcrUserId.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> savePrdcrUserId(@RequestBody List<HashMap<String,Object>> comUser, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;

		try {
			for(HashMap<String,Object> user : comUser) {
				user.put("sysFrstInptUserId", getUserId());
				user.put("sysFrstInptPrgrmId", getPrgrmId());
				user.put("sysLastChgUserId", getUserId());
				user.put("sysLastChgPrgrmId", getPrgrmId());
				result += comUserService.savePrdcrUserId(user);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/deletePrdcrUserId.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deletePrdcrUserId(@RequestBody List<HashMap<String,Object>> comUser, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;

		try {
			for(HashMap<String,Object> user : comUser) {

				result += comUserService.deletePrdcrUserId(user);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/selectComUserAprvList.do")
	public ResponseEntity<HashMap<String, Object>> selectComUserAprvList(@RequestBody HashMap<String,Object> comUserVO, HttpServletRequest request) throws Exception{

        HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String, Object>> resultVO;

		try {
			resultVO = comUserService.selectComUserAprvList(comUserVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

        resultMap.put(ComConstants.PROP_RESULT_LIST, resultVO);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/insertCorpAprvList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCorpAprvList(@RequestBody List<ComUserVO> comUserList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for ( ComUserVO user : comUserList ) {
				user.setSysFrstInptUserId(getUserId());
				user.setSysFrstInptPrgrmId(getPrgrmId());
				user.setSysLastChgUserId(getUserId());
				user.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = comUserService.insertCorpAprvList(comUserList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
	
	
	@PostMapping(value = "/co/user/deleteCorpAprvList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteCorpAprvList(@RequestBody List<ComUserVO> comUserList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for ( ComUserVO user : comUserList ) {
				user.setSysFrstInptUserId(getUserId());
				user.setSysFrstInptPrgrmId(getPrgrmId());
				user.setSysLastChgUserId(getUserId());
				user.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = comUserService.deleteCorpAprvList(comUserList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/co/user/insertLocgovAprvList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertLocgovAprvList(@RequestBody List<ComUserVO> comUserList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for ( ComUserVO user : comUserList ) {
				user.setSysFrstInptUserId(getUserId());
				user.setSysFrstInptPrgrmId(getPrgrmId());
				user.setSysLastChgUserId(getUserId());
				user.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = comUserService.insertLocgovAprvList(comUserList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
	

	@PostMapping(value = "/co/user/deleteLocgovAprvList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteLocgovAprvList(@RequestBody List<ComUserVO> comUserList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for ( ComUserVO user : comUserList ) {
				user.setSysFrstInptUserId(getUserId());
				user.setSysFrstInptPrgrmId(getPrgrmId());
				user.setSysLastChgUserId(getUserId());
				user.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = comUserService.deleteLocgovAprvList(comUserList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/co/user/insertUntyAprvList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertUntyAprvList(@RequestBody List<ComUserVO> comUserList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for ( ComUserVO user : comUserList ) {
				user.setSysFrstInptUserId(getUserId());
				user.setSysFrstInptPrgrmId(getPrgrmId());
				user.setSysLastChgUserId(getUserId());
				user.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = comUserService.insertUntyAprvList(comUserList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}


	
	@PostMapping(value = "/co/user/selectComUserApcList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComUserApcList(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComUserVO> resultList = new ArrayList<>();
		
		String untyAuthrtType = getUntyAuthrtType();
		String untyOgnzId = getUntyOgnzId();
		comUserVO.setSuperUserYn(null);
		comUserVO.setUserId(null);
		comUserVO.setUserId(getUserId());
		
		if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
			comUserVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
			comUserVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_ADMIN.equals(untyAuthrtType)) {
			comUserVO.setUntyOgnzId(untyOgnzId);
		} else {
			
		}
		
		try {
			resultList = comUserService.selectComUserApcList(comUserVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	
	@PostMapping(value = "/co/user/selectUserApcList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUserApcList(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComUserVO> resultList = new ArrayList<>();
		
		String untyAuthrtType = getUntyAuthrtType();
		String untyOgnzCd = getUntyOgnzCd();
		
		comUserVO.setSuperUserYn(null);
		comUserVO.setUntyOgnzId(null);
		comUserVO.setAplyUserId(null);
		
		if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
			comUserVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
			comUserVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_ADMIN.equals(untyAuthrtType)) {
			comUserVO.setUntyOgnzId(untyOgnzCd);
		} else {
			comUserVO.setAplyUserId(getUserId());
		}
		
		try {
			resultList = comUserService.selectUserApcList(comUserVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/co/user/insertUserApcAply.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertUserApcAply(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			
			List<ComUserApcVO> userApcList = comUserVO.getUserApcList();
			
			if (userApcList == null || userApcList.isEmpty()) {
				return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "등록대상"));
			}
			
			String untyAuthrtType = getUntyAuthrtType();
			String untyOgnzId = getUntyOgnzId();

			String userId = ComUtil.nullToEmpty(getUserId());
			
			comUserVO.setUserId(getUserId());
			
			if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
				comUserVO.setSuperUserYn(ComConstants.CON_YES);
			} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
				comUserVO.setSuperUserYn(ComConstants.CON_YES);
			} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_ADMIN.equals(untyAuthrtType)) {
				comUserVO.setUntyOgnzId(untyOgnzId);
			} else {
				comUserVO.setUntyOgnzId(untyOgnzId);
				for ( ComUserApcVO userApc : userApcList ) {
					if (!userId.equals(userApc.getUserId())) {
						return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "신청권한"));
					}
				}
			}
			
			comUserVO.setSysFrstInptUserId(getUserId());
			comUserVO.setSysFrstInptPrgrmId(getPrgrmId());
			comUserVO.setSysLastChgUserId(getUserId());
			comUserVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = comUserService.insertUserApcAply(comUserVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/deleteUserApcAply.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteUserApcAply(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			
			List<ComUserApcVO> userApcList = comUserVO.getUserApcList();
			
			if (userApcList == null || userApcList.isEmpty()) {
				return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "등록대상"));
			}
			
			String untyAuthrtType = getUntyAuthrtType();
			String untyOgnzId = getUntyOgnzId();

			String userId = ComUtil.nullToEmpty(getUserId());
			
			comUserVO.setUserId(getUserId());
			
			if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
				comUserVO.setSuperUserYn(ComConstants.CON_YES);
			} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
				comUserVO.setSuperUserYn(ComConstants.CON_YES);
			} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_ADMIN.equals(untyAuthrtType)) {
				comUserVO.setUntyOgnzId(untyOgnzId);
			} else {
				comUserVO.setUntyOgnzId(untyOgnzId);
				for ( ComUserApcVO userApc : userApcList ) {
					if (!userId.equals(userApc.getUserId())) {
						return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "신청권한"));
					}
				}
			}
			
			comUserVO.setSysFrstInptUserId(getUserId());
			comUserVO.setSysFrstInptPrgrmId(getPrgrmId());
			comUserVO.setSysLastChgUserId(getUserId());
			comUserVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = comUserService.deleteUserApcAply(comUserVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
	
	
	@PostMapping(value = "/co/user/selectUserApcAprvList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectUserApcAprvList(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComUserVO> resultList = new ArrayList<>();
		
		String untyAuthrtType = getUntyAuthrtType();
		String untyOgnzCd = getUntyOgnzCd();
		
		comUserVO.setSuperUserYn(null);
		comUserVO.setUntyOgnzId(null);
		comUserVO.setAplyUserId(null);
		
		if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
			comUserVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
			comUserVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_ADMIN.equals(untyAuthrtType)) {
			comUserVO.setUntyOgnzId(untyOgnzCd);
		} else {
			return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "조회권한"));
		}
		
		try {
			resultList = comUserService.selectUserApcList(comUserVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/co/user/selectApcUserPopList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectApcUserPopList(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComUserVO> resultList = new ArrayList<>();
		
		String untyAuthrtType = getUntyAuthrtType();
		String untyOgnzCd = getUntyOgnzCd();
		String authrtMngrYn = getAuthrtMngrYn();
		
		comUserVO.setSuperUserYn(null);
		comUserVO.setUntyOgnzId(null);
		comUserVO.setAuthrtMngrYn(null);

		if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
			comUserVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
			comUserVO.setSuperUserYn(ComConstants.CON_YES);
		} else if (ComConstants.CON_YES.equals(authrtMngrYn)) {
			comUserVO.setUntyOgnzCd(untyOgnzCd);
			comUserVO.setAuthrtMngrYn(authrtMngrYn);
		} else {
			return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "조회권한"));
		}
		
		try {
			resultList = comUserService.selectApcUserPopList(comUserVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}	
		
	
	@PostMapping(value = "/co/user/insertUserApcAprv.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertUserApcAprv(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			
			List<ComUserApcVO> userApcList = comUserVO.getUserApcList();
			
			if (userApcList == null || userApcList.isEmpty()) {
				return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "승인대상"));
			}
			
			String untyAuthrtType = getUntyAuthrtType();
			String untyOgnzId = getUntyOgnzId();
			
			if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
				comUserVO.setSuperUserYn(ComConstants.CON_YES);
			} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
				comUserVO.setSuperUserYn(ComConstants.CON_YES);
			} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_ADMIN.equals(untyAuthrtType)) {
				comUserVO.setUntyOgnzId(untyOgnzId);
			} else {
				return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "권한"));
			}
			
			comUserVO.setSysFrstInptUserId(getUserId());
			comUserVO.setSysFrstInptPrgrmId(getPrgrmId());
			comUserVO.setSysLastChgUserId(getUserId());
			comUserVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = comUserService.insertUserApcAprv(comUserVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
	

	

	@PostMapping(value = "/co/user/deleteUserApcAprv.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteUserApcAprv(@RequestBody ComUserVO comUserVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			
			List<ComUserApcVO> userApcList = comUserVO.getUserApcList();
			
			if (userApcList == null || userApcList.isEmpty()) {
				return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "취소대상"));
			}
			
			String untyAuthrtType = getUntyAuthrtType();
			String untyOgnzId = getUntyOgnzId();
			
			if (ComConstants.CON_UNTY_AUTHRT_TYPE_SYS.equals(untyAuthrtType)) {
				comUserVO.setSuperUserYn(ComConstants.CON_YES);
			} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_AT.equals(untyAuthrtType)) {
				comUserVO.setSuperUserYn(ComConstants.CON_YES);
			} else if (ComConstants.CON_UNTY_AUTHRT_TYPE_ADMIN.equals(untyAuthrtType)) {
				comUserVO.setUntyOgnzId(untyOgnzId);
			} else {
				return getErrorResponseEntity(ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "권한"));
			}
			
			comUserVO.setSysFrstInptUserId(getUserId());
			comUserVO.setSysFrstInptPrgrmId(getPrgrmId());
			comUserVO.setSysLastChgUserId(getUserId());
			comUserVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = comUserService.deleteUserApcAprv(comUserVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}
	
	
	@PostMapping(value = "/co/user/downloadUserFile.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public void downloadUserFile(@RequestBody ComUserVO comUserVO, HttpServletRequest request, HttpServletResponse response) throws Exception {

		//HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			
			ComUserAtchflVO returnVO = comUserService.getUserAtchfl(comUserVO);

			if (returnVO == null) {
				return;
			}
			
			String fileNm = returnVO.getFileNm();
			
			if (StringUtils.hasText(returnVO.getFilePathNm())) {
				
				String rootPath = getFilepathFm();
				String filePathNm = returnVO.getFilePathNm();
				String srvrFileNm = returnVO.getSrvrFileNm();
				String fileExtnNm = ComUtil.nullToDefault(returnVO.getFileExtnNm(), ComConstants.CON_BLANK);
				String downloadPath = rootPath + File.separator + filePathNm + File.separator;
				
				String orgnFileNm = srvrFileNm + ComConstants.CON_UNDERLINE + fileExtnNm;
				
				File f = new File(downloadPath, orgnFileNm);
				
				if (f == null || f.length() <= 0) {
					return;
				}
				
				response.setContentType("application/octet-stream"); 

		        //데이터형식/성향설정 (attachment: 첨부파일)
		        response.setHeader("Content-disposition", "attachment; fileName=\"" + URLEncoder.encode(fileNm, "UTF-8") + "\";");
		        //response.setHeader("Content-Type", "application/pdf"); // 파일 형식 지정
		        //파일길이설정
		        response.setContentLength((int)f.length());
		        
		        BufferedInputStream bIn = null;
		        BufferedOutputStream bOut = null;
		        
		        // 파일 입력 객체 생성
		        FileInputStream fIn = new FileInputStream(f);
		        bIn = new BufferedInputStream(fIn);
		        // response 객체를 통해서 서버로부터 파일 다운로드
		        OutputStream os = response.getOutputStream();
		        bOut = new BufferedOutputStream(os);
		        
		        try {
		        	
		        	byte[] buffer = new byte[4096];
		        	int bytesRead = 0;
		        	
		        	while ((bytesRead = bIn.read(buffer)) != -1) {
		        		bOut.write(buffer, 0, bytesRead);
                    } 
		        	
		        	
		        	bOut.flush();
		        } finally {
		        	bIn.close();
		        	bOut.close();
		        }
		        /*
		        FileCopyUtils.copy(fis, os);
		        fis.close();
		        os.close();
		        
		        
		        //내용물 인코딩방식설정
		        //response.setHeader("Content-Transfer-Encoding", "binary");
		        //버퍼의 출력스트림을 출력
		        response.getOutputStream().write(fileByte);
		        
		        //버퍼에 남아있는 출력스트림을 출력
		        response.getOutputStream().flush();
		        //출력스트림을 닫는다
		        response.getOutputStream().close();
				*/
			} else {
				if (returnVO.getFileCn() == null) {
					return;
				}
				
				byte[] fileByte = returnVO.getFileCn();
				response.setContentType("application/octet-stream"); 

		        //데이터형식/성향설정 (attachment: 첨부파일)
		        response.setHeader("Content-disposition", "attachment; fileName=\"" + URLEncoder.encode(fileNm, "UTF-8") + "\";");
		        //response.setHeader("Content-Type", "application/pdf"); // 파일 형식 지정
		        //파일길이설정
		        response.setContentLength(fileByte.length);
		        
		        BufferedOutputStream bOut = null;
		        
		        try {
		        	// response 객체를 통해서 서버로부터 파일 다운로드
			        OutputStream os = response.getOutputStream();
			        bOut = new BufferedOutputStream(os);
			        
			        bOut.write(fileByte);
			        
			        bOut.flush();
		        } finally {
		        	bOut.close();
		        }
		        
			}
			
			/*
			HashMap<String, Object> rtnObj = comUserService.deleteUserApcAprv(comUserVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
			*/
			//resp.setHeader("Content-Type", "application/" + extension); // 파일 형식 지정

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			//return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				//return getErrorResponseEntity(rtnObj);
			}
		}

		//return getSuccessResponseEntity(resultMap);
	}
		
	
}