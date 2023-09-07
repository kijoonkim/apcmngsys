package com.at.apcss.am.vrty.web;

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

import com.at.apcss.am.vrty.service.VrtyService;
import com.at.apcss.am.vrty.vo.VrtyVO;
import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.user.service.ComUserService;


@Controller
public class VrtyController extends BaseController{
		
	// APC 환경설정
	@Resource(name = "vrtyService")
	private VrtyService vrtyService;

	// 사용자
	@Resource(name = "comUserService")
	private ComUserService comUserService;

	// 공통코드
	@Resource(name = "comCdService")
	private ComCdService comCdSerivce;
	
	// 품종선택 팝업
	@PostMapping(value = "/am/apc/selectVrtyList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectVrtyList(@RequestBody VrtyVO vrtyVO, HttpServletRequest request) throws Exception {

		logger.debug("selectVrtyList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<VrtyVO> resultList = new ArrayList<>();
		try {
			resultList = vrtyService.selectVrtyList(vrtyVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}
