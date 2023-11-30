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

import com.at.apcss.am.cmns.service.WrhsVhclService;
import com.at.apcss.am.cmns.vo.WrhsVhclVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : WrhsVhclController.java
 * @Description : 입고차량 정보관리에 대한 Controller 클래스
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
public class WrhsVhclController extends BaseController {
	// 차량정보
	@Resource(name = "wrhsVhclService")
	private WrhsVhclService wrhsVhclService;

	// APC 환경설정 - 입고차량정보 목록 조회
	@PostMapping(value = "/am/cmns/selectWrhsVhclList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectWrhsVhclList(@RequestBody WrhsVhclVO wrhsVhclVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WrhsVhclVO> resultList = new ArrayList<>();
		try {
			resultList = wrhsVhclService.selectWrhsVhclList(wrhsVhclVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/multiVhclList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiVhclList(@RequestBody List<WrhsVhclVO> vhclList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<WrhsVhclVO> updateList = new ArrayList<WrhsVhclVO>();
		try {
			for ( WrhsVhclVO wrhsVhclVO : vhclList ) {
				wrhsVhclVO.setVhclno(wrhsVhclVO.getVhclno().replaceAll(" ", ""));
				wrhsVhclVO.setSysFrstInptUserId(getUserId());
				wrhsVhclVO.setSysFrstInptPrgrmId(getPrgrmId());
				wrhsVhclVO.setSysLastChgUserId(getUserId());
				wrhsVhclVO.setSysLastChgPrgrmId(getPrgrmId());
				updateList.add(wrhsVhclVO);
			}

			HashMap<String, Object> rtnObj = wrhsVhclService.multiVhclList(updateList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/deleteWrhsVhclList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteWrhsVhclList(@RequestBody WrhsVhclVO wrhsVhclVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = wrhsVhclService.deleteWrhsVhcl(wrhsVhclVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}
}
