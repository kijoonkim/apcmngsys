package com.at.apcss.am.pckg.web;

import java.util.HashMap;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.pckg.service.PckgMngService;
import com.at.apcss.am.pckg.vo.PckgMngVO;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : PckgMngController.java
 * @Description : 포장관리에 대한 Controller 클래스
 * @author 신정철
 * @since 2023.08.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.22  신정철        최초 생성
 * </pre>
 */
@Controller
public class PckgMngController extends BaseController {

	@Resource(name = "pckgMngService")
	private PckgMngService pckgMngService;

	@PostMapping(value = "/am/pckg/insertPckgPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertPckgPrfmnc(@RequestBody PckgMngVO pckgMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			pckgMngVO.setSysFrstInptUserId(getUserId());
			pckgMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			pckgMngVO.setSysLastChgUserId(getUserId());
			pckgMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String,Object> rtnObj = pckgMngService.insertPckgPrfmnc(pckgMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch(Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}
	
	
	@PostMapping(value = "/am/pckg/deletePckgPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deletePckgPrfmnc(@RequestBody PckgMngVO pckgMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			pckgMngVO.setSysFrstInptUserId(getUserId());
			pckgMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			pckgMngVO.setSysLastChgUserId(getUserId());
			pckgMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String,Object> rtnObj = pckgMngService.deletePckgPrfmncList(pckgMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch(Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}

}
