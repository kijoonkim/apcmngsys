package com.at.apcss.am.spmt.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.at.apcss.am.spmt.service.SpmtDocService;
import com.at.apcss.am.spmt.service.SpmtPrfmncService;
import com.at.apcss.am.spmt.vo.SpmtDocVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.util.ComUtil;

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
public class SpmtDocApiController extends BaseController {

	@Resource(name= "spmtDocService")
	private SpmtDocService spmtDocService;


	// 전자송품장 내역 조회
	@GetMapping(value = "/am/spmt/getSpmtDoc.do")
	public ResponseEntity<HashMap<String, Object>> getSpmtPrfmncList(
			@RequestParam(name="CMP_CD") String cmpCd,
			@RequestParam(name="REG_DATE") String regDate,
			@RequestParam(name="SHIP_DATE", required=false) String shipDate, 
			@RequestParam(name="WHSAL_CD", required=false) String whsalCd,
			HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> resultList = new ArrayList<>();
		
		String resultCode = "0";
		String resultMessage = "성공적으로 조회되었습니다.";
		int totalCount = 0;
		
		HashMap<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("CMP_CD", cmpCd);
		paramMap.put("REG_DATE", regDate);
		paramMap.put("SHIP_DATE", shipDate);
		paramMap.put("WHSAL_CD", whsalCd);
		
		try {
			if (paramMap.get("CMP_CD") == null) {
				resultCode = "1";
				resultMessage = "도매시장법인코드가 없습니다.";
			} else if (paramMap.get("REG_DATE") == null) {
				resultCode = "1";
				resultMessage = "등록일자가 없습니다.";
			} else {
				resultList = spmtDocService.selectSpmtDocList(paramMap);
				
				if (resultList != null) {
					totalCount = resultList.size();
				}
			}
		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			resultCode = "1";
			resultMessage = e.getMessage(); 
		} finally {
			setMenuComLog(request);
		}

		resultMap.put("RESULT_CODE", resultCode);
		resultMap.put("RESULT_MESSAGE", resultMessage);
		resultMap.put("TOT_CNT", totalCount);
		resultMap.put("DATA", resultList);
		
		return new ResponseEntity<HashMap<String, Object>>(resultMap, HttpStatus.OK);
	}

	
	
	// 전자송품장 내역 조회
	@PostMapping(value = "/am/spmt/getSpmtDoc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtPrfmncList(@RequestBody HashMap<String, Object> paramMap, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> resultList = new ArrayList<>();
		
		String resultCode = "0";
		String resultMessage = "성공적으로 조회되었습니다.";
		int totalCount = 0;
		
		try {
			if (paramMap.get("CMP_CD") == null) {
				resultCode = "1";
				resultMessage = "도매시장법인코드가 없습니다.";
			} else if (paramMap.get("REG_DATE") == null) {
				resultCode = "1";
				resultMessage = "등록일자가 없습니다.";
			} else {
				resultList = spmtDocService.selectSpmtDocList(paramMap);
				
				if (resultList != null) {
					totalCount = resultList.size();
				}
			}
		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			resultCode = "1";
			resultMessage = e.getMessage(); 
		} finally {
			setMenuComLog(request);
		}

		resultMap.put("RESULT_CODE", resultCode);
		resultMap.put("RESULT_MESSAGE", resultMessage);
		resultMap.put("TOT_CNT", totalCount);
		resultMap.put("DATA", resultList);
		
		return new ResponseEntity<HashMap<String, Object>>(resultMap, HttpStatus.OK);
	}


}
