package com.at.apcss.am.clcln.web;

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
import com.at.apcss.am.clcln.service.ClclnPrfmncService;
import com.at.apcss.am.clcln.vo.ClclnPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : ClclnPrfmncController.java
 * @Description : 정산실적관리 대한 Controller 클래스
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
public class ClclnPrfmncController extends BaseController {

	// 정산실적조회
	@Resource(name = "clclnPrfmncService")
	private ClclnPrfmncService clclnPrfmncService;

	// 정산실적 조회
	@PostMapping(value = "/am/clcln/selectClclnPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectClclnPrfmncList(@RequestBody ClclnPrfmncVO clclnPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ClclnPrfmncVO> resultList = new ArrayList<>();
		try {
			resultList = clclnPrfmncService.selectClclnPrfmncList(clclnPrfmncVO);
		} catch (Exception e) {
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



	// 정산실적 생성
	@PostMapping(value = "/am/clcln/insertClclnPrfmncCrt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertClclnPrfmnc(@RequestBody ClclnPrfmncVO clclnPrfmncVO, HttpServletRequest request) throws Exception {
		logger.debug("insertApcCmnsItem 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			clclnPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
			clclnPrfmncVO.setSysFrstInptUserId(getUserId());
			clclnPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			clclnPrfmncVO.setSysLastChgUserId(getUserId());
			HashMap<String, Object> rtnObj = clclnPrfmncService.insertClclnPrfmncCrt(clclnPrfmncVO);
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

	// 정산실적 변경, 확정
	@PostMapping(value = "/am/clcln/updateClclnPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateClclnPrfmncList(@RequestBody List<ClclnPrfmncVO> clclnPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for ( ClclnPrfmncVO clcln : clclnPrfmncList ) {
				clcln.setSysLastChgPrgrmId(getPrgrmId());
				clcln.setSysLastChgUserId(getUserId());
			}

			HashMap<String, Object> rtnObj = clclnPrfmncService.updateClclnPrfmncList(clclnPrfmncList);
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

	// 정산실적 삭제
	@PostMapping(value = "/am/clcln/deleteClclnPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteClclnPrfmncList(@RequestBody List<ClclnPrfmncVO> clclnPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for ( ClclnPrfmncVO clcln : clclnPrfmncList ) {
				clcln.setSysLastChgPrgrmId(getPrgrmId());
				clcln.setSysLastChgUserId(getUserId());
			}

			HashMap<String, Object> rtnObj = clclnPrfmncService.deleteClclnPrfmncList(clclnPrfmncList);

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

