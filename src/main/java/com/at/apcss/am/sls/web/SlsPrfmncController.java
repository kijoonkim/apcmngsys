package com.at.apcss.am.sls.web;

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
import com.at.apcss.am.sls.service.SlsPrfmncService;
import com.at.apcss.am.sls.vo.SlsPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SlsPrfmncController.java
 * @Description : 매출실적에 대한 Controller 클래스
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
public class SlsPrfmncController extends BaseController {

	// 매출실적조회
	@Resource(name = "slsPrfmncService")
	private SlsPrfmncService slsPrfmncService;


	// 매출실적 조회
	@PostMapping(value = "/am/sls/selectSlsPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSlsPrfmncList(@RequestBody SlsPrfmncVO slsPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SlsPrfmncVO> resultList = new ArrayList<>();
		try {
			resultList = slsPrfmncService.selectSlsPrfmncList(slsPrfmncVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 매출생성
	@PostMapping(value = "/am/sls/insertSlsPrfmncCrt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSlsPrfmncCrt(@RequestBody SlsPrfmncVO slsPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			slsPrfmncVO.setSysFrstInptUserId(getUserId());
			slsPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
			slsPrfmncVO.setSysLastChgUserId(getUserId());
			slsPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			HashMap<String, Object> rtnObj = slsPrfmncService.insertSlsPrfmncCrt(slsPrfmncVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	// 매출실적 대상목록 조회
	@PostMapping(value = "/am/sls/selectRegSlsPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRegSlsPrfmncList(@RequestBody SlsPrfmncVO slsPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SlsPrfmncVO> resultList = new ArrayList<>();
		try {
			resultList = slsPrfmncService.selectRegSlsPrfmncList(slsPrfmncVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 매출 금액 및 확정 저장
	@PostMapping(value = "/am/sls/saveSlsPrfmncCrtList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> saveSlsPrfmncCrtList(@RequestBody List<SlsPrfmncVO> slsPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for (SlsPrfmncVO slsPrfmncVO : slsPrfmncList) {

				slsPrfmncVO.setSysFrstInptUserId(getUserId());
				slsPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				slsPrfmncVO.setSysLastChgUserId(getUserId());
				slsPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			resultMap = slsPrfmncService.saveSlsPrfmncCrtList(slsPrfmncList);

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

	// 매출 삭제
	@PostMapping(value = "/am/sls/deleteSlsPrfmncCrtList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteSlsPrfmncCrtList(@RequestBody List<SlsPrfmncVO> slsPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for (SlsPrfmncVO slsPrfmncVO : slsPrfmncList) {

				slsPrfmncVO.setSysFrstInptUserId(getUserId());
				slsPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				slsPrfmncVO.setSysLastChgUserId(getUserId());
				slsPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			resultMap = slsPrfmncService.deleteSlsPrfmncCrtList(slsPrfmncList);

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
