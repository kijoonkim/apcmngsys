package com.at.apcss.am.cmns.web;

import com.at.apcss.am.cmns.service.SpmtPckgUnitCnptService;
import com.at.apcss.am.cmns.vo.SpmtPckgUnitCnptVO;
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
 * @Class Name : SpmtPckgUnitCnptController.java
 * @Description : 출하 상품 거래처 서비스를 정의하기 위한 Controller 구현 클래스
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
public class SpmtPckgUnitCnptController extends BaseController {

	@Resource(name= "spmtPckgUnitCnptService")
	private SpmtPckgUnitCnptService spmtPckgUnitCnptService;

	// 출하상품거래처 목록 조회
	@PostMapping(value = "/am/cmns/selectSpmtPckgUnitCnptList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtPckgUnitCnptList(@RequestBody SpmtPckgUnitCnptVO spmtPckgUnitCnptVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SpmtPckgUnitCnptVO> resultList = new ArrayList<>();
		try {

			resultList = spmtPckgUnitCnptService.selectSpmtPckgUnitCnptList(spmtPckgUnitCnptVO);

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

	// 출하상품거래처 저장
	@PostMapping(value = "/am/cmns/multiSaveSpmtPckgUnitCnptList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiSaveSpmtPckgUnitCnptList(@RequestBody List<SpmtPckgUnitCnptVO> spmtPckgUnitCnptList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int resultCnt = 0;
		try {
			for (SpmtPckgUnitCnptVO spmtPckgUnitCnptVO : spmtPckgUnitCnptList) {
				spmtPckgUnitCnptVO.setSysFrstInptPrgrmId(getPrgrmId());
				spmtPckgUnitCnptVO.setSysFrstInptUserId(getUserId());
				spmtPckgUnitCnptVO.setSysLastChgPrgrmId(getPrgrmId());
				spmtPckgUnitCnptVO.setSysLastChgUserId(getUserId());
			}

			resultCnt = spmtPckgUnitCnptService.multiSpmtPckgUnitCnptList(spmtPckgUnitCnptList);
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

	// 출하상품거래처 삭제
	@PostMapping(value = "/am/cmns/deleteSpmtPckgUnitCnpt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteSpmtPckgUnitCnpt(@RequestBody SpmtPckgUnitCnptVO spmtPckgUnitCnptVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			result = spmtPckgUnitCnptService.deleteSpmtPckgUnitCnpt(spmtPckgUnitCnptVO);
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
