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
import com.at.apcss.fm.popup.service.ApcSelectPopupService;
import com.at.apcss.fm.popup.service.InvstmntSpmtPopupService;
import com.at.apcss.fm.popup.vo.ApcSelectPopupVO;


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
public class ApcSelectPopupController extends BaseController {

	@Resource(name= "ApcSelectPopupService")
	private ApcSelectPopupService apcSelectPopupService;


	//통합조직,출자출하조직 리스트 검색
	@PostMapping(value = "/fm/popup/selectApcListPopup.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcListPopup(@RequestBody ApcSelectPopupVO vo, HttpServletRequest request) throws Exception {

		logger.debug("selectApcListPopup.do 호출 <><><><> ");
		logger.debug(vo.toString());
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ApcSelectPopupVO> resultList = new ArrayList<>();

		try {

			resultList = apcSelectPopupService.selectApcList(vo);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}