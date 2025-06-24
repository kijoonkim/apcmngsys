package com.at.apcss.am.apc.web;

import com.at.apcss.am.apc.service.ApcEvrmntStngService;
import com.at.apcss.am.apc.service.ApcLinkService;
import com.at.apcss.am.apc.vo.ApcEvrmntStngVO;
import com.at.apcss.am.apc.vo.ApcLinkVO;
import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
public class ApcEvrmntStngApiController extends BaseController {

	// APC 환경설정
	@Resource(name = "apcEvrmntStngService")
	private ApcEvrmntStngService apcEvrmntStngService;

    @Resource(name = "apcLinkService")
    private ApcLinkService apcLinkService;

	
	// APC 환경설정 - APC 정보 조회
	//@GetMapping(value = "/am/apc/apcLink/{apcCd}")
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
	//@PostMapping(value = "/am/apc/linkStts")
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

	// APC 환경설정 - 모바일 APC 정보 조회
	@PostMapping(value = "/api/mobile/am/apc/selectApcEvrmntStng.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcEvrmntStngs(@RequestBody ApcEvrmntStngVO apcEvrmntStngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		ApcEvrmntStngVO resultVO = new ApcEvrmntStngVO();
		try {
			resultVO = apcEvrmntStngService.selectApcEvrmntStng(apcEvrmntStngVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put("resultVO", resultVO);
		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

		return getSuccessResponseEntity(resultMap);
	}

    // APC 연계기기 조회
    @PostMapping(value = "/api/mobile/am/apc/selectApcLinkTrsmMatSttsList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectApcLinkTrsmMatSttsList(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        List<ApcLinkVO> resultList = new ArrayList<>();

        try {
            resultList = apcLinkService.selectApcLinkTrsmMatSttsList(apcLinkVO);
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

    // APC 연계기기 상태 update : 요청
    @PostMapping(value = "/api/mobile/am/apc/updateLinkTrsmReq.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> updateLinkTrsmReq(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            apcLinkVO.setLinkStts(AmConstants.CON_LINK_STTS_REQ_DONE);

            HashMap<String, Object> rtnObj = apcLinkService.updateLinkTrsmMatStts(apcLinkVO);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch(Exception e) {
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        return getSuccessResponseEntity(resultMap);
    }

    // APC 연계기기 상태 update : 취소
    @PostMapping(value = "/api/mobile/am/apc/updateLinkTrsmReqCncl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> updateLinkTrsmReqCncl(@RequestBody ApcLinkVO apcLinkVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            apcLinkVO.setLinkStts(AmConstants.CON_LINK_STTS_REQ_CNCL);

            HashMap<String, Object> rtnObj = apcLinkService.updateLinkTrsmMatStts(apcLinkVO);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch(Exception e) {
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        return getSuccessResponseEntity(resultMap);
    }
}
