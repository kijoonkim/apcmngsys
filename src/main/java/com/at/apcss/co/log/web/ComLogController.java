package com.at.apcss.co.log.web;

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
import com.at.apcss.co.log.service.ComLogService;
import com.at.apcss.co.log.vo.ComLogVO;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.constants.ComConstants;

/**
 * @Class Name : ComLogController.java
 * @Description : 이력조회에 대한 Controller 클래스
 * @author 하민우
 * @since 2023.08.29
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.29  하민우        최초 생성
 *      </pre>
 */
@Controller
public class ComLogController extends BaseController {

	// 이력조회
	@Resource(name = "comLogService")
	private ComLogService comLogService;


	// 접속이력 조회
	@PostMapping(value = "/co/log/selectCntnHstryList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCntnHstryList(@RequestBody ComLogVO comLogVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ComLogVO> resultList = new ArrayList<>();
		try {
			resultList = comLogService.selectCntnHstryList(comLogVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 화면열람이력 조회
	@PostMapping(value = "/co/log/selectMenuHstryList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectMenuHstryList(@RequestBody ComLogVO comLogVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ComLogVO> resultList = new ArrayList<>();
		try {
			resultList = comLogService.selectMenuHstryList(comLogVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 송수신이력 조회
	@PostMapping(value = "/co/log/selectTrsmHstryList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectTrsmHstryList(@RequestBody ComLogVO comLogVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ComLogVO> resultList = new ArrayList<>();
		try {
			resultList = comLogService.selectTrsmHstryList(comLogVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 배치실행이력 조회
	@PostMapping(value = "/co/log/selectBatchHstryList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectBatchHstryList(@RequestBody ComLogVO comLogVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ComLogVO> resultList = new ArrayList<>();
		try {
			resultList = comLogService.selectBatchHstryList(comLogVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}
