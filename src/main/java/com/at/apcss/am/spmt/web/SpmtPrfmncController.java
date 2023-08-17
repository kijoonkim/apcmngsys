package com.at.apcss.am.spmt.web;

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

import com.at.apcss.am.spmt.service.SpmtPrfmncService;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SpmtPrfmncController.java
 * @Description : 출고실적에 대한 Controller 클래스
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
public class SpmtPrfmncController extends BaseController {

	// 출하실적조회
	@Resource(name = "spmtPrfmncService")
	private SpmtPrfmncService spmtPrfmncService;
	
	// 출하실적등록
	@RequestMapping(value = "/am/spmt/regSpmtPrfmnc.do")
	public String doRegFormSpmtPrfmnc() {
		return "apcss/am/spmt/regSpmtPrfmnc";
	}

	// 출하실적조회
	@RequestMapping(value = "/am/spmt/spmtPrfmnc.do")
	public String doSpmtPrfmnc() {
		return "apcss/am/spmt/spmtPrfmnc";
	}

	// 출하실적 조회
	@PostMapping(value = "/am/spmt/selectSpmtPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtPrfmncList(@RequestBody SpmtPrfmncVO SpmtPrfmncVO, HttpServletRequest request) throws Exception {
		logger.debug("selectSpmtPrfmncList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SpmtPrfmncVO> resultList = new ArrayList<>();
		try {
			resultList = spmtPrfmncService.selectSpmtPrfmncList(SpmtPrfmncVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
		
	// 출하실적등록 태블릿
	@RequestMapping(value = "/am/spmt/regSpmtPrfmncTablet.do")
	public String doRegFormSpmtPrfmncTablet() {
		return "apcss/am/spmt/regSpmtPrfmncTablet";
	}
	
}
