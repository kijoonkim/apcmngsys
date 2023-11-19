package com.at.apcss.fm.fclt.web;

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

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.fclt.service.MdRtlFcltService;
import com.at.apcss.fm.fclt.vo.MdRtlFcltVO;
/**
 * @Class Name : MdRtlFcltController.java
 * @Description : APC전수조사 대시보드 Controller 클래스
 * @author 김현호
 * @since 2023.11.15
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.11.15  김현호        최초 생성
 * </pre>
 */
@Controller
public class MdRtlFcltController extends BaseController {

	// APC전수조사 대시보드
	@Resource(name= "mdRtlFcltService")
	private MdRtlFcltService mdRtlFcltService;

	// APC현황
	@PostMapping(value = "/fm/fclt/selectMapSttn.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectMapSttn(@RequestBody MdRtlFcltVO mdRtlFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<MdRtlFcltVO> resultLsit = new ArrayList<>();
		try {
			resultLsit = mdRtlFcltService.selectMapSttn(mdRtlFcltVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultLsit);
		return getSuccessResponseEntity(resultMap);
	}
	// APC지역목록 조회
	@PostMapping(value = "/fm/fclt/selectCtpvAreaList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCtpvAreaList(@RequestBody MdRtlFcltVO mdRtlFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<MdRtlFcltVO> resultLsit = new ArrayList<>();
		try {
			resultLsit = mdRtlFcltService.selectCtpvAreaList(mdRtlFcltVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultLsit);
		return getSuccessResponseEntity(resultMap);
	}

	// 산지유통시설현황 조회
	@PostMapping(value = "/fm/fclt/selectMdRtlOgnzNowGridList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectMdRtlOgnzNowGridList(@RequestBody MdRtlFcltVO mdRtlFcltVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap = mdRtlFcltService.selectMdRtlOgnzNowGridList(mdRtlFcltVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}
	
	// 산지유통시설지역별현황 조회
	@PostMapping(value = "/fm/fclt/selectMdRtlFcltRgnNowGridList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectMdRtlFcltRgnNowGridList(@RequestBody MdRtlFcltVO mdRtlFcltVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap = mdRtlFcltService.selectMdRtlFcltRgnNowGridList(mdRtlFcltVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}
	
	// 정부지원 산지유통시설 현황 조회
	@PostMapping(value = "/fm/fclt/selectGvrngmtSprtMdRtlFcltGridList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectGvrngmtSprtMdRtlFcltGridList(@RequestBody MdRtlFcltVO mdRtlFcltVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap = mdRtlFcltService.selectGvrngmtSprtMdRtlFcltGridList(mdRtlFcltVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}
	
	// 정부지원 산지유통시설 현황 조회
	@PostMapping(value = "/fm/fclt/selectGvrngmtSprtMdRtlOgnzTypeGridList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectGvrngmtSprtMdRtlOgnzTypeGridList(@RequestBody MdRtlFcltVO mdRtlFcltVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap = mdRtlFcltService.selectGvrngmtSprtMdRtlOgnzTypeGridList(mdRtlFcltVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}
	
	// 산지유통시설 운영실적 조회
	@PostMapping(value = "/fm/fclt/selectMdRtlFcltOperPrfmncGridList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectMdRtlFcltOperPrfmncGridList(@RequestBody MdRtlFcltVO mdRtlFcltVO, HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			resultMap = mdRtlFcltService.selectMdRtlFcltOperPrfmncGridList(mdRtlFcltVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}


}
