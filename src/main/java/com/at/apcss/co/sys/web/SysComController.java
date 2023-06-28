package com.at.apcss.co.sys.web;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.vo.ComVO;

/**
 * System 공통사항을 처리하는 컨트롤러 클래스
 * @author SI개발부 신정철
 * @since 2023.06.15
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      	수정자      	수정내용
 *  ----------	----------	---------------------------
 *  2023.06.15  신정철     	최초 생성
 *
 *  </pre>
 */
@Controller
public class SysComController extends BaseController {
	
	@PostMapping(value = "/sys/actionNewTab.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> actionNewTab(@RequestBody ComVO comVO, HttpServletRequest request) throws Exception {		

		String sysPrgrmId = comVO.getSysPrgrmId();
		logger.debug("############ sysPrgrmId: {}", sysPrgrmId);
		
		logger.debug("pre id : {}", (String) request.getSession().getAttribute(ComConstants.PROP_SYS_PRGRM_ID));
		request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, sysPrgrmId);
		
		logger.debug("@@@@@@@@@@@@ getUserId: {}", getUserId());
		logger.debug("@@@@@@@@@@@@ getPrgrmId: {}", getPrgrmId());	
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/sys/actionOldTab.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> actionOldTab(@RequestBody ComVO comVO, HttpServletRequest request) throws Exception {		

		String sysPrgrmId = comVO.getSysPrgrmId();
		logger.debug("############ sysPrgrmId: {}", sysPrgrmId);
		
		logger.debug("pre id : {}", (String) request.getSession().getAttribute(ComConstants.PROP_SYS_PRGRM_ID));
		request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, sysPrgrmId);
		
		logger.debug("@@@@@@@@@@@@ getUserId: {}", getUserId());
		logger.debug("@@@@@@@@@@@@ getPrgrmId: {}", getPrgrmId());		
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		return getSuccessResponseEntity(resultMap);
	}
}
