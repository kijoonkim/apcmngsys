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

import com.at.apcss.am.spmt.service.SpmtTrsprtService;
import com.at.apcss.am.spmt.vo.SpmtTrsprtVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SpmtTrsprtController.java
 * @Description : 출하운송회사정보 대한 Controller 클래스
 * @author 김호
 * @since 2023.07.13
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.13  김호        최초 생성
 *      </pre>
 */
@Controller
public class SpmtTrsprtController extends BaseController {
	// 출하운송회사정보
	@Resource(name = "spmtTrsprtService")
	private SpmtTrsprtService spmtTrsprtService;

	// APC 환경설정 - 출하운송회사정보 목록 조회
	@PostMapping(value = "/am/spmt/selectSpmtTrsprtList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtTrsprtList(@RequestBody SpmtTrsprtVO spmtTrsprtVO, HttpServletRequest request) throws Exception {
		logger.debug("selectSpmtTrsprtList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SpmtTrsprtVO> resultList = new ArrayList<>();
		try {

			resultList = spmtTrsprtService.selectSpmtTrsprtList(spmtTrsprtVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}
