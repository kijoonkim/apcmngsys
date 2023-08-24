package com.at.apcss.am.ordr.web;

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

import com.at.apcss.am.ordr.service.OrdrService;
import com.at.apcss.am.ordr.vo.OrdrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : OrdrController.java
 * @Description : 발주정보관리 대한 Controller 클래스
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
public class OrdrController extends BaseController {
	
	// 발주정보조회
	@Resource(name = "ordrService")
	private OrdrService ordrService;

	// 발주정보조회
	@RequestMapping(value = "/am/ordr/outordrInfo.do")
	public String doOutordrInfo() {
		return "apcss/am/ordr/outordrInfo";
	}
	
	// 발주정보 조회
	@PostMapping(value = "/am/ordr/selectOrdrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectOrdrList(@RequestBody OrdrVO OrdrVO, HttpServletRequest request) throws Exception {
		logger.debug("selectOrdrList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<OrdrVO> resultList = new ArrayList<>();
		try {
			resultList = ordrService.selectOrdrList(OrdrVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 발주정보등록
	@RequestMapping(value = "/am/ordr/regOutordrInfo.do")
	public String doRegFormOutordrInfo() {
		return "apcss/am/ordr/regOutordrInfo";
	}
}
