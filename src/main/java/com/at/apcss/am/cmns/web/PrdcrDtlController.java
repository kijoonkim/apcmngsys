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

import com.at.apcss.am.cmns.service.PrdcrDtlService;
import com.at.apcss.am.cmns.vo.PrdcrDtlVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : PrdcrController.java
 * @Description : 생산자 상세 정보관리에 대한 Controller 클래스
 * @author 하민우
 * @since 2023.12.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.12.11  하민우        최초 생성
 * </pre>
 */
@Controller
public class PrdcrDtlController extends BaseController {

	@Resource(name="prdcrDtlService")
	private PrdcrDtlService prdcrDtlService;

	// 생산자팝업 - 생산자 목록 조회
	@PostMapping(value = "/am/cmns/selectPrdcrDtlList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectPrdcrDtlList(@RequestBody PrdcrDtlVO prdcrDtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<PrdcrDtlVO> resultList = new ArrayList<>();

		try {

			resultList = prdcrDtlService.selectPrdcrDtlList(prdcrDtlVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/multiPrdcrDtlList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiPrdcrDtlList(@RequestBody List<PrdcrDtlVO> prdcrList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			for ( PrdcrDtlVO prdcrDtlVO : prdcrList ) {
				prdcrDtlVO.setSysFrstInptUserId(getUserId());
				prdcrDtlVO.setSysFrstInptPrgrmId(getPrgrmId());
				prdcrDtlVO.setSysLastChgUserId(getUserId());
				prdcrDtlVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = prdcrDtlService.multiPrdcrDtlList(prdcrList);
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

	@PostMapping(value = "/am/cmns/updatePrdcrDtlDelYn.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updatePrdcrDtlDelYn(@RequestBody PrdcrDtlVO prdcrDtlVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			prdcrDtlVO.setSysLastChgUserId(getUserId());
			prdcrDtlVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = prdcrDtlService.updatePrdcrDtlDelYn(prdcrDtlVO);
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
