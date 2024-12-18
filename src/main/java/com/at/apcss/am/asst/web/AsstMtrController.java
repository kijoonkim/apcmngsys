package com.at.apcss.am.asst.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.asst.service.AsstMtrService;
import com.at.apcss.am.asst.vo.AsstMtrVO;
import com.at.apcss.am.asst.vo.AsstMtrVO;
import com.at.apcss.am.sort.vo.SortFcltVO;
import com.at.apcss.am.tot.vo.TotMngVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;

/**
 * @Class Name : SortFcltController.java
 * @Description : 선별설비정보관리
 * @author 박승진
 * @since 2024.09.03
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.09.03   박승진         최초 생성
 * </pre>
 */
@Controller
public class AsstMtrController extends BaseController {

	@Resource(name = "asstMtrService")
	private AsstMtrService asstMtrService;

	@PostMapping(value = "/am/asst/insertAsstMtrCrtrInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertAsstMtrCrtrInfoList(@RequestBody List<AsstMtrVO> asstMtrVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		asstMtrVOList.forEach(item -> {
			item.setDelYn("N");
			item.setSysFrstInptUserId(getUserId());
			item.setSysFrstInptPrgrmId(getPrgrmId());
			item.setSysLastChgUserId(getUserId());
			item.setSysLastChgPrgrmId(getPrgrmId());
		});
		try {
			result = asstMtrService.insertAsstMtrCrtrInfo(asstMtrVOList);

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

	@PostMapping(value = "/am/asst/selectAsstMtrCrtrInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectAsstMtrCrtrInfoList(@RequestBody AsstMtrVO asstMtrVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<AsstMtrVO> resultList = new ArrayList<>();

		try {
			resultList = asstMtrService.selectAsstMtrCrtrInfoList(asstMtrVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);


		return getSuccessResponseEntity(resultMap);
	}


	@PostMapping(value = "/am/asst/selectBomInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectBomInfoList(@RequestBody AsstMtrVO bomVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<AsstMtrVO> resultList = new ArrayList<>();
		List<AsstMtrVO> resultList2 = new ArrayList<>();

		try {
			resultList = asstMtrService.selectBomMstrList(bomVO);
			resultList2 = asstMtrService.selectBomDtlList(bomVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("resultList1", resultList);
		resultMap.put("resultList2", resultList2);


		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/asst/insertBomInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertBomInfoList(@RequestBody List<Object> data, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		/** 집계기준 속성 VO **/
        ObjectMapper mapper = new ObjectMapper();
        AsstMtrVO bomVO = mapper.convertValue(data.get(0), AsstMtrVO.class);
        bomVO.setDelYn("N");
        bomVO.setSysFrstInptUserId(getUserId());
        bomVO.setSysFrstInptPrgrmId(getPrgrmId());
        bomVO.setSysLastChgUserId(getUserId());
        bomVO.setSysLastChgPrgrmId(getPrgrmId());

		/** 집계기준 상세 propertise VO **/
        List<Map<String,Object>> cmnsTotCrtrList = (List<Map<String, Object>>) data.get(1);
        CollectionType listType = mapper.getTypeFactory().constructCollectionType(List.class, AsstMtrVO.class);
        List<AsstMtrVO> bomVODtlList = mapper.convertValue(cmnsTotCrtrList, listType);

		try {
			bomVO.setSysFrstInptUserId(getUserId());
			bomVO.setSysFrstInptPrgrmId(getPrgrmId());
			bomVO.setSysLastChgUserId(getUserId());
			bomVO.setSysLastChgPrgrmId(getPrgrmId());
			bomVO.setDelYn("N");
			result = asstMtrService.insertBomMstrInfo(bomVO);

			bomVODtlList.forEach(item->{
				item.setSysFrstInptUserId(getUserId());
				item.setSysFrstInptPrgrmId(getPrgrmId());
				item.setSysLastChgUserId(getUserId());
				item.setSysLastChgPrgrmId(getPrgrmId());
				item.setDelYn("N");
			});
			result = asstMtrService.insertBomDtlInfo(bomVODtlList);

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

	@PostMapping(value = "/am/asst/deleteAsstMtrCrtrInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteAsstMtrCrtrInfoList(@RequestBody AsstMtrVO asstMtrVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		try {
			result = asstMtrService.deleteAsstMtrCrtrInfo(asstMtrVO);

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

	@PostMapping(value = "/am/asst/deleteBomCrtrInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteBomCrtrInfo(@RequestBody AsstMtrVO bomVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		try {
			result = asstMtrService.deleteBomCrtrInfo(bomVO);

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

	@PostMapping(value = "/am/asst/deleteBomDtlList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteBomDtlList(@RequestBody AsstMtrVO bomVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		try {
			result = asstMtrService.deleteBomDtlList(bomVO);

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

	@PostMapping(value = "/am/asst/selectBomWrhsInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectBomWrhsInfoList(@RequestBody AsstMtrVO bomVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<AsstMtrVO> resultList = new ArrayList<>();

		try {
			resultList = asstMtrService.selectBomWrhsInfoList(bomVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);



		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/asst/insertBomWrhsInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertBomWrhsInfoList(@RequestBody List<AsstMtrVO> bomVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		try {
			bomVOList.forEach(item->{
				item.setSysFrstInptUserId(getUserId());
				item.setSysFrstInptPrgrmId(getPrgrmId());
				item.setSysLastChgUserId(getUserId());
				item.setSysLastChgPrgrmId(getPrgrmId());
				item.setDelYn("N");
			});
			asstMtrService.insertBomWrhsInfoList(bomVOList);
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

	@PostMapping(value = "/am/asst/selectBomInvntrInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectBomInvntrInfoList(@RequestBody AsstMtrVO bomVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<AsstMtrVO> resultList = new ArrayList<>();

		try {
			resultList = asstMtrService.selectBomInvntrInfoList(bomVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);



		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/asst/selectBomSpmtInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectBomSpmtInfoList(@RequestBody AsstMtrVO bomVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<AsstMtrVO> resultList = new ArrayList<>();

		try {
			resultList = asstMtrService.selectBomSpmtInfoList(bomVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);



		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/asst/insertBomSpmtInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertBomSpmtInfoList(@RequestBody List<AsstMtrVO> bomVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		try {
			bomVOList.forEach(item->{
				item.setSysFrstInptUserId(getUserId());
				item.setSysFrstInptPrgrmId(getPrgrmId());
				item.setSysLastChgUserId(getUserId());
				item.setSysLastChgPrgrmId(getPrgrmId());
				item.setDelYn("N");
			});
			asstMtrService.insertBomSpmtInfoList(bomVOList);
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


}