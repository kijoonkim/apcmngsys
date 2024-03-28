package com.at.apcss.am.apc.web;

import java.util.HashMap;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.am.apc.vo.ApcLinkVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

@RestController
public class ApcEvrmntStngApiController extends BaseController {

	// APC 환경설정
	@Resource(name = "apcEvrmntStngService")
	private ApcEvrmntStngService apcEvrmntStngService;

	
	// APC 환경설정 - APC 정보 조회
	@GetMapping(value = "/am/apc/apcLink/{apcCd}")
	public ResponseEntity<HashMap<String, Object>> selectApcLinkById(@PathVariable String apcCd, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		if (!StringUtils.hasText(apcCd)) {
			return getErrorResponseEntity("E01", "APC코드 누락");
		}
		
		String apcKey = request.getHeader("API_KEY");
		if (!StringUtils.hasText(apcKey)) {
			return getErrorResponseEntity("E02", "인증키 누락");
		}
		
		ApcLinkVO apcLinkVO = new ApcLinkVO();
		apcLinkVO.setApcCd(apcCd);
		apcLinkVO.setApcKey(apcKey);

		ApcLinkVO resultVO = new ApcLinkVO();
		
		try {
			
			resultVO = apcEvrmntStngService.selectApcLink(apcLinkVO);
			
			if (resultVO == null 
					|| !StringUtils.hasText(resultVO.getApcCd())
					|| ComConstants.CON_YES.equals(resultVO.getDelYn())) {
				return getErrorResponseEntity("E20", "APC연계정보 없음");
			}
			
			if (!apcKey.equals(resultVO.getApcKey())) {
				return getErrorResponseEntity("E30", "인증 오류");
			}
			
			resultVO.setApcKey(null);
			apcLinkVO.setSysFrstInptUserId(ComConstants.DEFAULT_ERR_USER);
			apcLinkVO.setSysFrstInptPrgrmId(ComConstants.DEFAULT_ERR_PRGRM);
			apcLinkVO.setSysLastChgUserId(ComConstants.DEFAULT_ERR_USER);
			apcLinkVO.setSysLastChgPrgrmId(ComConstants.DEFAULT_ERR_PRGRM);
			apcEvrmntStngService.updateApcLinkIdnty(apcLinkVO);
			
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

		return getSuccessResponseEntity(resultMap);
	}
	
	// APC 환경설정 - APC 정보 조회
	@PostMapping(value = "/am/apc/linkStts")
	public ResponseEntity<HashMap<String, Object>> updateLinkStts(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		String apcKey = request.getHeader("API_KEY");
		if (!StringUtils.hasText(apcKey)) {
			return getErrorResponseEntity("E02", "인증키 누락");
		}
		
		if (!StringUtils.hasText(apcLinkVO.getApcCd())) {
			return getErrorResponseEntity("E01", "APC코드 누락");
		}
		
		apcLinkVO.setApcKey(apcKey);
		ApcLinkVO resultVO = new ApcLinkVO();
		
		try {

			resultVO = apcEvrmntStngService.selectApcLink(apcLinkVO);
			
			if (resultVO == null 
					|| !StringUtils.hasText(resultVO.getApcCd())
					|| ComConstants.CON_YES.equals(resultVO.getDelYn())) {
				return getErrorResponseEntity("E20", "APC연계정보 없음");
			}
			
			if (!apcKey.equals(resultVO.getApcKey())) {
				return getErrorResponseEntity("E30", "인증 오류");
			}
			
			apcLinkVO.setSysFrstInptUserId(ComConstants.DEFAULT_ERR_USER);
			apcLinkVO.setSysFrstInptPrgrmId(ComConstants.DEFAULT_ERR_PRGRM);
			apcLinkVO.setSysLastChgUserId(ComConstants.DEFAULT_ERR_USER);
			apcLinkVO.setSysLastChgPrgrmId(ComConstants.DEFAULT_ERR_PRGRM);
			
			HashMap<String, Object> rtnObj = apcEvrmntStngService.updateLinkStts(apcLinkVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
			
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}

}
