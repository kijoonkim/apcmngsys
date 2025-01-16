package com.at.apcss.am.dscd.web;

import com.at.apcss.am.clcln.service.ClclnCrtrService;
import com.at.apcss.am.clcln.service.ClclnUntprcService;
import com.at.apcss.am.clcln.vo.ClclnCrtrVO;
import com.at.apcss.am.clcln.vo.ClclnMngVO;
import com.at.apcss.am.clcln.vo.ClclnUntprcVO;
import com.at.apcss.am.dscd.service.DscdCrtrService;
import com.at.apcss.am.dscd.vo.DscdCrtrVO;
import com.at.apcss.am.dscd.vo.DscdMngVO;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.am.spmt.vo.ShpgotApcCrtrDtlVO;
import com.at.apcss.am.spmt.vo.ShpgotApcCrtrVO;
import com.at.apcss.am.spmt.vo.ShpgotApcRawMtrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.co.sys.util.ComUtil;
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
 * @Class Name : DscdMngController.java
 * @Description : 폐기관리 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.21  신정철        최초 생성
 *      </pre>
 */
@Controller
public class DscdMngController extends BaseController {

	@Resource(name = "dscdCrtrService")
	private DscdCrtrService dscdCrtrService;

	// APC 폐기기준 조회
	@PostMapping(value = "/am/dscd/selectDscdCrtrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectDscdCrtrList(@RequestBody DscdCrtrVO dscdCrtrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<DscdCrtrVO> resultList = new ArrayList<>();
		
		try {
			resultList = dscdCrtrService.selectDscdCrtrList(dscdCrtrVO);
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
	
	// APC 폐기기준 등록
	@PostMapping(value = "/am/dscd/insertDscdCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertDscdCrtr(@RequestBody DscdMngVO dscdMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			dscdMngVO.setSysFrstInptUserId(getUserId());
			dscdMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			dscdMngVO.setSysLastChgUserId(getUserId());
			dscdMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = dscdCrtrService.insertDscdCrtr(dscdMngVO);
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
	
	// APC 폐기기준 삭제
	@PostMapping(value = "/am/dscd/deleteDscdCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteDscdCrtr(@RequestBody DscdMngVO dscdMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			dscdMngVO.setSysFrstInptUserId(getUserId());
			dscdMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			dscdMngVO.setSysLastChgUserId(getUserId());
			dscdMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = dscdCrtrService.deleteDscdCrtr(dscdMngVO);
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
	
	// APC 폐기기준 상세 등록
	@PostMapping(value = "/am/dscd/insertDscdCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertDscdCrtrDtl(@RequestBody DscdMngVO dscdMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			dscdMngVO.setSysFrstInptUserId(getUserId());
			dscdMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			dscdMngVO.setSysLastChgUserId(getUserId());
			dscdMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = dscdCrtrService.insertDscdCrtrDtl(dscdMngVO);
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
	
	// APC 폐기기준 상세 삭제
	@PostMapping(value = "/am/dscd/deleteDscdCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteDscdCrtrDtl(@RequestBody DscdMngVO dscdMngVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			dscdMngVO.setSysFrstInptUserId(getUserId());
			dscdMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			dscdMngVO.setSysLastChgUserId(getUserId());
			dscdMngVO.setSysLastChgPrgrmId(getPrgrmId());
			
			HashMap<String, Object> rtnObj = dscdCrtrService.deleteDscdCrtrDtl(dscdMngVO);
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
	
	// APC 폐기기준 상세 조회
	@PostMapping(value = "/am/dscd/selectDscdCrtrDtlList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectDscdCrtrDtlList(@RequestBody DscdCrtrVO dscdCrtrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<DscdCrtrVO> resultList = new ArrayList<>();
		
		try {
			resultList = dscdCrtrService.selectDscdCrtrDtlList(dscdCrtrVO);
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
	
	
	// APC 폐기기준 상세 조회 (사용중)
	@PostMapping(value = "/am/dscd/selectCrtrDtlListInUse.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCrtrDtlListInUse(@RequestBody DscdCrtrVO dscdCrtrVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<DscdCrtrVO> resultList = new ArrayList<>();
		
		try {
			resultList = dscdCrtrService.selectCrtrDtlListInUse(dscdCrtrVO);
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

    // APC 폐기 등록 - 폐기 등록 목록 조회
    @PostMapping(value = "/am/dscd/selectDscdRegList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectDscdRegList(@RequestBody DscdCrtrVO dscdCrtrVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<DscdCrtrVO> resultList = new ArrayList();
        try{
            resultList = dscdCrtrService.selectDscdRegList(dscdCrtrVO);
        }catch (Exception e) {
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

    // APC 폐기 등록 - 폐기 등록 목록 추가
    @PostMapping(value = "/am/dscd/insertDscdRegList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertDscdRegList(@RequestBody List<DscdCrtrVO> dscdRegList, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        int insertCnt = 0;

        try{
            for(DscdCrtrVO vo : dscdRegList){
                setCommonInfo(vo);
            }

            insertCnt = dscdCrtrService.insertDscdRegList(dscdRegList);
        }catch (Exception e) {
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_INSERTED_CNT,insertCnt);
        return getSuccessResponseEntity(resultMap);
    }

    // APC 폐기 등록 - 폐기 등록 목록 삭제
    @PostMapping(value = "/am/dscd/deleteDscdRegList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> deleteDscdRegList(@RequestBody DscdCrtrVO dscdCrtrVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        int deleteCnt = 0;

        try{
            setCommonInfo(dscdCrtrVO);
            deleteCnt = dscdCrtrService.deleteDscdRegList(dscdCrtrVO);
        }catch (Exception e) {
            return getErrorResponseEntity(e);
        } finally {
            HashMap<String, Object> rtnObj = setMenuComLog(request);
            if (rtnObj != null) {
                return getErrorResponseEntity(rtnObj);
            }
        }
        resultMap.put(ComConstants.PROP_DELETED_CNT, deleteCnt);
        return getSuccessResponseEntity(resultMap);
    }

    // APC 폐기 (실적 조회, 상세 관리) - 폐기 실적 목록 조회
    @PostMapping(value = "/am/dscd/selectDscdPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectDscdPrfmncList(@RequestBody DscdCrtrVO dscdCrtrVO, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<DscdCrtrVO> resultList;
        try {
            resultList = dscdCrtrService.selectDscdPrfmncList(dscdCrtrVO);
        } catch(Exception e) {
            logger.debug(ComConstants.ERROR_CODE, e.getMessage());

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

    // APC 폐기 상세 관리 - 폐기 실적 목록 삭제
    @PostMapping(value = "/am/dscd/deleteDscdPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> deleteDscdPrfmncList(@RequestBody List<DscdCrtrVO> dscdPrfmncList, HttpServletRequest request) throws Exception {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();

        for(DscdCrtrVO dscdCrtrVO : dscdPrfmncList) {
            try {
                HashMap<String, Object> rtnObj = dscdCrtrService.deleteDscdPrfmncList(dscdCrtrVO);

                if (rtnObj != null) {
                    return getErrorResponseEntity(rtnObj);
                }
            } catch (Exception e) {
                logger.debug(ComConstants.ERROR_CODE, e.getMessage());

                return getErrorResponseEntity(e);
            } finally {
                HashMap<String, Object> rtnObj = setMenuComLog(request);

                if (rtnObj != null) {
                    return getErrorResponseEntity(rtnObj);
                }
            }
        }

        return getSuccessResponseEntity(resultMap);
    }

    private <T> void setCommonInfo(T vo) {
        if(vo instanceof DscdCrtrVO) {
            DscdCrtrVO dscdCrtrVO = (DscdCrtrVO) vo;
            dscdCrtrVO.setDelYn("N");
            dscdCrtrVO.setSysFrstInptUserId(getUserId());
            dscdCrtrVO.setSysFrstInptPrgrmId(getPrgrmId());
            dscdCrtrVO.setSysLastChgUserId(getUserId());
            dscdCrtrVO.setSysLastChgPrgrmId(getPrgrmId());
        }
    }
}

