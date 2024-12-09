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
import com.at.apcss.am.sort.vo.SortFcltVO;
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
	public ResponseEntity<HashMap<String, Object>> insertAsstMtrCrtrInfoList(@RequestBody List<Object> data, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		/** 선별설비 속성 VO **/
        ObjectMapper mapper = new ObjectMapper();
        AsstMtrVO asstMtrVO = mapper.convertValue(data.get(0), AsstMtrVO.class);
        asstMtrVO.setDelYn("N");
        asstMtrVO.setSysFrstInptUserId(getUserId());
        asstMtrVO.setSysFrstInptPrgrmId(getPrgrmId());
        asstMtrVO.setSysLastChgUserId(getUserId());
        asstMtrVO.setSysLastChgPrgrmId(getPrgrmId());

		/** 계량설비 상세 propertise VO **/
        List<Map<String,Object>> cmnsFcltAtrbList = (List<Map<String, Object>>) data.get(1);
        CollectionType listType = mapper.getTypeFactory().constructCollectionType(List.class, AsstMtrVO.class);
        List<AsstMtrVO> asstMtrDtlVOList = mapper.convertValue(cmnsFcltAtrbList, listType);

		try {
			asstMtrVO.setSysFrstInptUserId(getUserId());
			asstMtrVO.setSysFrstInptPrgrmId(getPrgrmId());
			asstMtrVO.setSysLastChgUserId(getUserId());
			asstMtrVO.setSysLastChgPrgrmId(getPrgrmId());
			asstMtrVO.setDelYn("N");
			result = asstMtrService.insertAsstMtrCrtrInfo(asstMtrVO);

			asstMtrDtlVOList.forEach(item->{
				item.setSysFrstInptUserId(getUserId());
				item.setSysFrstInptPrgrmId(getPrgrmId());
				item.setSysLastChgUserId(getUserId());
				item.setSysLastChgPrgrmId(getPrgrmId());
				item.setDelYn("N");
			});
			result = asstMtrService.insertAsstMtrCrtrDtlInfo(asstMtrDtlVOList);

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
		List<AsstMtrVO> resultList2 = new ArrayList<>();

		try {
			resultList = asstMtrService.selectAsstMtrCrtrInfoList(asstMtrVO);
			resultList2 = asstMtrService.selectAsstMtrCrtrInfoDtlList(asstMtrVO);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("resultList1", resultList);
		resultMap.put("resultList2", resultList2);


		return getSuccessResponseEntity(resultMap);
	}


}