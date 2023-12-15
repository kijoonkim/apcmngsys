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

import com.at.apcss.am.cmns.service.RgnTrsprtCstService;
import com.at.apcss.am.cmns.vo.RgnTrsprtCstVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@RestController
public class RgnTrsprtCstApiController extends BaseController {

	// 지역별운임비
	@Resource(name = "rgnTrsprtCstService")
	private RgnTrsprtCstService rgnTrsprtCstService;

	// APC 환경설정 - 지역별 운임비 목록 조회
	@PostMapping(value = "/am/cmns/trsprtCsts", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> trsprtCsts(@RequestBody RgnTrsprtCstVO rgnTrsprtCstVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<RgnTrsprtCstVO> resultList = new ArrayList<>();
		try {

			resultList = rgnTrsprtCstService.selectRgnTrsprtCstList(rgnTrsprtCstVO);

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

}
