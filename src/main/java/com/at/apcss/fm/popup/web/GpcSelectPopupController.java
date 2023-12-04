package com.at.apcss.fm.popup.web;

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

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.popup.service.GpcSelectPopupService;
import com.at.apcss.fm.popup.vo.GpcSelectPopupVO;


/**
 * @Class Name : ApcSelectPopupController.java
 * @Description : apc선택 팝업에 대한 Controller 클래스
 * @author ljw
 * @since 2023.10.03
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.03  ljw        최초 생성
 * </pre>
 */
@Controller
public class GpcSelectPopupController extends BaseController {

	@Resource(name= "GpcSelectPopupService")
	private GpcSelectPopupService gpcSelectPopupService;


	//APC 리스트 검색
	@PostMapping(value = "/fm/popup/selectGpcListPopup.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcListPopup(@RequestBody GpcSelectPopupVO vo, HttpServletRequest request) throws Exception {

		logger.debug("selectApcListPopup.do 호출 <><><><> ");
		logger.debug(vo.toString());
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<GpcSelectPopupVO> resultList = new ArrayList<>();

		try {

			resultList = gpcSelectPopupService.selectGpcList(vo);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}