package com.at.apcss.am.apc.web;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.co.sys.controller.BaseController;

@RestController
public class ApcEvrmntStngAipController extends BaseController {

	@Resource(name = "apcEvrmntStngService")
	private ApcEvrmntStngService apcEvrmntStngService;

	@PostMapping(value = "/co/apc/selectApcInfo", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComCdDtlList(@RequestBody ApcEvrmntStngVO apcEvrmntStngVO, HttpServletRequest request) throws Exception {

		logger.debug("selectApcInfo 호출 <><><><> ");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		ApcEvrmntStngVO resultVO = new ApcEvrmntStngVO();
		try {
			resultVO = apcEvrmntStngService.selectApcInfo(apcEvrmntStngVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("resultVO", resultVO);

		return getSuccessResponseEntity(resultMap);
	}
}
