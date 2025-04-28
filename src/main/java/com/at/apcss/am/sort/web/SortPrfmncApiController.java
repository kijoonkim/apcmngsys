package com.at.apcss.am.sort.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.at.apcss.am.sort.service.SortMngService;
import com.at.apcss.am.sort.vo.SortBffaList;
import com.at.apcss.am.sort.vo.SortBffaVO;
import com.at.apcss.am.sort.vo.WrhsSortGrdVO;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.at.apcss.am.sort.service.SortPrfmncService;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SortPrfmncApiController.java
 * @Description : 선별실적정보관리에 대한 ApiController 클래스
 * @author 김   호
 * @since 2024.04.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2024.04.11  김  호        최초 생성
 * </pre>
 */
@RestController
public class SortPrfmncApiController extends BaseController {

	@Resource(name = "sortPrfmncService")
	private SortPrfmncService sortPrfmncService;

	@Resource(name = "sortMngService")
	private SortMngService sortMngService;

	// 모바일 선별실적조회 API
	@PostMapping(value = "/api/mobile/am/sort/selectSortPrfmncList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
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

	//모바일 선별실적정보 조회 API
	@PostMapping(value = "/api/mobile/am/sort/selectSortRsltList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectSortRsltList(@RequestBody SortPrfmncVO sortPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SortPrfmncVO> resultList = new ArrayList<>();

		try {
			resultList = sortPrfmncService.selectSortListBySortno(sortPrfmncVO);
		} catch(Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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

    // 모바일 육안선별 결과 목록 조회 API
    @PostMapping(value = "/api/mobile/am/sort/selectSortBffaSpt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectSortBffaSpt(@RequestBody SortBffaVO sortBffaVO, HttpServletRequest request) throws Exception {
        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        SortBffaVO resultList = new SortBffaVO();

        try {
            resultList = sortPrfmncService.selectSortBffaSpt(sortBffaVO);
        } catch(Exception e) {
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

    // 모바일 배출구 선별등급 조회 API
    @PostMapping(value = "/api/mobile/am/sort/selectExhstDsctnCol.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> selectExhstDsctnCol(@RequestBody HashMap<String, Object> paramMap, HttpServletRequest request) throws Exception {
        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        List<HashMap<String,Object>> resultList;

        try {
            resultList = sortPrfmncService.selectExhstDsctnCol(paramMap);
        } catch(Exception e) {
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

    // 모바일 육안선별 등록 API
    @PostMapping(value = "/api/mobile/am/sort/insertSortBffaSpt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> insertSortBffaSpt(@RequestBody List<SortBffaList> sortBffaListVO, HttpServletRequest request) throws Exception {
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            HashMap<String, Object> rtnObj = sortPrfmncService.insertSortBffaSpt(sortBffaListVO);
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

        resultMap.put(ComConstants.PROP_RESULT_MAP, sortBffaListVO);

        return getSuccessResponseEntity(resultMap);
    }

    // 모바일 육안선별 삭제 API
    @PostMapping(value = "/api/mobile/am/sort/deleteSortBffaSpt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
    public ResponseEntity<HashMap<String, Object>> deleteSortBffaSpt(@RequestBody WrhsSortGrdVO wrhsSortGrdVO, HttpServletRequest request) throws Exception {
        HashMap<String,Object> resultMap = new HashMap<String,Object>();

        try {
            wrhsSortGrdVO.setSysFrstInptUserId(getUserId());
            wrhsSortGrdVO.setSysFrstInptPrgrmId(getPrgrmId());
            wrhsSortGrdVO.setSysLastChgUserId(getUserId());
            wrhsSortGrdVO.setSysLastChgPrgrmId(getPrgrmId());

            HashMap<String, Object> rtnObj = sortPrfmncService.deleteSortBffaSpt(wrhsSortGrdVO);
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
