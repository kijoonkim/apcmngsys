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

import com.at.apcss.am.pckg.service.GdsCdService;
import com.at.apcss.am.pckg.vo.GdsCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : GdsCdController.java
 * @Description : 상품코드에 대한 Controller 클래스
 * @author 김현호
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
public class GdsCdController extends BaseController {
	@Resource(name = "gdsCdService")
	private GdsCdService gdsCdService;


	@PostMapping(value = "/am/pckg/selectGdsCd.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectGdsCdList(@RequestBody GdsCdVO gdsCdVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<GdsCdVO> resultList = new ArrayList<>();

		try {
			resultList = gdsCdService.selectGdsCdList(gdsCdVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}
