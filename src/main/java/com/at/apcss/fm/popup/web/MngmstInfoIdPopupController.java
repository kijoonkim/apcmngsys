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
import com.at.apcss.fm.popup.service.MngmstInfoIdPopupService;
import com.at.apcss.fm.popup.vo.MngmstInfoIdPopupVO;


/**
 * @Class Name : MngmstInfoIdPopupController.java
 * @Description : 경영체 검색 팝업에 대한 Controller 클래스
 * @author 임준완
 * @since 2023.09.22
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.11.16  임준완        최초 생성
 * </pre>
 */
@Controller
public class MngmstInfoIdPopupController extends BaseController {

	@Resource(name= "MngmstInfoIdPopupService")
	private MngmstInfoIdPopupService MngmstInfoIdPopupService;


	//경영체번호 리스트 검색
	@PostMapping(value = "/fm/popup/selectMngmstInfoIdList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcListPopup(@RequestBody MngmstInfoIdPopupVO vo, HttpServletRequest request) throws Exception {

		logger.debug("selectMngmstInfoId.do 호출 <><><><> ");
		//logger.debug(vo.toString());
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<MngmstInfoIdPopupVO> resultList = new ArrayList<>();

		try {

			resultList = MngmstInfoIdPopupService.selectMngmstInfoIdList(vo);
			System.out.println("========================================");
			logger.debug("========================================");
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}