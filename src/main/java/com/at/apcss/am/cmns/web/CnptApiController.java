package com.at.apcss.am.cmns.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.am.cmns.service.CnptService;
import com.at.apcss.am.cmns.vo.CnptVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : CnptController.java
 * @Description : 거래처 정보관리에 대한 Controller 클래스
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
@RestController
public class CnptApiController extends BaseController {

	@Resource(name = "cnptService")
	private CnptService cnptService;


	// APC 환경설정 - 거래처 정보(콤보박스)
	@PostMapping(value = "/am/cmns/cnptInfos", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCnptList(@RequestBody CnptVO cnptVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CnptVO> resultList = new ArrayList<>();
		try {

			resultList = cnptService.selectCnptList(cnptVO);

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

	// APC 운송사
	@PostMapping(value = "/am/cmns/updateApcCnptList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateCnptList(@RequestBody List<CnptVO> cnptList, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			for (CnptVO cnptVO : cnptList) {
				cnptVO.setSysLastChgPrgrmId(getPrgrmId());
				cnptVO.setSysLastChgUserId(getUserId());
			}
			
			HashMap<String, Object> rtnObj = cnptService.updateCnptList(cnptList);
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

}
