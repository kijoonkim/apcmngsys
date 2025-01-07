package com.at.apcss.am.tot.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.at.apcss.am.clcln.vo.ClclnMngVO;
import com.at.apcss.am.tot.vo.TotCrtrVO;
import com.at.apcss.am.tot.vo.TotRsltVO;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.tot.service.TotMngService;
import com.at.apcss.am.tot.vo.TotMngVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;

/**
 * @Class Name : totController.java
 * @Description : 집계정보관리
 * @author 박승진
 * @since 2024.10.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.10.23   박승진         최초 생성
 * </pre>
 */
@Controller
public class TotMngController extends BaseController {

	@Resource(name = "totMngService")
	private TotMngService totMngService;




	@PostMapping(value = "/am/tot/selectCrtrList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCrtrList(@RequestBody TotCrtrVO totCrtrVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<TotCrtrVO> resultList = new ArrayList<>();

		try {
			resultList = totMngService.selectCrtrList(totCrtrVO);
		} catch(Exception e) {
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

	@PostMapping(value = "/am/tot/selectCrtrDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectCrtrDtlList(@RequestBody TotCrtrVO totCrtrVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<TotCrtrVO> resultList = new ArrayList<>();

		try {
			resultList = totMngService.selectCrtrDtlList(totCrtrVO);
		} catch(Exception e) {
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


	// 집계기준 등록
	@PostMapping(value = "/am/tot/insertCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertCrtr(@RequestBody TotMngVO totMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			totMngVO.setSysFrstInptUserId(getUserId());
			totMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			totMngVO.setSysLastChgUserId(getUserId());
			totMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = totMngService.insertCrtr(totMngVO);
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


	// 집계기준 삭제
	@PostMapping(value = "/am/tot/deleteCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteCrtr(@RequestBody TotMngVO totMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			totMngVO.setSysFrstInptUserId(getUserId());
			totMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			totMngVO.setSysLastChgUserId(getUserId());
			totMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = totMngService.deleteCrtr(totMngVO);
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


	// 집계기준 상세 등록
	@PostMapping(value = "/am/tot/insertCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertCrtrDtl(@RequestBody TotMngVO totMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			totMngVO.setSysFrstInptUserId(getUserId());
			totMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			totMngVO.setSysLastChgUserId(getUserId());
			totMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = totMngService.insertCrtrDtl(totMngVO);
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


	// 집계기준 상세 삭제
	@PostMapping(value = "/am/tot/deleteCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteCrtrDtl(@RequestBody TotMngVO totMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			totMngVO.setSysFrstInptUserId(getUserId());
			totMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			totMngVO.setSysLastChgUserId(getUserId());
			totMngVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = totMngService.deleteCrtrDtl(totMngVO);
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

	@PostMapping(value = "/am/tot/selectTotRsltTermList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectTotRsltTermList(@RequestBody TotRsltVO totRsltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<TotRsltVO> resultList = new ArrayList<>();

		try {
			resultList = totMngService.selectTotRsltTermList(totRsltVO);
		} catch(Exception e) {
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

	@PostMapping(value = "/am/tot/selectTotRawMtrWrhsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectTotRawMtrWrhsList(@RequestBody TotRsltVO totRsltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<TotRsltVO> resultList = new ArrayList<>();

		try {
			resultList = totMngService.selectTotRawMtrWrhsList(totRsltVO);
		} catch(Exception e) {
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

	@PostMapping(value = "/am/tot/selectTotSortPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectTotSortPrfmncList(@RequestBody TotRsltVO totRsltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<TotRsltVO> resultList = new ArrayList<>();

		try {
			resultList = totMngService.selectTotSortPrfmncList(totRsltVO);
		} catch(Exception e) {
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


	@PostMapping(value = "/am/tot/selectTotPckgPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectTotPckgPrfmncList(@RequestBody TotRsltVO totRsltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<TotRsltVO> resultList = new ArrayList<>();

		try {
			resultList = totMngService.selectTotPckgPrfmncList(totRsltVO);
		} catch(Exception e) {
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

	@PostMapping(value = "/am/tot/selectTotSpmtPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectTotSpmtPrfmncList(@RequestBody TotRsltVO totRsltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<TotRsltVO> resultList = new ArrayList<>();

		try {
			resultList = totMngService.selectTotSpmtPrfmncList(totRsltVO);
		} catch(Exception e) {
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

	@PostMapping(value = "/am/tot/selectTotRawMtrInvntrList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectTotRawMtrInvntrList(@RequestBody TotRsltVO totRsltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<TotRsltVO> resultList = new ArrayList<>();

		try {
			resultList = totMngService.selectTotRawMtrInvntrList(totRsltVO);
		} catch(Exception e) {
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

	@PostMapping(value = "/am/tot/selectTotSortInvntrList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectTotSortInvntrList(@RequestBody TotRsltVO totRsltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<TotRsltVO> resultList = new ArrayList<>();

		try {
			resultList = totMngService.selectTotSortInvntrList(totRsltVO);
		} catch(Exception e) {
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

	@PostMapping(value = "/am/tot/selectTotGdsInvntrList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectTotGdsInvntrList(@RequestBody TotRsltVO totRsltVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<TotRsltVO> resultList = new ArrayList<>();

		try {
			resultList = totMngService.selectTotGdsInvntrList(totRsltVO);
		} catch(Exception e) {
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



	@PostMapping(value = "/am/tot/insertTotCrtrInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertAsstMtrCrtrInfoList(@RequestBody List<Object> data, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		/** 집계기준 속성 VO **/
        ObjectMapper mapper = new ObjectMapper();
        TotMngVO totMngVO = mapper.convertValue(data.get(0), TotMngVO.class);
        totMngVO.setDelYn("N");
        totMngVO.setSysFrstInptUserId(getUserId());
        totMngVO.setSysFrstInptPrgrmId(getPrgrmId());
        totMngVO.setSysLastChgUserId(getUserId());
        totMngVO.setSysLastChgPrgrmId(getPrgrmId());

		/** 집계기준 상세 propertise VO **/
        List<Map<String,Object>> cmnsTotCrtrList = (List<Map<String, Object>>) data.get(1);
        CollectionType listType = mapper.getTypeFactory().constructCollectionType(List.class, TotMngVO.class);
        List<TotMngVO> totMngDtlVOList = mapper.convertValue(cmnsTotCrtrList, listType);

		try {
			totMngVO.setSysFrstInptUserId(getUserId());
			totMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			totMngVO.setSysLastChgUserId(getUserId());
			totMngVO.setSysLastChgPrgrmId(getPrgrmId());
			totMngVO.setDelYn("N");
			result = totMngService.insertTotCrtrInfo(totMngVO);

			totMngDtlVOList.forEach(item->{
				item.setSysFrstInptUserId(getUserId());
				item.setSysFrstInptPrgrmId(getPrgrmId());
				item.setSysLastChgUserId(getUserId());
				item.setSysLastChgPrgrmId(getPrgrmId());
				item.setDelYn("N");
			});
			result = totMngService.insertTotCrtrDtlInfo(totMngDtlVOList);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, result);

		return getSuccessResponseEntity(resultMap);

	}

	@PostMapping(value = "/am/tot/selectTotCrtrInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectTotCrtrInfoList(@RequestBody TotMngVO TotMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<TotMngVO> resultList = new ArrayList<>();
		List<TotMngVO> resultList2 = new ArrayList<>();

		try {
			resultList = totMngService.selectTotCrtrInfoList(TotMngVO);
			resultList2 = totMngService.selectTotCrtrInfoDtlList(TotMngVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("resultList1", resultList);
		resultMap.put("resultList2", resultList2);


		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/tot/selectTotCrtrInfoDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectTotCrtrInfoDtlList(@RequestBody TotMngVO TotMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<TotMngVO> resultList = new ArrayList<>();

		try {
			resultList = totMngService.selectTotCrtrInfoDtlList(TotMngVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);


		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/tot/deleteTotMngInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteTotMngInfo(@RequestBody TotMngVO totMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		try {

			result = totMngService.deleteTotCrtrInfo(totMngVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, result);

		return getSuccessResponseEntity(resultMap);

	}

	@PostMapping(value = "/am/tot/selectGdsInvntrTotInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectGdsInvntrTotInfo(@RequestBody HashMap<String,Object> totMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> result = new ArrayList<>();
		try {

			result = totMngService.selectGdsInvntrTotInfo(totMngVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);

	}



	@PostMapping(value = "/am/tot/selectSpmtPrfmncTotInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSpmtPrfmncTotInfo(@RequestBody HashMap<String,Object> totMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> result = new ArrayList<>();
		try {

			result = totMngService.selectSpmtPrfmncTotInfo(totMngVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);

	}

	@PostMapping(value = "/am/tot/selectPckgPrfmncTotInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPckgPrfmncTotInfo(@RequestBody HashMap<String,Object> totMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> result = new ArrayList<>();
		try {

			result = totMngService.selectPckgPrfmncTotInfo(totMngVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);

	}

	@PostMapping(value = "/am/tot/selectRawMtrInvntrTotInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawMtrInvntrTotInfo(@RequestBody HashMap<String,Object> totMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> result = new ArrayList<>();
		try {

			result = totMngService.selectRawMtrInvntrTotInfo(totMngVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);

	}

	@PostMapping(value = "/am/tot/selectRawMtrWrhsTotInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectRawMtrWrhsTotInfo(@RequestBody HashMap<String,Object> totMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> result = new ArrayList<>();
		try {

			result = totMngService.selectRawMtrWrhsTotInfo(totMngVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);

	}

	@PostMapping(value = "/am/tot/selectSortInvntrTotInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortInvntrTotInfo(@RequestBody HashMap<String,Object> totMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> result = new ArrayList<>();
		try {

			result = totMngService.selectSortInvntrTotInfo(totMngVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);

	}

	@PostMapping(value = "/am/tot/selectSortPrfmncTotInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortPrfmncTotInfo(@RequestBody HashMap<String,Object> totMngVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<HashMap<String,Object>> result = new ArrayList<>();
		try {

			result = totMngService.selectSortPrfmncTotInfo(totMngVO);

		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, result);

		return getSuccessResponseEntity(resultMap);

	}


}