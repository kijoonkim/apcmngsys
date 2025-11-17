package com.at.apcss.am.wgh.web;

import com.at.apcss.am.wgh.service.WghPrfmncService;
import com.at.apcss.am.wgh.vo.WghPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : WghPrfmncApiController.java
 * @Description : 계량실적에 대한 ApiController 클래스
 * @author 김은총
 * @since 2025.10.13
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.10.13  김은총        최초 생성
 * </pre>
 */
@RestController
public class WghPrfmncApiController extends BaseController {

	@Resource(name = "wghPrfmncService")
	private WghPrfmncService wghPrfmncService;

	/**
	 * API 계량 입고실적 목록 조회
	 */
	@PostMapping(value = "/am/wgh/selectWghPrfmncListForApi", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectWghPrfmncListForApi(@RequestBody WghPrfmncVO wghPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> resultList;

		try {
			resultList = wghPrfmncService.selectWghPrfmncListForApi(wghPrfmncVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			setMenuComLog(request);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}
