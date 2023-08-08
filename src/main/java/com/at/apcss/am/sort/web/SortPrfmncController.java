package com.at.apcss.am.sort.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.sort.service.SortPrfmncService;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
import com.at.apcss.am.whrs.service.RawMtrWrhsService;
import com.at.apcss.am.whrs.vo.RawMtrWrhsVO;
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
public class SortPrfmncController extends BaseController {
	
	@Resource(name = "sortPrfmncService")
	private SortPrfmncService sortPrfmncService;

	
	@PostMapping(value = "/am/sort/insertSortPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSortPrfmncList(@RequestBody List<SortPrfmncVO> sortPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			
			for ( SortPrfmncVO sortPrfmncVO : sortPrfmncList ) {
				sortPrfmncVO.setSysFrstInptUserId(getUserId());
				sortPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				sortPrfmncVO.setSysLastChgUserId(getUserId());
				sortPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
				
				sortPrfmncVO.setSysFrstInptUserId("admin");
				sortPrfmncVO.setSysFrstInptPrgrmId("testprgrm");
				sortPrfmncVO.setSysLastChgUserId("admin");
				sortPrfmncVO.setSysLastChgPrgrmId("testprgrm");
			}
			
			HashMap<String, Object> rtnObj = sortPrfmncService.insertSortPrfmncList(sortPrfmncList);
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
