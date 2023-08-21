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

import com.at.apcss.am.cmns.service.SpmtSlsUntprcRegService;
import com.at.apcss.am.cmns.vo.SpmtSlsUntprcRegVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SpmtSlsUntprcRegController.java
 * @Description : 출하 매출 단가 서비스를 정의하기 위한 Controller 구현 클래스
 * @author 김호
 * @since 2023.08.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.01  김호        최초 생성
 * </pre>
 */
@Controller
public class SpmtSlsUntprcRegController extends BaseController {

	@Resource(name= "spmtSlsUntprcRegService")
	private SpmtSlsUntprcRegService spmtSlsUntprcRegService;

	@PostMapping(value = "/am/cmns/selectSpmtSlsUntprcRegList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtSlsUntprcRegList(@RequestBody SpmtSlsUntprcRegVO spmtSlsUntprcRegVO, HttpServletRequest request) throws Exception {
		logger.debug("selectSpmtSlsUntprcRegList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SpmtSlsUntprcRegVO> resultList = new ArrayList<>();
		try {

			resultList = spmtSlsUntprcRegService.selectSpmtSlsUntprcRegList(spmtSlsUntprcRegVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/insertSpmtSlsUntprcRegList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSpmtSlsUntprcRegList(@RequestBody List<SpmtSlsUntprcRegVO> spmtSlsUntprcRegList, HttpServletRequest request) throws Exception {
		logger.debug("selectSpmtSlsUntprcRegList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int insertedCnt = 0;
		try {
			for (SpmtSlsUntprcRegVO spmtSlsUntprcRegVO : spmtSlsUntprcRegList) {
				spmtSlsUntprcRegVO.setSysFrstInptPrgrmId(getPrgrmId());
				spmtSlsUntprcRegVO.setSysFrstInptUserId(getUserId());
				spmtSlsUntprcRegVO.setSysLastChgPrgrmId(getPrgrmId());
				spmtSlsUntprcRegVO.setSysLastChgUserId(getUserId());
				spmtSlsUntprcRegVO.setSpmtSlsUntprcCd(spmtSlsUntprcRegService.getSpmtSlsUntprcCd(spmtSlsUntprcRegVO).getSpmtSlsUntprcCd());
				insertedCnt += spmtSlsUntprcRegService.insertSpmtSlsUntprcReg(spmtSlsUntprcRegVO);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/updateSpmtSlsUntprcRegList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateSpmtSlsUntprcRegList(@RequestBody List<SpmtSlsUntprcRegVO> spmtSlsUntprcRegList, HttpServletRequest request) throws Exception {
		logger.debug("updateSpmtSlsUntprcRegList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int updatedCnt = 0;
		try {
			for (SpmtSlsUntprcRegVO spmtSlsUntprcRegVO : spmtSlsUntprcRegList) {
				spmtSlsUntprcRegVO.setSysLastChgPrgrmId(getPrgrmId());
				spmtSlsUntprcRegVO.setSysLastChgUserId(getUserId());
				updatedCnt += spmtSlsUntprcRegService.updateSpmtSlsUntprcReg(spmtSlsUntprcRegVO);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/deleteSpmtSlsUntprcReg.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteSpmtSlsUntprcReg(@RequestBody SpmtSlsUntprcRegVO spmtSlsUntprcRegVO, HttpServletRequest request) throws Exception {
		logger.debug("deleteSpmtSlsUntprcReg 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int deletedCnt = 0;
		try {
			deletedCnt += spmtSlsUntprcRegService.deleteSpmtSlsUntprcReg(spmtSlsUntprcRegVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}
