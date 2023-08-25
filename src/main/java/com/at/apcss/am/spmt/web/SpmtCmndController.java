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
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
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
	@Resource(name = "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	// 출하지시조회
	@Resource(name = "spmtCmndService")
	private SpmtCmndService spmtCmndService;
	
	// 출하지시등록
	@RequestMapping(value = "/am/spmt/regSpmtCmnd.do")
	public String doRegFormSpmtCmnd() {
		return "apcss/am/spmt/regSpmtCmnd";
	}

	// 출하지시조회
	@RequestMapping(value = "/am/spmt/spmtCmnd.do")
	public String doSpmtCmnd() {
		return "apcss/am/spmt/spmtCmnd";
	}

	// 출하대상내역 조회
	@PostMapping(value = "/am/spmt/selectSpmtCmndTrgList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtCmndList(@RequestBody OrdrVO ordrVO, HttpServletRequest request) throws Exception {
		logger.debug("selectSpmtCmndTrgList 호출 <><><><> ");

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
		logger.debug("selectSpmtCmndList 호출 <><><><> ");

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
	
	@PostMapping(value = "/am/spmt/selectSpmtCmndList2.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtCmndList2(@RequestBody SpmtCmndVO SpmtCmndVO, HttpServletRequest request) throws Exception {
		logger.debug("selectSpmtCmndList2 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SpmtCmndVO> resultList = new ArrayList<>();
		try {
			resultList = spmtCmndService.selectSpmtCmndList2(SpmtCmndVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/spmt/insertSpmtCmnd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSpmtCmnd(@RequestBody List<SpmtCmndVO> insertList, HttpServletRequest request) throws Exception {
		logger.debug("insertSpmtCmnd 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int insertedCnt = 0;
		try {
			int sn = 1;
			for (SpmtCmndVO SpmtCmndVO : insertList) {
				String spmtCmndno = cmnsTaskNoService.selectSpmtCmndno(SpmtCmndVO.getApcCd(), SpmtCmndVO.getCmndYmd());
				SpmtCmndVO.setSysLastChgPrgrmId(getUserId());
				SpmtCmndVO.setSysLastChgUserId(getPrgrmId());
				SpmtCmndVO.setSysFrstInptPrgrmId(getUserId());
				SpmtCmndVO.setSysFrstInptUserId(getPrgrmId());
				SpmtCmndVO.setSpmtCmndno(spmtCmndno);
				SpmtCmndVO.setSpmtCmndSn(sn);
				sn++;
				insertedCnt += spmtCmndService.insertSpmtCmnd(SpmtCmndVO);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/am/spmt/deleteSpmtCmnd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteSpmtCmnd(@RequestBody SpmtCmndVO SpmtCmndVO, HttpServletRequest request) throws Exception {
		logger.debug("deleteSpmtCmnd 호출 <><><><> ");

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

	@PostMapping(value = "/am/spmt/deleteSpmtCmndList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteSpmtCmnd(@RequestBody List<SpmtCmndVO> deleteList, HttpServletRequest request) throws Exception {
		logger.debug("deleteSpmtCmndList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int deletedCnt = 0;
		try {
			for (SpmtCmndVO SpmtCmndVO : deleteList)
				deletedCnt += spmtCmndService.deleteSpmtCmnd2(SpmtCmndVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}
