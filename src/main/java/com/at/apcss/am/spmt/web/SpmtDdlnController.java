package com.at.apcss.am.spmt.web;

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

import com.at.apcss.am.spmt.service.SpmtDdlnService;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SpmtDdlnController.java
 * @Description : 생산속보에 대한 Controller 클래스
 * @author 박승진
 * @since 2024.11.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.11.20  박승진        최초 생성
 * </pre>
 */
@Controller
public class SpmtDdlnController extends BaseController {

	// 생산속보
	@Resource(name = "spmtDdlnService")
	private SpmtDdlnService spmtDdlnService;

	// 당일작업단가 리스트 조회
	@PostMapping(value = "/am/spmt/selectDhtyJobList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectDhtyJobList(@RequestBody HashMap<String,Object> ordrVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String, Object>> resultList = new ArrayList<>();
		try {
			resultList = spmtDdlnService.selectDhtyJobList(ordrVO);
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





	// 당일작업단가 등록
	@PostMapping(value = "/am/spmt/insertDhtyJob.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertDhtyJob(@RequestBody List<HashMap<String,Object>> insertList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int insertedCnt = 0;
		try {

			for (HashMap<String,Object> spmtVO : insertList) {
				spmtVO.put("sysFrstInptUserId",getUserId());
				spmtVO.put("sysFrstInptPrgrmId",getPrgrmId());
				spmtVO.put("sysLastChgUserId",getUserId());
				spmtVO.put("sysLastChgPrgrmId",getPrgrmId());
			}

			insertedCnt = spmtDdlnService.insertDhtyJobList(insertList);

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

	// 작업내용 리스트 조회
	@PostMapping(value = "/am/spmt/selectJobCnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectJobCnList(@RequestBody HashMap<String,Object> ordrVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String, Object>> resultList = new ArrayList<>();
		try {
			resultList = spmtDdlnService.selectJobCnList(ordrVO);
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


	// 작업내용 등록
	@PostMapping(value = "/am/spmt/insertJobCn.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertJobCn(@RequestBody List<HashMap<String,Object>> insertList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int insertedCnt = 0;
		try {

			for (HashMap<String,Object> spmtVO : insertList) {
				spmtVO.put("sysFrstInptUserId",getUserId());
				spmtVO.put("sysFrstInptPrgrmId",getPrgrmId());
				spmtVO.put("sysLastChgUserId",getUserId());
				spmtVO.put("sysLastChgPrgrmId",getPrgrmId());
			}

			insertedCnt = spmtDdlnService.insertJobCnList(insertList);

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
	// 작업내용 리스트 조회
		@PostMapping(value = "/am/spmt/selectMrktAnlsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
		public ResponseEntity<HashMap<String, Object>> selectMrktAnlsList(@RequestBody HashMap<String,Object> ordrVO, HttpServletRequest request) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String,Object>();
			List<HashMap<String, Object>> resultList = new ArrayList<>();
			try {
				resultList = spmtDdlnService.selectMrktAnlsList(ordrVO);
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


	// 시황분석 등록
	@PostMapping(value = "/am/spmt/insertMrktAnls.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertMrktAnls(@RequestBody List<HashMap<String,Object>> insertList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int insertedCnt = 0;
		try {

			for (HashMap<String,Object> spmtVO : insertList) {
				spmtVO.put("sysFrstInptUserId",getUserId());
				spmtVO.put("sysFrstInptPrgrmId",getPrgrmId());
				spmtVO.put("sysLastChgUserId",getUserId());
				spmtVO.put("sysLastChgPrgrmId",getPrgrmId());
			}

			insertedCnt = spmtDdlnService.insertMrktAnlsList(insertList);

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

	// 재고현황1 등록
		@PostMapping(value = "/am/spmt/insertInvntrSttnOne.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
		public ResponseEntity<HashMap<String, Object>> invntrSttn1Save(@RequestBody List<HashMap<String,Object>> insertList, HttpServletRequest request) throws Exception {

			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			int insertedCnt = 0;
			try {
				for (HashMap<String,Object> spmtVO : insertList) {
					spmtVO.put("sysFrstInptUserId",getUserId());
					spmtVO.put("sysFrstInptPrgrmId",getPrgrmId());
					spmtVO.put("sysLastChgUserId",getUserId());
					spmtVO.put("sysLastChgPrgrmId",getPrgrmId());
				}
				insertedCnt = spmtDdlnService.insertInvntrSttn1(insertList);

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


}
