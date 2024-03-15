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

import com.at.apcss.am.cmns.service.PrdcrService;
import com.at.apcss.am.cmns.vo.PrdcrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : PrdcrController.java
 * @Description : 생산자 정보관리에 대한 Controller 클래스
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
public class PrdcrController extends BaseController {

	@Resource(name="prdcrService")
	private PrdcrService prdcrService;

	// 생산자팝업 - 생산자 목록 조회
	@PostMapping(value = "/am/cmns/selectPrdcrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectPrdcrList(@RequestBody PrdcrVO prdcrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<PrdcrVO> resultList = new ArrayList<>();


		try {

			resultList = prdcrService.selectPrdcrList(prdcrVO);

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

	// 생산자팝업 - 생산자 목록 조회
	@PostMapping(value = "/am/cmns/selectPrdcrCdList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectPrdcrCdList(@RequestBody PrdcrVO prdcrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<PrdcrVO> resultList = new ArrayList<>();

		try {

			resultList = prdcrService.selectPrdcrCdList(prdcrVO);

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

	// 생산자관리 - 아그리스 생산자 마스터 목록 조회
	@PostMapping(value = "/am/cmns/selectAgrixPrdcrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectAgrixPrdcrList(@RequestBody PrdcrVO prdcrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<PrdcrVO> resultList = new ArrayList<>();

		try {
			resultList = prdcrService.selectAgrixPrdcrList(prdcrVO);
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

	@PostMapping(value = "/am/cmns/multiPrdcrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiPrdcrList(@RequestBody List<PrdcrVO> prdcrList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			for ( PrdcrVO prdcrVO : prdcrList ) {
				if (prdcrVO.getVhclno() != null && prdcrVO.getVhclno() != "") {
					prdcrVO.setVhclno(prdcrVO.getVhclno().replaceAll(" ", ""));
				}
				prdcrVO.setSysFrstInptUserId(getUserId());
				prdcrVO.setSysFrstInptPrgrmId(getPrgrmId());
				prdcrVO.setSysLastChgUserId(getUserId());
				prdcrVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = prdcrService.multiPrdcrList(prdcrList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/deletePrdcr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deletePrdcr(@RequestBody PrdcrVO prdcrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			HashMap<String, Object> rtnObj = prdcrService.deletePrdcr(prdcrVO);
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

	@PostMapping(value = "/am/cmns/deletePrdcrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deletePrdcrList(@RequestBody List<PrdcrVO> prdcrList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		for(PrdcrVO prdcrVO : prdcrList ) {
			try {
				HashMap<String, Object> rtnObj = prdcrService.deletePrdcr(prdcrVO);
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
		}

		return getSuccessResponseEntity(resultMap);
	}
}
