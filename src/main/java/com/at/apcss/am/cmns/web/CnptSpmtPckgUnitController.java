package com.at.apcss.am.cmns.web;

import com.at.apcss.am.cmns.service.CnptSpmtPckgUnitService;
import com.at.apcss.am.cmns.vo.CnptSpmtPckgUnitVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : CnptSpmtPckgUnitController.java
 * @Description : 출하 상품 거래처 서비스를 정의하기 위한 Controller 구현 클래스
 * @author 김은총
 * @since 2025.09.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.09.01  김은총        최초 생성
 * </pre>
 */
@Controller
public class CnptSpmtPckgUnitController extends BaseController {

	@Resource(name= "cnptSpmtPckgUnitService")
	private CnptSpmtPckgUnitService cnptSpmtPckgUnitService;

	// 거래처별 상품 목록 조회
	@PostMapping(value = "/am/cmns/selectCnptSpmtPckgUnitList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCnptSpmtPckgUnitList(@RequestBody CnptSpmtPckgUnitVO cnptSpmtPckgUnitVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CnptSpmtPckgUnitVO> resultList = new ArrayList<>();
		try {

			resultList = cnptSpmtPckgUnitService.selectCnptSpmtPckgUnitList(cnptSpmtPckgUnitVO);

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

	// 거래처별 상품 목록 저장
	@PostMapping(value = "/am/cmns/multiSaveCnptSpmtPckgUnitList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiSaveCnptSpmtPckgUnitList(@RequestBody List<CnptSpmtPckgUnitVO> cnptSpmtPckgUnitList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int resultCnt = 0;
		try {
			for (CnptSpmtPckgUnitVO cnptSpmtPckgUnitVO : cnptSpmtPckgUnitList) {
				cnptSpmtPckgUnitVO.setSysFrstInptPrgrmId(getPrgrmId());
				cnptSpmtPckgUnitVO.setSysFrstInptUserId(getUserId());
				cnptSpmtPckgUnitVO.setSysLastChgPrgrmId(getPrgrmId());
				cnptSpmtPckgUnitVO.setSysLastChgUserId(getUserId());
			}

			resultCnt = cnptSpmtPckgUnitService.multiCnptSpmtPckgUnitList(cnptSpmtPckgUnitList);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, resultCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 거래처별 상품 목록 삭제
	@PostMapping(value = "/am/cmns/deleteCnptSpmtPckgUnit.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteCnptSpmtPckgUnit(@RequestBody CnptSpmtPckgUnitVO cnptSpmtPckgUnitVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = cnptSpmtPckgUnitService.deleteCnptSpmtPckgUnit(cnptSpmtPckgUnitVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap.put(ComConstants.PROP_DELETED_CNT, result);
		return getSuccessResponseEntity(resultMap);
	}

}
