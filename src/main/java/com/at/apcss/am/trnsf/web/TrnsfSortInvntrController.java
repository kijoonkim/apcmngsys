package com.at.apcss.am.trnsf.web;

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

import com.at.apcss.am.trnsf.service.TrnsfSortInvntrService;
import com.at.apcss.am.trnsf.vo.TrnsfSortInvntrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SortInvntrController.java
 * @Description : 선별재고관리 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.23  김현호        최초 생성
 * </pre>
 */
@Controller
public class TrnsfSortInvntrController extends BaseController {
	@Resource(name = "trnsfSortInvntrService")
	private TrnsfSortInvntrService trnsfSortInvntrService;

	@PostMapping(value = "/am/trnsf/selectTrnsfSortInvntrDsctnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectTrnsfSortInvntrDsctnList(@RequestBody TrnsfSortInvntrVO trnsfSortInvntrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<TrnsfSortInvntrVO> resultList =  new ArrayList<>();
		try {

			resultList = trnsfSortInvntrService.selectTrnsfSortInvntrDsctnList(trnsfSortInvntrVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/am/trnsf/saveTrnsfSortInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> saveTrnsfSortInvntrList(@RequestBody List<TrnsfSortInvntrVO> trnsfSortInvntrList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			for ( TrnsfSortInvntrVO trnsfSortInvntrVO : trnsfSortInvntrList ) {
				trnsfSortInvntrVO.setSysFrstInptPrgrmId(getPrgrmId());
				trnsfSortInvntrVO.setSysFrstInptUserId(getUserId());
				trnsfSortInvntrVO.setSysLastChgUserId(getUserId());
				trnsfSortInvntrVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = trnsfSortInvntrService.insertTrnsfSortInvntrList(trnsfSortInvntrList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/trnsf/selectTrnsfCfmtnSortInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectTrnsfCfmtnSortInvntrList(@RequestBody TrnsfSortInvntrVO trnsfSortInvntrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<TrnsfSortInvntrVO> resultList =  new ArrayList<>();
		try {

			resultList = trnsfSortInvntrService.selectTrnsfCfmtnSortInvntrList(trnsfSortInvntrVO);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/trnsf/deleteTrnsfCfmtnSortInvntrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteTrnsfCfmtnSortInvntrList(@RequestBody List<TrnsfSortInvntrVO> trnsfSortInvntrList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			for ( TrnsfSortInvntrVO trnsfSortInvntrVO : trnsfSortInvntrList ) {
				trnsfSortInvntrVO.setSysFrstInptPrgrmId(getPrgrmId());
				trnsfSortInvntrVO.setSysFrstInptUserId(getUserId());
				trnsfSortInvntrVO.setSysLastChgUserId(getUserId());
				trnsfSortInvntrVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = trnsfSortInvntrService.deleteTrnsfCfmtnSortInvntrList(trnsfSortInvntrList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

}
