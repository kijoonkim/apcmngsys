package com.at.apcss.am.ordr.web;

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

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.ordr.service.OrdrService;
import com.at.apcss.am.ordr.vo.OrdrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : OrdrController.java
 * @Description : 발주정보관리 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 *      </pre>
 */
@Controller
public class OrdrController extends BaseController {

	// 발주정보조회
	@Resource(name = "ordrService")
	private OrdrService ordrService;

	@Resource(name = "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	// 발주정보 조회
	@PostMapping(value = "/am/ordr/selectOrdrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectOrdrList(@RequestBody OrdrVO OrdrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<OrdrVO> resultList = new ArrayList<>();
		try {
			resultList = ordrService.selectOrdrList(OrdrVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 발주정보 수기등록 목록 조회
	@PostMapping(value = "/am/ordr/selectOrdrHandwritingList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectOrdrHandwritingList(@RequestBody OrdrVO OrdrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<OrdrVO> resultList = new ArrayList<>();
		try {
			resultList = ordrService.selectOrdrHandwritingList(OrdrVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}


	// 발주정보 수정
	@PostMapping(value = "/am/ordr/multiOrdrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiOrdrList(@RequestBody List<OrdrVO> ordrList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			for ( var i=0; i<ordrList.size(); i++ ) {
				ordrList.get(i).setSysFrstInptUserId(getUserId());
				ordrList.get(i).setSysFrstInptPrgrmId(getPrgrmId());
				ordrList.get(i).setSysLastChgUserId(getUserId());
				ordrList.get(i).setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = ordrService.multiOrdrList(ordrList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/ordr/insertOrdr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertOrdr(@RequestBody OrdrVO ordr, HttpServletRequest request) throws Exception {
		logger.debug("insertOrdrList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int inserted = 0;
		try {
			ordr.setSysFrstInptPrgrmId(getPrgrmId());
			ordr.setSysFrstInptUserId(getUserId());
			ordr.setSysLastChgPrgrmId(getPrgrmId());
			ordr.setSysLastChgUserId(getPrgrmId());

			inserted = ordrService.insertOrdr(ordr);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, inserted);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/am/ordr/deleteOrdrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteOrdrList(@RequestBody List<OrdrVO> ordrList, HttpServletRequest request) throws Exception {
		logger.debug("insertOrdrList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int deletedCnt = 0;
		try {

			for (OrdrVO ordrVO : ordrList) {
				ordrVO.setSysLastChgPrgrmId(getPrgrmId());
				ordrVO.setSysLastChgUserId(getPrgrmId());
			}
			deletedCnt = ordrService.deleteOrdrList(ordrList);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}
