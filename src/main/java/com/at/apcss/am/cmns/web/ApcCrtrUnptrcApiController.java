package com.at.apcss.am.cmns.web;

import com.at.apcss.am.cmns.service.ApcCrtrUntprcService;
import com.at.apcss.am.cmns.vo.ApcCrtrUntprcVO;
import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
public class ApcCrtrUnptrcApiController extends BaseController {

	@Resource(name="apcCrtrUntprcService")
	private ApcCrtrUntprcService apcCrtrUntprcService;

	// 생산자팝업 - 생산자 목록 조회
	@PostMapping(value = "/am/cmns/apcCrtrUntprcs", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
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

}
