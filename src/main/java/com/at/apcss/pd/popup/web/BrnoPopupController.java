package com.at.apcss.pd.popup.web;

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
import com.at.apcss.pd.popup.service.BrnoPopupService;
import com.at.apcss.pd.popup.vo.BrnoPopupVO;


/**
 * @Class Name : BrnoPopupController.java
 * @Description : 경영체 검색 팝업에 대한 Controller 클래스
 * @author ljw
 * @since 2024.10.17
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.10.17  ljw        최초 생성
 * </pre>
 */
@Controller
public class BrnoPopupController extends BaseController {

	@Resource(name= "BrnoPopupService")
	private BrnoPopupService BrnoPopupService;


	//통합조직 리스트 검색
	@PostMapping(value = "/pd/popup/selectBrnoList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectBrnoList(@RequestBody BrnoPopupVO vo, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<BrnoPopupVO> resultList = new ArrayList<>();

		try {
			resultList = BrnoPopupService.selectBrnoList(vo);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	//통합조직 신청 리스트 검색
	@PostMapping(value = "/pd/popup/selectAplyBrnoList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectAplyBrnoList(@RequestBody BrnoPopupVO vo, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<BrnoPopupVO> resultList = new ArrayList<>();

		try {
			resultList = BrnoPopupService.selectAplyBrnoList(vo);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}