package com.at.apcss.am.pckg.web;

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

import com.at.apcss.am.pckg.service.PckgPrfmncService;
import com.at.apcss.am.pckg.vo.PckgPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : PckgPrfmncController.java
 * @Description : 포장실적에 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.22  김현호        최초 생성
 * </pre>
 */
@Controller
public class PckgPrfmncController extends BaseController {
	
	@Resource(name = "pckgPrfmncService")
	private PckgPrfmncService pckgPrfmncService;

	
	@PostMapping(value = "/am/pckg/pckgInpt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPckgPrfmncList(@RequestBody PckgPrfmncVO pckgPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PckgPrfmncVO> resultList = new ArrayList<>();

		logger.debug("param info {}", pckgPrfmncVO.toString());

		try {
			resultList = pckgPrfmncService.selectPckgPrfmncList(pckgPrfmncVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}
