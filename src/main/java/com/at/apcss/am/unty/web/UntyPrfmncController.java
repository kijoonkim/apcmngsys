package com.at.apcss.am.unty.web;

import com.at.apcss.am.unty.vo.RegSpmtPrfmncVO;
import com.at.apcss.am.unty.vo.UntyPrfmncVO;
import com.at.apcss.am.unty.service.UntyPrfmncService;
import com.at.apcss.am.wgh.vo.WghPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;


/**
 * @Class Name : UntyPrfmncController.java
 * @Description : 원물입고에 대한 Controller 클래스
 * @author 김 호
 * @since 2025.08.18
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.08.18  김 호        최초 생성
 * </pre>
 */
@Controller
public class UntyPrfmncController extends BaseController {

	@Resource(name = "untyPrfmncService")
	private UntyPrfmncService untyPrfmncService;

	/**
	 * 통합실적 등록
	 * @param untyPrfmncList
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/unty/multiUntyPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiUntyPrfmncList(@RequestBody List<UntyPrfmncVO> untyPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for (UntyPrfmncVO untyPrfmncVO: untyPrfmncList) {
				untyPrfmncVO.setSysFrstInptUserId(getUserId());
				untyPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				untyPrfmncVO.setSysLastChgUserId(getUserId());
				untyPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = untyPrfmncService.multiUntyPrfmnc(untyPrfmncList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (EgovBizException e) {
			return getErrorResponseEntity(e);
		} catch (Exception e) {
			logger.error("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 통합실적목록조회(논산배수출영농조합)
	 * @param untyPrfmncVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/unty/selectRawDlngPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawDlngPrfmncList(@RequestBody UntyPrfmncVO untyPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<UntyPrfmncVO> resultList;

		try {
			resultList = untyPrfmncService.selectRawDlngPrfmncList(untyPrfmncVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 통합실적 목록 삭제
	 * @param untyPrfmncList
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/unty/deleteUntyPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteUntyPrfmncList(@RequestBody List<UntyPrfmncVO> untyPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for (UntyPrfmncVO untyPrfmncVO: untyPrfmncList) {
				untyPrfmncVO.setSysFrstInptUserId(getUserId());
				untyPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				untyPrfmncVO.setSysLastChgUserId(getUserId());
				untyPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = untyPrfmncService.deleteUntyPrfmncList(untyPrfmncList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (EgovBizException e) {
			return getErrorResponseEntity(e);
		} catch (Exception e) {
			logger.error("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 양송이출고등록조회(참사랑)
	 * @param regSpmtPrfmncVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/unty/selectRegSpmtPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRegSpmtPrfmncList(@RequestBody RegSpmtPrfmncVO regSpmtPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RegSpmtPrfmncVO> resultList;

		try {
			resultList = untyPrfmncService.selectRegSpmtPrfmncList(regSpmtPrfmncVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}


}
