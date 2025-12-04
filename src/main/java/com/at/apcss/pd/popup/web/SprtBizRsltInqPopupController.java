package com.at.apcss.pd.popup.web;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.popup.service.SprtBizRsltInqPopupService;
import com.at.apcss.pd.popup.vo.SprtBizRsltInqPopupVO;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class SprtBizRsltInqPopupController extends BaseController {

	@Resource(name= "sprtBizRsltInqPopupService")
	private SprtBizRsltInqPopupService sprtBizRsltInqPopupService;


	//경영체번호 리스트 검색
	@PostMapping(value = "/pd/popup/selectSprtBizRsltInqPopupList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcListPopup(@RequestBody SprtBizRsltInqPopupVO sprtBizRsltInqPopupVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SprtBizRsltInqPopupVO> resultList = new ArrayList<>();
		try {
			resultList = sprtBizRsltInqPopupService.selectSprtBizRsltInqPopupList(sprtBizRsltInqPopupVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}
}