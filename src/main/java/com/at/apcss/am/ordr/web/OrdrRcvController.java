package com.at.apcss.am.ordr.web;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.ordr.service.OrdrRcvService;
import com.at.apcss.am.ordr.vo.OrdrRcvVO;
import com.at.apcss.co.sys.controller.BaseController;

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
			ordrRcvVO.setSysFrstInptPrgrmId(getPrgrmId());
			ordrRcvVO.setSysFrstInptUserId(getUserId());
			ordrRcvVO.setSysLastChgPrgrmId(getPrgrmId());
			ordrRcvVO.setSysLastChgUserId(getPrgrmId());

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
			ordrRcvVO.setSysFrstInptPrgrmId(getPrgrmId());
			ordrRcvVO.setSysFrstInptUserId(getUserId());
			ordrRcvVO.setSysLastChgPrgrmId(getPrgrmId());
			ordrRcvVO.setSysLastChgUserId(getPrgrmId());

			HashMap<String,Object> rtnObj = ordrRcvService.insertOutordrRcpt(ordrRcvVO);
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
