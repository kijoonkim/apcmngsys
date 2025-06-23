package com.at.apcss.am.ordr.web;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.at.apcss.am.ordr.service.OrdrRcvService;
import com.at.apcss.am.ordr.vo.OrdrRcvVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.menu.vo.ComUiJsonVO;
import com.at.apcss.co.sys.controller.BaseController;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @Class Name : OrdrController.java
 * @Description : 발주정보관리 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 *      </pre>
 */
@Controller
public class OrdrRcvController extends BaseController {

	// 발주정보수신
	@Resource(name = "ordrRcvService")
	private OrdrRcvService ordrRcvService;


	@PostMapping(value = "/am/ordr/insertOrdrRcvHomeplus", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertOrdr(@RequestBody OrdrRcvVO ordrRcvVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			ordrRcvVO.setSysFrstInptUserId(getUserId());
			ordrRcvVO.setSysFrstInptPrgrmId(getPrgrmId());

			ordrRcvVO.setSysLastChgUserId(getUserId());
			ordrRcvVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String,Object> rtnObj = ordrRcvService.insertHomplusOrdr(ordrRcvVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch(Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}
	
	
	@PostMapping(value = "/am/ordr/insertOutordrRcpt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertOutordrRcpt(@RequestBody OrdrRcvVO ordrRcvVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			
			ordrRcvVO.setSysFrstInptUserId(getUserId());
			ordrRcvVO.setSysFrstInptPrgrmId(getPrgrmId());
			ordrRcvVO.setSysLastChgUserId(getUserId());
			ordrRcvVO.setSysLastChgPrgrmId(getPrgrmId());
			logger.debug("@@@ordrRcvVO {}", ordrRcvVO.toString());
			//HashMap<String,Object> rtnObj = ordrRcvService.insertOutordrRcpt(ordrRcvVO);
			HashMap<String,Object> rtnObj = ordrRcvService.insertMrktOrdrRcpt(ordrRcvVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch(Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/ordr/insertOrdrRcvGSRetail", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertOrdrRcvGSRetail(@RequestBody OrdrRcvVO ordrRcvVO, HttpServletRequest request) throws Exception {
		logger.debug("@@@@@@@@@@@@@@@@@start");
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			ordrRcvVO.setSysFrstInptPrgrmId(getPrgrmId());
			ordrRcvVO.setSysFrstInptUserId(getUserId());
			ordrRcvVO.setSysLastChgPrgrmId(getPrgrmId());
			ordrRcvVO.setSysLastChgUserId(getPrgrmId());

			HashMap<String,Object> rtnObj = ordrRcvService.insertGSRetailOrdr(ordrRcvVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch(Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}
	
	
	@RequestMapping(value="/co/getGSRetailRSA", method = RequestMethod.GET)
	public String getGSRetailRSA(
			Model model, 
			@RequestParam String username, 
			@RequestParam String empid, 
			@RequestParam String password, 
			@RequestParam String rsaPublicKeyModulus, 
			@RequestParam String rsaPublicKeyExponent, 
			HttpServletRequest request) throws Exception {

		try {
			
			logger.debug("username {}", username);
			logger.debug("empid {}", empid);
			logger.debug("password {}", password);
			logger.debug("rsaPublicKeyModulus {}", rsaPublicKeyModulus);
			logger.debug("rsaPublicKeyExponent {}", rsaPublicKeyExponent);
			
			model.addAttribute("username", username);
			model.addAttribute("empid", empid);
			model.addAttribute("password", password);
			model.addAttribute("rsaPublicKeyModulus", rsaPublicKeyModulus);
			model.addAttribute("rsaPublicKeyExponent", rsaPublicKeyExponent);
		} catch( Exception e) {
			getErrorResponseEntity(e);
		}

		return "apcss/co/util/gsRetailRSA";
	}
	
	
}
