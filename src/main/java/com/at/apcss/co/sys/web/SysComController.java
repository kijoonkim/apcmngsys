package com.at.apcss.co.sys.web;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.log.service.ComLogService;
import com.at.apcss.co.log.vo.ComLogVO;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.vo.ComVO;
import com.at.apcss.co.sys.vo.LoginVO;

/**
 * System 공통사항을 처리하는 컨트롤러 클래스
 *
 * @author SI개발부 신정철
 * @since 2023.06.15
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일      	수정자      	수정내용
 *  ----------	----------	---------------------------
 *  2023.06.15  신정철     	최초 생성
 *
 *      </pre>
 */
@Controller
public class SysComController extends BaseController {

	@Autowired
	ComLogService comLogService;

	@PostMapping(value = "/sys/actionNewTab.do", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> actionNewTab(@RequestBody ComLogVO comLogVO,
			HttpServletRequest request) throws Exception {

		String sysPrgrmId = comLogVO.getPrgrmId();

		logger.debug("############ sysPrgrmId: {}", sysPrgrmId);

		logger.debug("pre id : {}", (String) request.getSession().getAttribute(ComConstants.PROP_SYS_PRGRM_ID));
		request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, sysPrgrmId);

		logger.debug("@@@@@@@@@@@@ getUserId: {}", getUserId());
		logger.debug("@@@@@@@@@@@@ getPrgrmId: {}", getPrgrmId());

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/sys/actionOldTab.do", consumes = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> actionOldTab(@RequestBody ComVO comVO, HttpServletRequest request)
			throws Exception {

		String sysPrgrmId = comVO.getSysPrgrmId();
		logger.debug("############ sysPrgrmId: {}", sysPrgrmId);

		logger.debug("pre id : {}", (String) request.getSession().getAttribute(ComConstants.PROP_SYS_PRGRM_ID));
		request.getSession().setAttribute(ComConstants.PROP_SYS_PRGRM_ID, sysPrgrmId);

		logger.debug("@@@@@@@@@@@@ getUserId: {}", getUserId());
		logger.debug("@@@@@@@@@@@@ getPrgrmId: {}", getPrgrmId());

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/sys/insertComLog.do", consumes = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertComLog(@RequestBody ComLogVO comLogVo,
			HttpServletRequest request) throws Exception {
			String userId = getUserId();
			String userType = getUserType();
			String menuId = comLogVo.getMenuId();
			comLogVo.setUserId(userId);
			comLogVo.setUserType(userType);
			comLogVo.setUserIp(getUserIp(request));

			if (getUserId() != null) {
				comLogVo.setLgnScsYn("Y");
			}

			comLogVo.setSysFrstInptUserId(userId);
			comLogVo.setSysLastChgUserId(userId);
			comLogVo.setSysFrstInptPrgrmId(menuId);
			comLogVo.setSysLastChgPrgrmId(menuId);
			if (ComConstants.CON_YES.equals(comLogVo.getFlfmtTaskSeCd())) {
				comLogVo.setFlfmtTaskSeCd("01");
			}else {
				comLogVo.setFlfmtTaskSeCd("");
			}

		comLogService.insertMenuHstry(comLogVo);
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		return getSuccessResponseEntity(resultMap);
	}

}
