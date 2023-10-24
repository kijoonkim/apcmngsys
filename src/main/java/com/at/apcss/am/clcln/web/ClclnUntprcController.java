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
import com.at.apcss.am.clcln.service.ClclnPrfmncService;
import com.at.apcss.am.clcln.service.ClclnUntprcService;
import com.at.apcss.am.clcln.vo.ClclnPrfmncVO;
import com.at.apcss.am.clcln.vo.ClclnUntprcVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : ClclnUntprcController.java
 * @Description : 정산단가관리 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.21  신정철        최초 생성
 *      </pre>
 */
@Controller
public class ClclnUntprcController extends BaseController {

	// 정산단가조회
	@Resource(name = "clclnUntprcService")
	private ClclnUntprcService clclnUntprcService;

	// 정산단가 조회
	@PostMapping(value = "/am/clcln/selectClclnUntprcList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectClclnUntprcList(@RequestBody ClclnUntprcVO clclnUntprcVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ClclnUntprcVO> resultList = new ArrayList<>();
		try {
			resultList = clclnUntprcService.selectClclnUntprcList(clclnUntprcVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
		
	// 정산단가 변경
	@PostMapping(value = "/am/clcln/updateClclnUntprcList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateClclnUntprcList(@RequestBody List<ClclnUntprcVO> clclnUntprcList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			
			for ( ClclnUntprcVO clcln : clclnUntprcList ) {
				clcln.setSysFrstInptPrgrmId(getPrgrmId());
				clcln.setSysFrstInptUserId(getUserId());
				clcln.setSysLastChgPrgrmId(getPrgrmId());
				clcln.setSysLastChgUserId(getUserId());
			}
			
			HashMap<String, Object> rtnObj = clclnUntprcService.updateClclnUntprcList(clclnUntprcList);
			
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

