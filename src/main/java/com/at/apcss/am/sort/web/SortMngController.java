package com.at.apcss.am.sort.web;

import java.util.HashMap;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.sort.service.SortMngService;
import com.at.apcss.am.sort.vo.SortMngVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SortPrfmncController.java
 * @Description : 선별실적정보관리에 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Controller
public class SortMngController extends BaseController {
	
	@Resource(name = "sortMngService")
	private SortMngService sortMngService;

	
	@PostMapping(value = "/am/sort/insertSortPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSortPrfmncList(@RequestBody SortMngVO sortMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			sortMngVO.setSysFrstInptUserId(getUserId());
			sortMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			sortMngVO.setSysLastChgUserId(getUserId());
			sortMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			sortMngVO.setSysFrstInptUserId("admin");
			sortMngVO.setSysFrstInptPrgrmId("testprgrm");
			sortMngVO.setSysLastChgUserId("admin");
			sortMngVO.setSysLastChgPrgrmId("testprgrm");
			
			
			sortMngVO.setNeedsInptRegYn(ComConstants.CON_YES);	// 투입실적 자동등록
			
			HashMap<String, Object> rtnObj = sortMngService.insertSortPrfmnc(sortMngVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
			
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		
		return getSuccessResponseEntity(resultMap);
	}
}
