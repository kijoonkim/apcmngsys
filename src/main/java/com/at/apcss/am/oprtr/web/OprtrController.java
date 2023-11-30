package com.at.apcss.am.oprtr.web;

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

import com.at.apcss.am.oprtr.service.OprtrService;
import com.at.apcss.am.oprtr.vo.OprtrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
/**
 * @Class Name : OprtrController.java
 * @Description : 생산작업자 관련 Controller 클래스
 * @author 김호
 * @since 2023.07.13
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.13  김호        최초 생성
 *      </pre>
 */
@Controller
public class OprtrController extends BaseController{

	@Resource(name= "oprtrService")
	private OprtrService oprtrService;


	// APC 환경설정 - 입고차량정보 목록 조회
	@PostMapping(value = "/am/oprtr/selectOprtrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectOprtrList(@RequestBody OprtrVO oprtrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<OprtrVO> resultList = new ArrayList<>();
		try {

			resultList = oprtrService.selectOprtrList(oprtrVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/compareOprtrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> compareSpmtTrsprtList(@RequestBody List<OprtrVO> oprtrList, HttpServletRequest request) throws Exception {
		logger.debug("compareOprtrList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		int insertCnt = 0;
		try {
			
			for (OprtrVO element : oprtrList) {
				element.setSysFrstInptPrgrmId(getPrgrmId());
				element.setSysFrstInptUserId(getUserId());
				element.setSysLastChgPrgrmId(getPrgrmId());
				element.setSysLastChgUserId(getUserId());
				oprtrService.multiOprtr(element);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertCnt);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/deleteOprtrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteOprtrList(@RequestBody OprtrVO oprtrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = oprtrService.deleteOprtr(oprtrVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}
}
