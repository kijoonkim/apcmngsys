package com.at.apcss.am.cmns.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.cmns.service.DdlnService;
import com.at.apcss.am.cmns.vo.DdlnVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : DdlnController.java
 * @Description : 마감 정보관리에 대한 Controller 클래스
 * @author 하민우
 * @since 2023.08.10
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.10  하민우        최초 생성
 *      </pre>
 */
@Controller
public class DdlnController extends BaseController {
	// 마감등록
	@Resource(name = "DdlnService")
	private DdlnService DdlnService;

	// 마감등록팝업 - 마감여부 목록 조회
	@PostMapping(value = "/am/cmns/selectDdlnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectDdlnList(@RequestBody DdlnVO DdlnVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<DdlnVO> resultList = new ArrayList<>();
		try {

			resultList = DdlnService.selectDdlnList(DdlnVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/multiDdlnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiDdlnList(@RequestBody List<DdlnVO> ddlnList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			for ( DdlnVO ddlnVO : ddlnList ) {
				ddlnVO.setSysFrstInptUserId(getUserId());
				ddlnVO.setSysFrstInptPrgrmId(getPrgrmId());
				ddlnVO.setSysLastChgUserId(getUserId());
				ddlnVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = DdlnService.multiDdlnList(ddlnList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/deleteDdln.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteDdln(@RequestBody DdlnVO DdlnVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = DdlnService.deleteDdln(DdlnVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}
}
