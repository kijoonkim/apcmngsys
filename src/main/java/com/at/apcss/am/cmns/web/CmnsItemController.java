package com.at.apcss.am.cmns.web;

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

import com.at.apcss.am.cmns.service.CmnsItemService;
import com.at.apcss.am.cmns.vo.CmnsItemVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : CmnsItemController.java
 * @Description : 품목 정보관리에 대한 Controller 클래스
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
public class CmnsItemController extends BaseController {

	@Resource(name = "cmnsItemService")
	private CmnsItemService cmnsItemService;

	// APC 환경설정 - 품목 단건 조회
	@PostMapping(value = "/am/cmns/selectCmnsApcItem.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCmnsApcItem(@RequestBody CmnsItemVO cmnsItemVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		CmnsItemVO resultVO = new CmnsItemVO();

		try {

			resultVO = cmnsItemService.selectCmnsApcItem(cmnsItemVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 환경설정 - 품목 목록 조회
	@PostMapping(value = "/am/cmns/selectCmnsItemList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCmnsItemList(@RequestBody CmnsItemVO cmnsItemVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsItemVO> resultList = new ArrayList<>();

		try {

			resultList = cmnsItemService.selectCmnsItemList(cmnsItemVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 환경설정 - APC 품목 목록 조회
	@PostMapping(value = "/am/cmns/selectApcCmnsItemList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcCmnsItemList(@RequestBody CmnsItemVO cmnsItemVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsItemVO> resultList = new ArrayList<>();

		try {

			resultList = cmnsItemService.selectApcCmnsItemList(cmnsItemVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 환경설정 - APC 품목 등록
	@PostMapping(value = "/am/cmns/insertApcCmnsItem.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertApcCmnsItem(@RequestBody CmnsItemVO cmnsItemVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			cmnsItemVO.setSysFrstInptPrgrmId(getPrgrmId());
			cmnsItemVO.setSysFrstInptUserId(getUserId());
			cmnsItemVO.setSysLastChgPrgrmId(getPrgrmId());
			cmnsItemVO.setSysLastChgUserId(getUserId());

			HashMap<String, Object> rtnObj = cmnsItemService.insertCmnsItem(cmnsItemVO);
			if(rtnObj != null) {
				getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}

	// APC 환경설정 - APC 품목 삭제
	@PostMapping(value = "/am/cmns/deleteApcCmnsItem.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteApcCmnsItem(@RequestBody CmnsItemVO cmnsItemVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			HashMap<String, Object> rtnObj = cmnsItemService.deleteCmnsItem(cmnsItemVO);
			if(rtnObj != null) {
				getErrorResponseEntity(rtnObj);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}

	// APC 환경설정 - APC 품목 정보 변경
	@PostMapping(value = "/am/cmns/updateApcCmnsItem.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateApcCmnsItem(@RequestBody CmnsItemVO cmnsItemVO, HttpServletRequest request) throws Exception {

		int updatedCnt = 0;

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			cmnsItemVO.setSysLastChgPrgrmId(getPrgrmId());
			cmnsItemVO.setSysLastChgUserId(getUserId());
			updatedCnt = cmnsItemService.updateApcCmnsItem(cmnsItemVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

}
