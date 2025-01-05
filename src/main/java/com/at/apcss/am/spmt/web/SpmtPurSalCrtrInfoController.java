package com.at.apcss.am.spmt.web;

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

import com.at.apcss.am.spmt.service.SpmtPurSalCrtrInfoService;
import com.at.apcss.am.spmt.vo.SpmtPurSalCrtrInfoVO;
import com.at.apcss.am.tot.vo.TotMngVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.CollectionType;

@Controller
public class SpmtPurSalCrtrInfoController extends BaseController{
	
	@Resource(name = "spmtPurSalCrtrInfoService")
	private SpmtPurSalCrtrInfoService spmtPurSalCrtrInfoService;
	
	@PostMapping(value = "/am/spmt/insertSpmtPurCrtrInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertSpmtPurSalCrtrInfoList(@RequestBody List<Object> data, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		/** 매출기준 속성 VO **/
        ObjectMapper mapper = new ObjectMapper();
        SpmtPurSalCrtrInfoVO SpmtPurSalCrtrInfoVO = mapper.convertValue(data.get(0), SpmtPurSalCrtrInfoVO.class);
        SpmtPurSalCrtrInfoVO.setDelYn("N");
        SpmtPurSalCrtrInfoVO.setSysFrstInptUserId(getUserId());
        SpmtPurSalCrtrInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
        SpmtPurSalCrtrInfoVO.setSysLastChgUserId(getUserId());
        SpmtPurSalCrtrInfoVO.setSysLastChgPrgrmId(getPrgrmId());

		/** 매출기준 상세 propertise VO **/
        List<Map<String,Object>> cmnSlsCrtrList = (List<Map<String, Object>>) data.get(1);
        CollectionType listType = mapper.getTypeFactory().constructCollectionType(List.class, SpmtPurSalCrtrInfoVO.class);
        List<SpmtPurSalCrtrInfoVO> slsDtlVOList = mapper.convertValue(cmnSlsCrtrList, listType);

		try {
			SpmtPurSalCrtrInfoVO.setSysFrstInptUserId(getUserId());
			SpmtPurSalCrtrInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
			SpmtPurSalCrtrInfoVO.setSysLastChgUserId(getUserId());
			SpmtPurSalCrtrInfoVO.setSysLastChgPrgrmId(getPrgrmId());
			SpmtPurSalCrtrInfoVO.setDelYn("N");
			result = spmtPurSalCrtrInfoService.insertSlsCrtrInfo(SpmtPurSalCrtrInfoVO);

			slsDtlVOList.forEach(item->{
				item.setSysFrstInptUserId(getUserId());
				item.setSysFrstInptPrgrmId(getPrgrmId());
				item.setSysLastChgUserId(getUserId());
				item.setSysLastChgPrgrmId(getPrgrmId());
				item.setDelYn("N");
			});
			result = spmtPurSalCrtrInfoService.insertSlsCrtrDtlInfo(slsDtlVOList);

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

	@PostMapping(value = "/am/spmt/selectSpmtPusrSalCrtrInfoList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSpmtPusrSalCrtrInfoList(@RequestBody SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO, HttpServletRequest request) throws Exception {
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SpmtPurSalCrtrInfoVO> resultList = new ArrayList<>();
		List<SpmtPurSalCrtrInfoVO> resultList2 = new ArrayList<>();

		try {
			resultList = spmtPurSalCrtrInfoService.selectSpmtPusrSalCrtrInfoList(spmtPurSalCrtrInfoVO);
			resultList2 = spmtPurSalCrtrInfoService.selectSpmtPusrSalCrtrInfoDtlList(spmtPurSalCrtrInfoVO);
			System.out.println(resultList2);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("resultList1", resultList);
		resultMap.put("resultList2", resultList2);


		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/am/spmt/deleteSpmtPurCrtrInfo.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteSpmtPurCrtrInfo(@RequestBody SpmtPurSalCrtrInfoVO spmtPurSalCrtrInfoVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		try {

			result = spmtPurSalCrtrInfoService.deleteSpmtPurSalCrtrInfo(spmtPurSalCrtrInfoVO);

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
