package com.at.apcss.am.sort.web;

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

import com.at.apcss.am.sort.service.SortPrfmncService;
import com.at.apcss.am.sort.vo.ComSortDsctnTotVO;
import com.at.apcss.am.sort.vo.SortBffaList;
import com.at.apcss.am.sort.vo.SortBffaVO;
import com.at.apcss.am.sort.vo.SortDsctnTotVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SortPrfmncController.java
 * @Description : 선별실적정보관리에 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Controller
public class SortPrfmncController extends BaseController {

	@Resource(name = "sortPrfmncService")
	private SortPrfmncService sortPrfmncService;

	@PostMapping(value = "/am/sort/selectSortPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortPrfmncList(@RequestBody SortPrfmncVO sortPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortPrfmncVO> resultList = new ArrayList<>();

		try {
			resultList = sortPrfmncService.selectSortPrfmncList(sortPrfmncVO);
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
	@PostMapping(value = "/am/sort/selectSortPrfmncGrdList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortPrfmncGrdList(@RequestBody SortPrfmncVO sortPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortPrfmncVO> resultList = new ArrayList<>();

		try {
			resultList = sortPrfmncService.selectSortPrfmncGrdList(sortPrfmncVO);
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

	/**
	 * 선별투입실적 조회
	 * @param sortPrfmncVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/sort/selectSortInptPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortInptPrfmncList(@RequestBody SortPrfmncVO sortPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortPrfmncVO> resultList = new ArrayList<>();

		try {
			resultList = sortPrfmncService.selectSortInptPrfmncList(sortPrfmncVO);
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

	@PostMapping(value = "/am/sort/insertSortPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSortPrfmncList(@RequestBody List<SortPrfmncVO> sortPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {

			for ( SortPrfmncVO sortPrfmncVO : sortPrfmncList ) {
				sortPrfmncVO.setSysFrstInptUserId(getUserId());
				sortPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				sortPrfmncVO.setSysLastChgUserId(getUserId());
				sortPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

			}

			HashMap<String, Object> rtnObj = sortPrfmncService.insertSortPrfmncList(sortPrfmncList);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		}

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/sort/selectDsctnTotList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectDsctnTotList(@RequestBody SortDsctnTotVO sortDsctnTotVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortDsctnTotVO> resultList = new ArrayList<>();

		try {
			resultList = sortPrfmncService.selectSortDsctnTot(sortDsctnTotVO);
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
	@PostMapping(value = "/am/sort/selectSortDsctn.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortDsctn(@RequestBody SortDsctnTotVO sortDsctnTotVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortDsctnTotVO> resultList = new ArrayList<>();

		try {
			resultList = sortPrfmncService.selectSortDsctn(sortDsctnTotVO);
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

	@PostMapping(value = "/am/sort/selectComDsctnTotList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectComDsctnTotList(@RequestBody ComSortDsctnTotVO sortDsctnTotVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ComSortDsctnTotVO> resultList = new ArrayList<>();

		try {
			resultList = sortPrfmncService.selectComSortDsctnTot(sortDsctnTotVO);
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

	/**
     * 선별등록 조회
     * @param sortPrfmncVO
     * @param request
     * @return
     * @throws Exception
     */
    @PostMapping(value = "/am/sort/selectSortRsltList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> selectSortRsltList(@RequestBody SortPrfmncVO sortPrfmncVO, HttpServletRequest request) throws Exception {

        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        List<SortPrfmncVO> resultList = new ArrayList<>();

        try {
            resultList = sortPrfmncService.selectSortListBySortno(sortPrfmncVO);
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
	/**
	 * 육안 선별 조회
	 * @param sortBffaVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/sort/selectSortBffa.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortBffaList(@RequestBody SortBffaVO sortBffaVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortBffaVO> resultList = new ArrayList<>();

		try {
			resultList = sortPrfmncService.selectSortBffaListBySortno(sortBffaVO);
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
	/**
	 * 육안 선별 등록
	 * @param sortBffaVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/sort/insertSortBffa.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertSortBffa(@RequestBody SortBffaVO sortBffaVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;

		try {
			sortBffaVO.setSysFrstInptUserId(getUserId());
			sortBffaVO.setSysFrstInptPrgrmId(getPrgrmId());
			sortBffaVO.setSysLastChgUserId(getUserId());
			sortBffaVO.setSysLastChgPrgrmId(getPrgrmId());
			sortBffaVO.setDelYn("N");
			result = sortPrfmncService.insertSortBffa(sortBffaVO);
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

    @PostMapping(value = "/am/sort/selectExhstDsctn.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectExhstDsctn(@RequestBody HashMap<String, Object> paramMap, HttpServletRequest request) throws Exception {
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	List<HashMap<String,Object>> resultList;

        try {
            resultList = sortPrfmncService.selectExhstDsctn(paramMap);
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

    @PostMapping(value = "/am/sort/selectGrdDsctn.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectGrdDsctn(@RequestBody HashMap<String, Object> paramMap, HttpServletRequest request) throws Exception {
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	List<HashMap<String,Object>> resultList;

        try {
            resultList = sortPrfmncService.selectGrdDsctn(paramMap);
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

    @PostMapping(value = "/am/sort/selectBffaGrdTot.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectBffaGrdTot(@RequestBody HashMap<String, Object> paramMap, HttpServletRequest request) throws Exception {
    	HashMap<String,Object> resultMap = new HashMap<String,Object>();
    	List<HashMap<String,Object>> resultList;

        try {
            resultList = sortPrfmncService.selectBffaGrdTot(paramMap);
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


	/**
	 * 선별실적(입고별) 목록 조회
	 * @param sortPrfmncVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/sort/selectSortPrfmncListByWrhs.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortPrfmncListByWrhs(@RequestBody SortPrfmncVO sortPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortPrfmncVO> resultList = new ArrayList<>();

		try {
			resultList = sortPrfmncService.selectSortPrfmncListByWrhs(sortPrfmncVO);
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

	/**
	 * 선별실적(입고별 상품등급) 목록 조회
	 * @param sortPrfmncVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/sort/selectSortPrfmncListByWrhsForGdsGrd.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortPrfmncListByWrhsForGdsGrd(@RequestBody SortPrfmncVO sortPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortPrfmncVO> resultList = new ArrayList<>();

		try {
			resultList = sortPrfmncService.selectSortPrfmncListByWrhsForGdsGrd(sortPrfmncVO);
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
	/**
	 * 육안선별 목록 삭제
	 * @param sortBffaVoList
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/sort/deleteSortBffa.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteSortBffa(@RequestBody List<SortBffaVO> sortBffaVoList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		int result = 0;
		try {
			result =  sortPrfmncService.deleteSortBffa(sortBffaVoList);
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, result);

		return getSuccessResponseEntity(resultMap);
	}

    @PostMapping(value = "/am/sort/selectExhstDsctnCol.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectExhstDsctnCol(@RequestBody HashMap<String, Object> paramMap, HttpServletRequest request) throws Exception {
        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        List<HashMap<String,Object>> resultList;

        try {
            resultList = sortPrfmncService.selectExhstDsctnCol(paramMap);
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

    /**
	 * 육안 선별 조회(현장용)
	 * @param sortBffaVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @PostMapping(value = "/am/sort/selectSortBffaSpt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectSortBffaSpt(@RequestBody SortBffaVO sortBffaVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		SortPrfmncVO resultList = new SortPrfmncVO();

		try {
			resultList = sortPrfmncService.selectSortBffaSpt(sortBffaVO);
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


    /**
	 * 육안 선별 등록(현장용)
	 * @param sortBffaVO
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/am/sort/insertSortBffaSpt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertSortBffaSpt(@RequestBody List<SortBffaList> sortBffaListVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			sortBffaListVO.get(0).setSysFrstInptUserId(getUserId());
			sortBffaListVO.get(0).setSysFrstInptPrgrmId(getPrgrmId());
			sortBffaListVO.get(0).setSysLastChgUserId(getUserId());
			sortBffaListVO.get(0).setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = sortPrfmncService.insertSortBffaSpt(sortBffaListVO);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		} catch(Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		return getSuccessResponseEntity(resultMap);
	}

}
