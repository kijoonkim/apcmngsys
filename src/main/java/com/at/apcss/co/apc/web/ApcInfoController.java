package com.at.apcss.co.apc.web;

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

import com.at.apcss.co.apc.service.ApcInfoService;
import com.at.apcss.co.apc.vo.ApcInfoVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : ApcInfoController.java
 * @Description : APC 정보관리에 대한 Controller 클래스
 * @author 신정철
 * @since 2023.07.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.07.21  신정철        최초 생성
 * </pre>
 */
@Controller
public class ApcInfoController extends BaseController{

	// APC 정보
	@Resource(name = "apcInfoService")
	private ApcInfoService apcInfoService;

	// APC 정보 조회
	/*
	@PostMapping(value = "/co/apc/selectApcInfoX.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcInfo(@RequestBody ApcInfoVO apcInfoVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		ApcInfoVO resultVO = new ApcInfoVO();
		try {
			resultVO = apcInfoService.selectApcInfo(apcInfoVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("resultVO", resultVO);

		return getSuccessResponseEntity(resultMap);
	}
	 */
	
	// APC 내역 조회
	@PostMapping(value = "/co/apc/selectApcInfoList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcInfoList(@RequestBody ApcInfoVO apcInfoVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ApcInfoVO> resultList = new ArrayList<>();
		try {
			resultList = apcInfoService.selectApcInfoList(apcInfoVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 정보관리 - APC 내역 조회
	@PostMapping(value = "/co/apc/selectApcDsctnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcDsctnList(@RequestBody ApcInfoVO apcInfoVO, HttpServletRequest request) throws Exception {
		logger.debug("selectApcDsctnList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ApcInfoVO> resultList = new ArrayList<>();
		try {
			resultList = apcInfoService.selectApcDsctnList(apcInfoVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 정보관리 - APC 내역 등록
	@PostMapping(value = "/co/apc/multiApcDsctnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiApcDsctnList(@RequestBody List<ApcInfoVO> apcDsctnList, HttpServletRequest request) throws Exception {
		logger.debug("multiApcDsctnList 호출 <><><><> ");

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ApcInfoVO> updateList = new ArrayList<ApcInfoVO>();
		try {
			for ( ApcInfoVO apcInfoVO : apcDsctnList ) {
				apcInfoVO.setSysFrstInptUserId(getUserId());
				apcInfoVO.setSysFrstInptPrgrmId(getPrgrmId());
				apcInfoVO.setSysLastChgUserId(getUserId());
				apcInfoVO.setSysLastChgPrgrmId(getPrgrmId());
				updateList.add(apcInfoVO);
			}

			HashMap<String, Object> rtnObj = apcInfoService.multiApcDsctnList(updateList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}
}
