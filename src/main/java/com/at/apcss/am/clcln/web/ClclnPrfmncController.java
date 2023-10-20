package com.at.apcss.am.clcln.web;

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
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.am.clcln.service.ClclnPrfmncService;
import com.at.apcss.am.clcln.vo.ClclnPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : ClclnPrfmncController.java
 * @Description : 정산실적관리 대한 Controller 클래스
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
public class ClclnPrfmncController extends BaseController {

	// 정산실적조회
	@Resource(name = "clclnPrfmncService")
	private ClclnPrfmncService clclnPrfmncService;

	// 정산실적 조회
	@PostMapping(value = "/am/clcln/selectClclnPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectClclnPrfmncList(@RequestBody ClclnPrfmncVO ClclnPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ClclnPrfmncVO> resultList = new ArrayList<>();
		try {
			resultList = clclnPrfmncService.selectClclnPrfmncList(ClclnPrfmncVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	
	

}

