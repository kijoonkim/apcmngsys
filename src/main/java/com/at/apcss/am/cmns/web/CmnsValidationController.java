package com.at.apcss.am.cmns.web;

import java.util.HashMap;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.cmns.service.CmnsValidationService;
import com.at.apcss.am.cmns.vo.CmnsValidationVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : CmnsValidationController.java
 * @Description : 업무별 삭제가능 관리에 대한 Controller 클래스
 * @author 신정철
 * @since 2023.08.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.21  신정철        최초 생성
 * </pre>
 */
@Controller
public class CmnsValidationController extends BaseController {

	@Resource(name = "cmnsValidationService")
	private CmnsValidationService cmnsValidationService;


	// rtnMsg == null : 삭제가능, != null error
	@PostMapping(value = "/am/cmns/selectChkCdDelible.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectChkCdDelible(@RequestBody CmnsValidationVO cmnsValidationVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		CmnsValidationVO resultVO = new CmnsValidationVO();
		try {
			resultVO = cmnsValidationService.selectChkCdDelible(cmnsValidationVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

		return getSuccessResponseEntity(resultMap);
	}


}
