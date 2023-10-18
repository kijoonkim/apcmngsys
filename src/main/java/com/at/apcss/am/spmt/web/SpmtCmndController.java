package com.at.apcss.am.spmt.web;

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

import com.at.apcss.am.ordr.vo.OrdrVO;
import com.at.apcss.am.spmt.service.SpmtCmndService;
import com.at.apcss.am.spmt.vo.SpmtCmndVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SpmtCmndController.java
 * @Description : 출고지시에 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Controller
public class SpmtCmndController extends BaseController {

	// 출하지시조회
	@Resource(name = "spmtCmndService")
	private SpmtCmndService spmtCmndService;

	// 출하대상내역 조회
	@PostMapping(value = "/am/spmt/selectSpmtCmndTrgList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtCmndTrgList(@RequestBody OrdrVO ordrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<OrdrVO> resultList = new ArrayList<>();
		try {
			resultList = spmtCmndService.selectSpmtCmndTrgList(ordrVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 출하지시 조회
	@PostMapping(value = "/am/spmt/selectSpmtCmndList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtCmndList(@RequestBody SpmtCmndVO SpmtCmndVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SpmtCmndVO> resultList = new ArrayList<>();
		try {
			resultList = spmtCmndService.selectSpmtCmndList(SpmtCmndVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 출하지시 등록 내역 조회
	@PostMapping(value = "/am/spmt/selectRegSpmtCmndList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRegSpmtCmndList(@RequestBody SpmtCmndVO SpmtCmndVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SpmtCmndVO> resultList = new ArrayList<>();
		try {
			resultList = spmtCmndService.selectRegSpmtCmndList(SpmtCmndVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 출고지시 등록
	@PostMapping(value = "/am/spmt/insertSpmtCmnd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSpmtCmnd(@RequestBody List<SpmtCmndVO> insertList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int insertedCnt = 0;
		try {

			for (SpmtCmndVO spmtCmndVO : insertList) {
				spmtCmndVO.setSysFrstInptUserId(getUserId());
				spmtCmndVO.setSysFrstInptPrgrmId(getPrgrmId());
				spmtCmndVO.setSysLastChgUserId(getUserId());
				spmtCmndVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			insertedCnt = spmtCmndService.insertSpmtCmndList(insertList);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 출고지시 삭제
	@PostMapping(value = "/am/spmt/deleteSpmtCmnd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteSpmtCmnd(@RequestBody SpmtCmndVO SpmtCmndVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = spmtCmndService.deleteSpmtCmnd(SpmtCmndVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}

	// 출고지시 삭제
	@PostMapping(value = "/am/spmt/deleteSpmtCmndList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteSpmtCmnd(@RequestBody List<SpmtCmndVO> deleteList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int deletedCnt = 0;
		try {
			for (SpmtCmndVO SpmtCmndVO : deleteList) {
				SpmtCmndVO.setSysLastChgPrgrmId(getPrgrmId());
				SpmtCmndVO.setSysLastChgUserId(getPrgrmId());
			}

				deletedCnt = spmtCmndService.deleteSpmtCmndList(deleteList);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}
