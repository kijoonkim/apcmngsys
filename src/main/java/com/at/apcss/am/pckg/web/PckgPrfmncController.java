package com.at.apcss.am.pckg.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.pckg.service.PckgPrfmncService;
import com.at.apcss.am.pckg.vo.PckgPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : PckgPrfmncController.java
 * @Description : 포장실적에 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.22  김현호        최초 생성
 * </pre>
 */
@Controller
public class PckgPrfmncController extends BaseController {

	@Resource(name = "pckgPrfmncService")
	private PckgPrfmncService pckgPrfmncService;


	@PostMapping(value = "/am/pckg/selectPckgPrfmnc.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectPckgPrfmncList(@RequestBody PckgPrfmncVO pckgPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<PckgPrfmncVO> resultList = new ArrayList<>();

		try {
			resultList = pckgPrfmncService.selectPckgPrfmncList(pckgPrfmncVO);
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
	@PostMapping(value = "/am/pckg/prfmnc/insertPckgPrfmncSc.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertPckgPrfmncSc(@RequestBody Map<String, Object> param, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int resultCnt = 0;
		try {
			param.put("userId",getUserId());
			param.put("prgrmId",getPrgrmId());
			resultCnt = pckgPrfmncService.insertPckgPrfmncSc(param);
		} catch(Exception e) {
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
	@PostMapping(value = "/am/pckg/prfmnc/deletePckgPrfmncSc.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deletePckgPrfmncSc(@RequestBody PckgPrfmncVO pckgPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int resultCnt = 0;
		try {
			pckgPrfmncVO.setSysLastChgUserId(getUserId());
			pckgPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			resultMap = pckgPrfmncService.deletePckgPrfmnc(pckgPrfmncVO);
			if(resultMap != null){
				new EgovBizException();
			}else{
				resultCnt = 1;
			}
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap = new HashMap<>();
		resultMap.put(ComConstants.PROP_INSERTED_CNT, resultCnt);

		return getSuccessResponseEntity(resultMap);
	}
}
