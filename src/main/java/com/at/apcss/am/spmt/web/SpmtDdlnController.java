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
	public ResponseEntity<HashMap<String, Object>> insertInvntrSttnOne(@RequestBody List<HashMap<String,Object>> insertList, HttpServletRequest request) throws Exception {

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

	// 재고현황1 조회
	@PostMapping(value = "/am/spmt/selectInvntrSttnOneList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectInvntrSttnOneList(@RequestBody HashMap<String,Object> ordrVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String, Object>> resultList = new ArrayList<>();
		try {
			resultList = spmtDdlnService.selectInvntrSttnOneList(ordrVO);
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

	// 재고현황2 등록
		@PostMapping(value = "/am/spmt/insertInvntrSttnTwo.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
		public ResponseEntity<HashMap<String, Object>> insertInvntrSttnTwo(@RequestBody List<HashMap<String,Object>> insertList, HttpServletRequest request) throws Exception {

			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			int insertedCnt = 0;
			try {
				for (HashMap<String,Object> spmtVO : insertList) {
					spmtVO.put("sysFrstInptUserId",getUserId());
					spmtVO.put("sysFrstInptPrgrmId",getPrgrmId());
					spmtVO.put("sysLastChgUserId",getUserId());
					spmtVO.put("sysLastChgPrgrmId",getPrgrmId());
				}
				insertedCnt = spmtDdlnService.insertInvntrSttn2(insertList);

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

		// 재고현황 2 조회
		@PostMapping(value = "/am/spmt/selectInvntrSttnTwoList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
		public ResponseEntity<HashMap<String, Object>> selectInvntrSttnTwoList(@RequestBody HashMap<String,Object> ordrVO, HttpServletRequest request) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String,Object>();
			List<HashMap<String, Object>> resultList = new ArrayList<>();
			try {
				resultList = spmtDdlnService.selectInvntrSttnTwoList(ordrVO);
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

		// 재고현황 2 조회
		@PostMapping(value = "/am/spmt/selectWrhsSttnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
		public ResponseEntity<HashMap<String, Object>> selectWrhsSttnList(@RequestBody HashMap<String,Object> ordrVO, HttpServletRequest request) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String,Object>();
			List<HashMap<String, Object>> resultList = new ArrayList<>();
			try {
				resultList = spmtDdlnService.selectWrhsSttnList(ordrVO);
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

		// 재고현황2 등록
		@PostMapping(value = "/am/spmt/insertWrhsSttn.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
		public ResponseEntity<HashMap<String, Object>> insertWrhsSttn(@RequestBody List<HashMap<String,Object>> insertList, HttpServletRequest request) throws Exception {

			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			int insertedCnt = 0;
			try {
				for (HashMap<String,Object> spmtVO : insertList) {
					spmtVO.put("sysFrstInptUserId",getUserId());
					spmtVO.put("sysFrstInptPrgrmId",getPrgrmId());
					spmtVO.put("sysLastChgUserId",getUserId());
					spmtVO.put("sysLastChgPrgrmId",getPrgrmId());
				}
				insertedCnt = spmtDdlnService.insertWrhsSttn(insertList);

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


		// 당일작업단가 삭제
		@PostMapping(value = "/am/spmt/deleteDhtyJobList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
		public ResponseEntity<HashMap<String, Object>> deleteDhtyJobList(@RequestBody HashMap<String,Object> deleteList, HttpServletRequest request) throws Exception {

			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			int insertedCnt = 0;
			try {
				insertedCnt = spmtDdlnService.deleteDhtyJobList(deleteList);
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

		// 작업내용 삭제
		@PostMapping(value = "/am/spmt/deleteJobCnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
		public ResponseEntity<HashMap<String, Object>> deleteJobCnList(@RequestBody HashMap<String,Object> deleteList, HttpServletRequest request) throws Exception {

			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			int insertedCnt = 0;
			try {
				insertedCnt = spmtDdlnService.deleteJobCnList(deleteList);
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


		// 시황분석 삭제
		@PostMapping(value = "/am/spmt/deleteMrktAnlsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
		public ResponseEntity<HashMap<String, Object>> deleteMrktAnlsList(@RequestBody HashMap<String,Object> deleteList, HttpServletRequest request) throws Exception {

			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			int insertedCnt = 0;
			try {
				insertedCnt = spmtDdlnService.deleteMrktAnlsList(deleteList);
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

		// 재고현황1 삭제
		@PostMapping(value = "/am/spmt/deleteInvntrOne.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
		public ResponseEntity<HashMap<String, Object>> deleteInvntrOne(@RequestBody HashMap<String,Object> deleteList, HttpServletRequest request) throws Exception {

			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			int insertedCnt = 0;
			try {
				insertedCnt = spmtDdlnService.deleteInvntrOne(deleteList);
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

		// 재고현황2 삭제
		@PostMapping(value = "/am/spmt/deleteInvntrTwo.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
		public ResponseEntity<HashMap<String, Object>> deleteInvntrTwo(@RequestBody HashMap<String,Object> deleteList, HttpServletRequest request) throws Exception {

			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			int insertedCnt = 0;
			try {
				insertedCnt = spmtDdlnService.deleteInvntrTwo(deleteList);
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

		// 입고현황 삭제
		@PostMapping(value = "/am/spmt/deleteWrhsSttnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
		public ResponseEntity<HashMap<String, Object>> deleteWrhsSttnList(@RequestBody HashMap<String,Object> deleteList, HttpServletRequest request) throws Exception {

			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			int insertedCnt = 0;
			try {
				insertedCnt = spmtDdlnService.deleteWrhsSttnList(deleteList);
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
