package com.at.apcss.am.cmns.web;

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

import com.at.apcss.am.cmns.service.CnptService;
import com.at.apcss.am.cmns.vo.CnptLgszMrktVO;
import com.at.apcss.am.cmns.vo.CnptVO;
import com.at.apcss.am.cmns.vo.LgszMrktVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : CnptController.java
 * @Description : 거래처 정보관리에 대한 Controller 클래스
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
public class CnptController extends BaseController {

	@Resource(name = "cnptService")
	private CnptService cnptService;


	// APC 환경설정 - 입고차량정보 목록 조회
	@PostMapping(value = "/am/cmns/selectCnptList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCnptList(@RequestBody CnptVO cnptVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CnptVO> resultList = new ArrayList<>();
		try {

			resultList = cnptService.selectCnptList(cnptVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/multiCnptLgszMrktList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiCnptLgszMrktList(@RequestBody List<CnptLgszMrktVO> saveVOList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		List<CnptVO> cnptList = saveVOList.get(0).getCnptList();
		List<LgszMrktVO> LgszMrktList = saveVOList.get(0).getLgszMrktList();

		try {

			for (LgszMrktVO lgszMrktVO : LgszMrktList) {
				lgszMrktVO.setSysFrstInptPrgrmId(getPrgrmId());
				lgszMrktVO.setSysFrstInptUserId(getUserId());
				lgszMrktVO.setSysLastChgPrgrmId(getPrgrmId());
				lgszMrktVO.setSysLastChgUserId(getUserId());
			}

			for (CnptVO cnptVO : cnptList) {
				cnptVO.setSysFrstInptPrgrmId(getPrgrmId());
				cnptVO.setSysFrstInptUserId(getUserId());
				cnptVO.setSysLastChgPrgrmId(getPrgrmId());
				cnptVO.setSysLastChgUserId(getUserId());
			}

			HashMap<String, Object> rtnObj = cnptService.multiCnptLgszMrktList(cnptList, LgszMrktList);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}


		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/updateCnptList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateComCdDtlList(@RequestBody List<CnptVO> updateList, HttpServletRequest request) throws Exception {

		int updatedCnt = 0;
		try {
			for (CnptVO cnptVO : updateList) {
				cnptVO.setSysLastChgPrgrmId(getPrgrmId());
				cnptVO.setSysLastChgUserId(getUserId());
				updatedCnt += cnptService.updateCnpt(cnptVO);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/deleteCnpt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteCnpt(@RequestBody CnptVO cnptVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			HashMap<String, Object> rtnObj = cnptService.deleteCnpt(cnptVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/selectLgszMrktList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectLgszMrktList(@RequestBody LgszMrktVO lgszMrktVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<LgszMrktVO> resultList = new ArrayList<>();
		try {

			resultList = cnptService.selectLgszMrktList(lgszMrktVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/am/cmns/updateLgszMrktList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateLgszMrktList(@RequestBody List<LgszMrktVO> updateList, HttpServletRequest request) throws Exception {
		int updatedCnt = 0;
		try {
			for (LgszMrktVO lgszMrktVO : updateList) {
				lgszMrktVO.setSysLastChgPrgrmId(getPrgrmId());
				lgszMrktVO.setSysLastChgUserId(getUserId());
				updatedCnt += cnptService.updateLgszMrkt(lgszMrktVO);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		return getSuccessResponseEntity(resultMap);
	}

}
