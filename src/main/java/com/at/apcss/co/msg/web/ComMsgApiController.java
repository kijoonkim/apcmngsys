package com.at.apcss.co.msg.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.msg.vo.ComMsgVO;
import com.at.apcss.co.sys.controller.BaseController;

@RestController
public class ComMsgApiController extends BaseController {

	@PostMapping(value = "/co/msg/comMsgs", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComMsgList(@RequestBody ComMsgVO comMsgVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComMsgVO> resultList = new ArrayList<>();
		logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 001");
		try {
			logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 002");
			resultList = getMessageList();
			logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 003");
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}
