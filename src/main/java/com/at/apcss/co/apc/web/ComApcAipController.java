package com.at.apcss.co.apc.web;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.co.apc.service.ComApcService;
import com.at.apcss.co.apc.vo.ComApcVO;
import com.at.apcss.co.sys.controller.BaseController;

@RestController
public class ComApcAipController extends BaseController {

	@Resource(name = "comApcService")
	private ComApcService comApcService;

	@PostMapping(value = "/co/apc/selectApcInfo", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComCdDtlList(@RequestBody ComApcVO comApcVO, HttpServletRequest request) throws Exception {

		logger.debug("selectApcInfo 호출 <><><><> ");

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		ComApcVO resultVO = new ComApcVO();
		try {
			resultVO = comApcService.selectApcInfo(comApcVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("resultVO", resultVO);

		return getSuccessResponseEntity(resultMap);
	}
}
