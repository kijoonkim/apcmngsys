package com.at.apcss.am.wgh.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import com.at.apcss.am.wgh.service.WghPrfmncService;
import com.at.apcss.am.wgh.vo.WghPrfmncDtlVO;
import com.at.apcss.am.wgh.vo.WghPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : WghPrfmncController.java
 * @Description : 계량실적에 대한 Controller 클래스
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
public class WghPrfmncController extends BaseController {

	@Resource(name = "wghPrfmncService")
	private WghPrfmncService wghPrfmncService;

	/**
	 * 계량실적 목록 조회
	 * @param comAuthrtVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/selectWghPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectWghPrfmnc(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		WghPrfmncVO resultVO = new WghPrfmncVO();

		try {
			resultVO = wghPrfmncService.selectWghPrfmnc(wghPrfmncVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

		return getSuccessResponseEntity(resultMap);
	}

	/**
	 * 계량실적 목록 조회
	 * @param comAuthrtVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/wgh/selectWghPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectWghPrfmncList(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WghPrfmncVO> resultList;

		try {
			resultList = wghPrfmncService.selectWghPrfmncList(wghPrfmncVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/wgh/insertWghPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertWghPrfmnc(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			wghPrfmncVO.setSysFrstInptUserId(getUserId());
			wghPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
			wghPrfmncVO.setSysLastChgUserId(getUserId());
			wghPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = wghPrfmncService.insertWghPrfmnc(wghPrfmncVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/wgh/updateWghPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateWghPrfmnc(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			wghPrfmncVO.setSysFrstInptUserId(getUserId());
			wghPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
			wghPrfmncVO.setSysLastChgUserId(getUserId());
			wghPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = wghPrfmncService.updateWghPrfmnc(wghPrfmncVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/wgh/deleteWghPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteWghPrfmncList(@RequestBody List<WghPrfmncVO> wghPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			for ( WghPrfmncVO wghPrfmncVO : wghPrfmncList ) {
				wghPrfmncVO.setSysFrstInptUserId(getUserId());
				wghPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				wghPrfmncVO.setSysLastChgUserId(getUserId());
				wghPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = wghPrfmncService.deleteWghPrfmncList(wghPrfmncList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}


}
