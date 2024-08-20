package com.at.apcss.fm.fclt.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.fclt.service.FcltPrgrsService;

import com.at.apcss.fm.fclt.vo.FcltPrgrsVO;


/**
 * @Class Name : FcltPrgrsController.java
 * @Description : 진척도에 대한 Controller 클래스
 * @author 임준완
 * @since 2024.07.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.07.23  임준완        최초 생성
 * </pre>
 */
@Controller
public class FcltPrgrsController extends BaseController {


	// 진척도
	@Resource(name= "fcltPrgrsService")
	private FcltPrgrsService fcltPrgrsService;

	// 진척도 조회
	@PostMapping(value = "/fm/fclt/selectPrgrs.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrgrs(Model model, @RequestBody FcltPrgrsVO fcltPrgrsVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		FcltPrgrsVO resultVO = new FcltPrgrsVO();

		try {
			resultVO = fcltPrgrsService.selectPrgrs(fcltPrgrsVO);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);
		return getSuccessResponseEntity(resultMap);
	}

	// 진척도 조회
	@PostMapping(value = "/fm/fclt/selectPrgrsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPrgrsList(Model model, @RequestBody FcltPrgrsVO fcltPrgrsVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<FcltPrgrsVO> resultList = new ArrayList<>();

		try {
			resultList = fcltPrgrsService.selectPrgrsList(fcltPrgrsVO);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 운영자개요 등록
	@PostMapping(value = "/fm/fclt/insertFcltPrgrs.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertFcltPrgrs(@RequestBody FcltPrgrsVO fcltPrgrsVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		fcltPrgrsVO.setSysFrstInptUserId(getUserId());
		fcltPrgrsVO.setSysFrstInptPrgrmId(getPrgrmId());
		fcltPrgrsVO.setSysLastChgUserId(getUserId());
		fcltPrgrsVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = fcltPrgrsService.insertFcltPrgrs(fcltPrgrsVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}