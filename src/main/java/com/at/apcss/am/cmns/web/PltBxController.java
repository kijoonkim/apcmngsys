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

import com.at.apcss.am.cmns.service.PltBxService;
import com.at.apcss.am.cmns.vo.PltBxVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : PltBxController.java
 * @Description : 팔레트/박스 정보관리에 대한 Controller 클래스
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
public class PltBxController extends BaseController {
	@Resource(name = "pltBxService")
	private PltBxService pltBxService;


	// APC 환경설정 - 팔레트/박스 목록 조회
	@PostMapping(value = "/am/cmns/selectPltBxList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPltBxList(@RequestBody PltBxVO pltBxVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PltBxVO> resultList = new ArrayList<>();
		try {

			resultList = pltBxService.selectPltBxList(pltBxVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 출하실적 등록
	@PostMapping(value = "/am/cmns/multiPltBxList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiPltBxList(@RequestBody List<PltBxVO> pltBxList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<PltBxVO> updateList = new ArrayList<PltBxVO>();
		try {

			for (PltBxVO pltBxVO : pltBxList) {
				pltBxVO.setSysFrstInptPrgrmId(getPrgrmId());
				pltBxVO.setSysFrstInptUserId(getPrgrmId());
				pltBxVO.setSysLastChgPrgrmId(getPrgrmId());
				pltBxVO.setSysLastChgUserId(getUserId());
				updateList.add(pltBxVO);
			}
			HashMap<String, Object> rtnObj = pltBxService.multiPltBxList(updateList);
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

	@PostMapping(value = "/am/cmns/deletePltBx.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deletePltBx(@RequestBody PltBxVO pltBxVO, HttpServletRequest request) throws Exception {
		logger.debug("deletePltBx 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = pltBxService.deletePltBx(pltBxVO);
		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}
}
