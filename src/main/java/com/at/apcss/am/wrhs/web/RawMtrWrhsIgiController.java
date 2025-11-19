package com.at.apcss.am.wrhs.web;


import com.at.apcss.am.wrhs.service.FrmerInfoService;
import com.at.apcss.am.wrhs.service.RawMtrHrPrfmncService;
import com.at.apcss.am.wrhs.service.RawMtrWrhsIgiService;
import com.at.apcss.am.wrhs.vo.CltvtnHstryVO;
import com.at.apcss.am.wrhs.vo.RawMtrHrPrfmncDtlVO;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsIgiVO;
import com.at.apcss.am.wrhs.vo.SdlngVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @Class Name : RawMtrWrhsIgiController.java
 * @Description : 검수 대한 Controller 클래스
 * @author 김호
 * @since 2025.07.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.07.10  김호        최초 생성
 * </pre>
 */
@Controller
public class RawMtrWrhsIgiController extends BaseController {
	
	@Resource(name = "rawMtrWrhsIgiService")
	private RawMtrWrhsIgiService rawMtrWrhsIgiService;

	@Resource(name = "frmerInfoService")
	private FrmerInfoService frmerInfoService;

	@Resource(name = "rawMtrHrPrfmncService")
	private RawMtrHrPrfmncService rawMtrHrPrfmncService;

	@PostMapping(value = "/am/wrhs/selectRawMtrWrhsIgiList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectRawMtrWrhsIgiList(@RequestBody RawMtrWrhsIgiVO rawMtrWrhsIgiVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		List<RawMtrWrhsIgiVO> resultList;
		try {
			resultList = rawMtrWrhsIgiService.selectRawMtrWrhsIgiList(rawMtrWrhsIgiVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
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

	@PostMapping(value = "/am/wrhs/multiRawMtrWrhsIgiList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> multiRawMtrWrhsIgiList(@RequestBody List<RawMtrWrhsIgiVO> rawMtrWrhsIgiList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for (RawMtrWrhsIgiVO rawMtrWrhsIgiVO : rawMtrWrhsIgiList) {

				rawMtrWrhsIgiVO.setSysFrstInptUserId(getUserId());
				rawMtrWrhsIgiVO.setSysFrstInptPrgrmId(getPrgrmId());
				rawMtrWrhsIgiVO.setSysLastChgUserId(getUserId());
				rawMtrWrhsIgiVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = rawMtrWrhsIgiService.multiRawMtrWrhsIgiList(rawMtrWrhsIgiList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch (EgovBizException e) {
			return getErrorResponseEntity(e);
		} catch (Exception e) {
			logger.error("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/wrhs/deleteRawMtrWrhsIgi.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteRawMtrWrhsIgi(@RequestBody RawMtrWrhsIgiVO rawMtrWrhsIgiVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			rawMtrWrhsIgiVO.setSysFrstInptUserId(getUserId());
			rawMtrWrhsIgiVO.setSysFrstInptPrgrmId(getPrgrmId());
			rawMtrWrhsIgiVO.setSysLastChgUserId(getUserId());
			rawMtrWrhsIgiVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = rawMtrWrhsIgiService.deleteRawMtrWrhsIgi(rawMtrWrhsIgiVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch (EgovBizException e) {
			return getErrorResponseEntity(e);
		} catch (Exception e) {
			logger.error("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/wrhs/selectPrchsSttn.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectPrchsSttn(@RequestBody RawMtrWrhsIgiVO rawMtrWrhsIgiVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		List<RawMtrWrhsIgiVO> resultList;
		List<RawMtrWrhsIgiVO> resultList1;
		List<CltvtnHstryVO> resultList2;
		RawMtrWrhsIgiVO result;
		List<RawMtrWrhsIgiVO> resultList3;
		List<RawMtrHrPrfmncDtlVO> resultList4;
		try {
			resultList = rawMtrWrhsIgiService.selectRawMtrWrhsIgiList(rawMtrWrhsIgiVO);
			resultList1 = rawMtrWrhsIgiService.selectRawMtrWrhsIgiTot(rawMtrWrhsIgiVO);
			result = rawMtrWrhsIgiService.selectPrschsPrdcrInfo(rawMtrWrhsIgiVO);
			resultList3 = rawMtrWrhsIgiService.selectRawMtrWghPrmncTotList(rawMtrWrhsIgiVO);

			CltvtnHstryVO cltvtnHstryVO = new CltvtnHstryVO();
			cltvtnHstryVO.setApcCd(rawMtrWrhsIgiVO.getApcCd());
			cltvtnHstryVO.setYr(rawMtrWrhsIgiVO.getIgiYr());
			cltvtnHstryVO.setItemCd(rawMtrWrhsIgiVO.getItemCd());
			cltvtnHstryVO.setPrdcrCd(result.getPrdcrCd());

			resultList2 = frmerInfoService.selectCltvtnHstryList(cltvtnHstryVO);

			RawMtrHrPrfmncDtlVO rawMtrHrPrfmncDtlVO = new RawMtrHrPrfmncDtlVO();
			rawMtrHrPrfmncDtlVO.setWrhsYmd(rawMtrWrhsIgiVO.getIgiYmd());
			rawMtrHrPrfmncDtlVO.setApcCd(rawMtrWrhsIgiVO.getApcCd());
			resultList4 = rawMtrHrPrfmncService.selectRawMtrHrPrfmncTot(rawMtrHrPrfmncDtlVO);

		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		resultMap.put(ComConstants.PROP_RESULT_LIST_1, resultList1);
		resultMap.put(ComConstants.PROP_RESULT_LIST_2, resultList2);
		resultMap.put(ComConstants.PROP_RESULT_LIST_3, resultList3);
		resultMap.put(ComConstants.PROP_RESULT_MAP, result);
		resultMap.put(ComConstants.PROP_RESULT_LIST_4, resultList4);

		return getSuccessResponseEntity(resultMap);
	}

    // 육묘기준 목록 공통 조회
    @PostMapping(value = "/am/wrhs/sdlngCrtrInfos", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> sdlngCrtrInfos(@RequestBody SdlngVO sdlngVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        List<SdlngVO> resultList = new ArrayList<>();

        try {
            resultList = rawMtrWrhsIgiService.sdlngCrtrInfos(sdlngVO);
        } catch(Exception e) {
            logger.debug("error: {}", e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }

    // 육묘시설 구역 목록 공통 조회
    @PostMapping(value = "/am/wrhs/sdlngFcltZoneInfos", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> sdlngFcltZoneInfos(@RequestBody SdlngVO sdlngVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        List<SdlngVO> resultList = new ArrayList<>();

        try {
            resultList = rawMtrWrhsIgiService.sdlngFcltZoneInfos(sdlngVO);
        } catch(Exception e) {
            logger.debug("error: {}", e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }

    // 육묘시설 열 목록 공통 조회
    @PostMapping(value = "/am/wrhs/sdlngFcltRowInfos", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> sdlngFcltRowInfos(@RequestBody SdlngVO sdlngVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        List<SdlngVO> resultList = new ArrayList<>();

        try {
            resultList = rawMtrWrhsIgiService.sdlngFcltRowInfos(sdlngVO);
        } catch(Exception e) {
            logger.debug("error: {}", e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }

    // 육묘기준 목록 조회
    @PostMapping(value = "/am/wrhs/selectSdlngCrtrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectSdlngCrtrList(@RequestBody SdlngVO sdlngVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        List<SdlngVO> resultList;

        try {
            resultList = rawMtrWrhsIgiService.selectSdlngCrtrList(sdlngVO);
        } catch(Exception e) {
            logger.debug("error: {}", e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }

    // 육묘기준 목록 저장
    @PostMapping(value = "/am/wrhs/multiSdlngCrtrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> multiSdlngCrtrList(@RequestBody List<SdlngVO> sdlngCrtrList, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            for(SdlngVO sdlngVO : sdlngCrtrList) {
                sdlngVO.setSysFrstInptUserId(getUserId());
                sdlngVO.setSysFrstInptPrgrmId(getPrgrmId());
                sdlngVO.setSysLastChgUserId(getUserId());
                sdlngVO.setSysLastChgPrgrmId(getPrgrmId());
            }

            HashMap<String, Object> rtnObj = rawMtrWrhsIgiService.multiSdlngCrtrList(sdlngCrtrList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch(EgovBizException e) {
            return getErrorResponseEntity(e);
        } catch(Exception e) {
            logger.error("error: {}", e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        return getSuccessResponseEntity(resultMap);
    }

    // 육묘기준 목록 삭제
    @PostMapping(value = "/am/wrhs/deleteSdlngCrtrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> deleteSdlngCrtrList(@RequestBody SdlngVO sdlngVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            HashMap<String, Object> rtnObj = rawMtrWrhsIgiService.deleteSdlngCrtrList(sdlngVO);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch(Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        return getSuccessResponseEntity(resultMap);
    }

    // 육묘장 목록 조회
    @PostMapping(value = "/am/wrhs/selectSdlngList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectSdlngList(@RequestBody SdlngVO sdlngVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        List<SdlngVO> resultList;

        try {
            resultList = rawMtrWrhsIgiService.selectSdlngList(sdlngVO);
        } catch(Exception e) {
            logger.debug("error: {}", e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }

    // 육묘장 목록 저장
    @PostMapping(value = "/am/wrhs/multiSdlngList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> multiSdlngList(@RequestBody List<SdlngVO> sdlngList, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            for(SdlngVO sdlngVO : sdlngList) {
                sdlngVO.setSysFrstInptUserId(getUserId());
                sdlngVO.setSysFrstInptPrgrmId(getPrgrmId());
                sdlngVO.setSysLastChgUserId(getUserId());
                sdlngVO.setSysLastChgPrgrmId(getPrgrmId());
            }

            HashMap<String, Object> rtnObj = rawMtrWrhsIgiService.multiSdlngList(sdlngList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch(EgovBizException e) {
            return getErrorResponseEntity(e);
        } catch(Exception e) {
            logger.error("error: {}", e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        return getSuccessResponseEntity(resultMap);
    }

    // 육묘장 목록 삭제
    @PostMapping(value = "/am/wrhs/deleteSdlngList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> deleteSdlngList(@RequestBody List<SdlngVO> sdlngList, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            for(SdlngVO sdlngVO : sdlngList) {
                sdlngVO.setSysFrstInptUserId(getUserId());
                sdlngVO.setSysFrstInptPrgrmId(getPrgrmId());
                sdlngVO.setSysLastChgUserId(getUserId());
                sdlngVO.setSysLastChgPrgrmId(getPrgrmId());
            }

            HashMap<String, Object> rtnObj = rawMtrWrhsIgiService.deleteSdlngList(sdlngList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch(EgovBizException e) {
            return getErrorResponseEntity(e);
        } catch(Exception e) {
            logger.error("error: {}", e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        return getSuccessResponseEntity(resultMap);
    }

    // 재배장 단건 조회
    @PostMapping(value = "/am/wrhs/selectCltvtn.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectCltvtn(@RequestBody SdlngVO sdlngVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        List<SdlngVO> resultList;

        try {
            resultList = rawMtrWrhsIgiService.selectCltvtn(sdlngVO);
        } catch(Exception e) {
            logger.debug("error: {}", e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }

    // 재배장 목록 조회
    @PostMapping(value = "/am/wrhs/selectCltvtnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectCltvtnList(@RequestBody SdlngVO sdlngVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        List<SdlngVO> resultList;

        try {
            resultList = rawMtrWrhsIgiService.selectCltvtnList(sdlngVO);
        } catch(Exception e) {
            logger.debug("error: {}", e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }

    // 재배장 목록 저장
    @PostMapping(value = "/am/wrhs/multiCltvtnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> multiCltvtnList(@RequestBody List<SdlngVO> cltvtnList, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            for(SdlngVO sdlngVO : cltvtnList) {
                sdlngVO.setSysFrstInptUserId(getUserId());
                sdlngVO.setSysFrstInptPrgrmId(getPrgrmId());
                sdlngVO.setSysLastChgUserId(getUserId());
                sdlngVO.setSysLastChgPrgrmId(getPrgrmId());
            }

            HashMap<String, Object> rtnObj = rawMtrWrhsIgiService.multiCltvtnList(cltvtnList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch(EgovBizException e) {
            return getErrorResponseEntity(e);
        } catch(Exception e) {
            logger.error("error: {}", e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        return getSuccessResponseEntity(resultMap);
    }

    // 재배장 목록 삭제
    @PostMapping(value = "/am/wrhs/deleteCltvtnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> deleteCltvtnList(@RequestBody SdlngVO sdlngVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            HashMap<String, Object> rtnObj = rawMtrWrhsIgiService.deleteCltvtnList(sdlngVO);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch(Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        return getSuccessResponseEntity(resultMap);
    }

    // 계량 목록 단건 조회
    @PostMapping(value = "/am/wrhs/selectWgh.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectWgh(@RequestBody SdlngVO sdlngVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        List<SdlngVO> resultList;

        try {
            resultList = rawMtrWrhsIgiService.selectWgh(sdlngVO);
        } catch(Exception e) {
            logger.debug("error: {}", e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }

    // 계량 목록 조회
    @PostMapping(value = "/am/wrhs/selectWghList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectWghList(@RequestBody SdlngVO sdlngVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        List<SdlngVO> resultList;

        try {
            resultList = rawMtrWrhsIgiService.selectWghList(sdlngVO);
        } catch(Exception e) {
            logger.debug("error: {}", e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }

    // 계량 목록 저장
    @PostMapping(value = "/am/wrhs/multiWghList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> multiWghList(@RequestBody List<SdlngVO> wghList, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            for(SdlngVO sdlngVO : wghList) {
                sdlngVO.setSysFrstInptUserId(getUserId());
                sdlngVO.setSysFrstInptPrgrmId(getPrgrmId());
                sdlngVO.setSysLastChgUserId(getUserId());
                sdlngVO.setSysLastChgPrgrmId(getPrgrmId());
            }

            HashMap<String, Object> rtnObj = rawMtrWrhsIgiService.multiWghList(wghList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch(EgovBizException e) {
            return getErrorResponseEntity(e);
        } catch(Exception e) {
            logger.error("error: {}", e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        return getSuccessResponseEntity(resultMap);
    }

    // 계량 목록 삭제
    @PostMapping(value = "/am/wrhs/deleteWghList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> deleteWghList(@RequestBody SdlngVO sdlngVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            HashMap<String, Object> rtnObj = rawMtrWrhsIgiService.deleteWghList(sdlngVO);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch(Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        return getSuccessResponseEntity(resultMap);
    }

    // 출고 목록 조회
    @PostMapping(value = "/am/wrhs/selectSpmtList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectSpmtList(@RequestBody SdlngVO sdlngVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        List<SdlngVO> resultList;

        try {
            resultList = rawMtrWrhsIgiService.selectSpmtList(sdlngVO);
        } catch(Exception e) {
            logger.debug("error: {}", e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

        return getSuccessResponseEntity(resultMap);
    }

    // 출고 목록 저장
    @PostMapping(value = "/am/wrhs/multiSpmtList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> multiSpmtList(@RequestBody List<SdlngVO> SpmtList, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            for(SdlngVO sdlngVO : SpmtList) {
                sdlngVO.setSysFrstInptUserId(getUserId());
                sdlngVO.setSysFrstInptPrgrmId(getPrgrmId());
                sdlngVO.setSysLastChgUserId(getUserId());
                sdlngVO.setSysLastChgPrgrmId(getPrgrmId());
            }

            HashMap<String, Object> rtnObj = rawMtrWrhsIgiService.multiSpmtList(SpmtList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch(EgovBizException e) {
            return getErrorResponseEntity(e);
        } catch(Exception e) {
            logger.error("error: {}", e.getMessage());
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }

        return getSuccessResponseEntity(resultMap);
    }

    // 출고 목록 삭제
    @PostMapping(value = "/am/wrhs/deleteSpmtList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> deleteSpmtList(@RequestBody List<SdlngVO> SpmtList, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        try {
            for(SdlngVO sdlngVO : SpmtList) {
                sdlngVO.setSysFrstInptUserId(getUserId());
                sdlngVO.setSysFrstInptPrgrmId(getPrgrmId());
                sdlngVO.setSysLastChgUserId(getUserId());
                sdlngVO.setSysLastChgPrgrmId(getPrgrmId());
            }

            HashMap<String, Object> rtnObj = rawMtrWrhsIgiService.deleteSpmtList(SpmtList);
            if(rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        } catch(EgovBizException e) {
            return getErrorResponseEntity(e);
        } catch(Exception e) {
            logger.error("error: {}", e.getMessage());
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
