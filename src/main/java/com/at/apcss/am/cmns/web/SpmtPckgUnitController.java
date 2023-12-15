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

import com.at.apcss.am.cmns.service.SpmtPckgUnitService;
import com.at.apcss.am.cmns.vo.SpmtPckgUnitVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
/**
 * @Class Name : SpmtPckgUnitController.java
 * @Description : 출하포장단위 서비스를 정의하기 위한 Controller 구현 클래스
 * @author 김호
 * @since 2023.07.31
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.31  김호        최초 생성
 * </pre>
 */
@Controller
public class SpmtPckgUnitController extends BaseController{

	@Resource(name= "spmtPckgUnitService")
	private SpmtPckgUnitService spmtPckgUnitService;


	// 품목별 출하포장단위 목록 조회
	@PostMapping(value = "/am/cmns/selectSpmtPckgUnitList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtPckgUnitList(@RequestBody SpmtPckgUnitVO spmtPckgUnitVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SpmtPckgUnitVO> resultList = new ArrayList<>();
		try {

			resultList = spmtPckgUnitService.selectSpmtPckgUnitList(spmtPckgUnitVO);

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

	// 출하포장단위 저장
	@PostMapping(value = "/am/cmns/multiSaveSpmtPckgUnitList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiSaveSpmtPckgUnitList(@RequestBody List<SpmtPckgUnitVO> spmtPckgUnitList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int insertedCnt = 0;
		try {
			for (SpmtPckgUnitVO spmtPckgUnitVO : spmtPckgUnitList) {
				spmtPckgUnitVO.setSysFrstInptPrgrmId(getPrgrmId());
				spmtPckgUnitVO.setSysFrstInptUserId(getUserId());
				spmtPckgUnitVO.setSysLastChgPrgrmId(getPrgrmId());
				spmtPckgUnitVO.setSysLastChgUserId(getUserId());
			}

			HashMap<String, Object> rtnObj = spmtPckgUnitService.multiSaveSpmtPckgUnitList(spmtPckgUnitList);
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

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	// 출하포장단위 삭제
	@PostMapping(value = "/am/cmns/deleteSpmtPckgUnit.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteSpmtPckgUnit(@RequestBody SpmtPckgUnitVO spmtPckgUnitVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			HashMap<String, Object> rtnObj = spmtPckgUnitService.deleteSpmtPckgUnit(spmtPckgUnitVO);
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
}
