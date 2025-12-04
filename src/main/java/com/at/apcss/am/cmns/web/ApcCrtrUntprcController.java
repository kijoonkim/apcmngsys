package com.apcmngsys.apcss.am.cmns.web;

import com.apcmngsys.apcss.am.cmns.service.ApcCrtrUntprcService;
import com.apcmngsys.apcss.am.cmns.vo.ApcCrtrUntprcVO;
import com.apcmngsys.apcss.co.constants.ComConstants;
import com.apcmngsys.apcss.co.sys.controller.BaseController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : ApcCrtrUntprcController.java
 * @Description : APC기준단가 대한 Controller 클래스
 * @author 김호
 * @since 2025.11.07
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.11.07  김호        최초 생성
 * </pre>
 */
@Controller
public class ApcCrtrUntprcController extends BaseController {

	@Resource(name="apcCrtrUntprcService")
	private ApcCrtrUntprcService apcCrtrUntprcService;

	// 생산자팝업 - 생산자 목록 조회
	@PostMapping(value = "/am/cmns/selectApcCrtrUntprcList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcCrtrUntprcList(@RequestBody ApcCrtrUntprcVO apcCrtrUntprcVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ApcCrtrUntprcVO> resultList = new ArrayList<>();

		try {
			resultList = apcCrtrUntprcService.selectApcCrtrUntprcList(apcCrtrUntprcVO);

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

	@PostMapping(value = "/am/cmns/multiSaveApcCrtrUntprcList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiSaveApcCrtrUntprcList(@RequestBody List<ApcCrtrUntprcVO> apcCrtrUntprcList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			for ( ApcCrtrUntprcVO apcCrtrUntprcVO : apcCrtrUntprcList ) {

				apcCrtrUntprcVO.setSysFrstInptUserId(getUserId());
				apcCrtrUntprcVO.setSysFrstInptPrgrmId(getPrgrmId());
				apcCrtrUntprcVO.setSysLastChgUserId(getUserId());
				apcCrtrUntprcVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = apcCrtrUntprcService.multiSaveApcCrtrUntprcList(apcCrtrUntprcList);
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

	@PostMapping(value = "/am/cmns/deleteApcCrtrUntprc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteApcCrtrUntprc(@RequestBody ApcCrtrUntprcVO apcCrtrUntprcVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			HashMap<String, Object> rtnObj = apcCrtrUntprcService.deleteApcCrtrUntprc(apcCrtrUntprcVO);
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
}
