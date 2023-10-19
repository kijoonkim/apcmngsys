package com.at.apcss.am.oprtr.web;

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

import com.at.apcss.am.oprtr.service.OprtrPrfmncService;
import com.at.apcss.am.oprtr.vo.OprtrPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
/**
 * @Class Name : OprtrPrfmncController.java
 * @Description : 작업자실적등록 프로그램에 대한 Controller 클래스
 * @author 김호
 * @since 2023.10.17
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.17     김호        최초 생성
 * </pre>
 */
@Controller
public class OprtrPrfmncController extends BaseController{

	@Resource(name= "oprtrPrfmncService")
	private OprtrPrfmncService oprtrPrfmncService;

	// 실적 작업자 목록 조회
	@PostMapping(value = "/am/oprtr/selectOprtrPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectOprtrPrfmncList(@RequestBody OprtrPrfmncVO oprtrPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<OprtrPrfmncVO> resultList = new ArrayList<>();
		try {

			resultList = oprtrPrfmncService.selectOprtrPrfmncList(oprtrPrfmncVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 작업자실적등록 목록 조회
	@PostMapping(value = "/am/oprtr/selectRegPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRegPrfmncList(@RequestBody OprtrPrfmncVO oprtrPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<OprtrPrfmncVO> resultList = new ArrayList<>();
		try {

			resultList = oprtrPrfmncService.selectRegPrfmncList(oprtrPrfmncVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 실적 작업자 목록 저장
	@PostMapping(value = "/am/oprtr/multiSaveOprtrPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiSaveOprtrPrfmnc(@RequestBody List<OprtrPrfmncVO> oprtrPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int savedCnt = 0;
		try {
			for (OprtrPrfmncVO oprtrPrfmncVO : oprtrPrfmncList) {
				oprtrPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				oprtrPrfmncVO.setSysFrstInptUserId(getUserId());
				oprtrPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
				oprtrPrfmncVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = oprtrPrfmncService.multiSaveOprtrPrfmnc(oprtrPrfmncList);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 실적 작업자 삭제
	@PostMapping(value = "/am/oprtr/deleteOprtrPrfmnc.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteOprtrPrfmnc(@RequestBody OprtrPrfmncVO oprtrPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int deletedCnt = 0;
		try {

			deletedCnt = oprtrPrfmncService.deleteOprtrPrfmnc(oprtrPrfmncVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}
