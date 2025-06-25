package com.at.apcss.am.spmt.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.at.apcss.am.constants.AmConstants;
import com.at.apcss.am.invntr.vo.GdsInvntrVO;
import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.spmt.service.SpmtMngService;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.spmt.service.SpmtPrfmncService;
import com.at.apcss.am.spmt.vo.SpmtDsctnTotVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncComVO;
import com.at.apcss.am.spmt.vo.SpmtPrfmncVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : SpmtPrfmncController.java
 * @Description : 출고실적에 대한 Controller 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 *      </pre>
 */
@Controller
public class SpmtPrfmncController extends BaseController {

	@Resource(name= "spmtPrfmncService")
	private SpmtPrfmncService spmtPrfmncService;

	@Resource(name= "spmtMngService")
	private SpmtMngService spmtMngService;

	// 출하실적 조회
	@PostMapping(value = "/am/spmt/selectSpmtPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtPrfmncList(@RequestBody SpmtPrfmncVO SpmtPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SpmtPrfmncVO> resultList = new ArrayList<>();
		try {
			resultList = spmtPrfmncService.selectSpmtPrfmncList(SpmtPrfmncVO);
		} catch (Exception e) {
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

	// 출하실적 집계조회
	@PostMapping(value = "/am/spmt/selectSpmtPrfmncTotalList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtPrfmncTotalList(@RequestBody SpmtPrfmncVO SpmtPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SpmtPrfmncVO> resultList = new ArrayList<>();
		try {
			resultList = spmtPrfmncService.selectSpmtPrfmncTotalList(SpmtPrfmncVO);
		} catch (Exception e) {
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

	// 파프리카출하실적 조회
	@PostMapping(value = "/am/spmt/selectSpmtPrfmncDsctnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtPrfmncDsctnList(@RequestBody SpmtDsctnTotVO SpmtDsctnTotVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SpmtDsctnTotVO> resultList = new ArrayList<>();
		try {
			resultList = spmtPrfmncService.selectSpmtPrfmncDsctnList(SpmtDsctnTotVO);
		} catch (Exception e) {
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

	// 출하실적 등록
	@PostMapping(value = "/am/spmt/insertSpmtPrfmncByGrd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSpmtPrfmncByGrd(@RequestBody SpmtPrfmncComVO spmtPrfmncComVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			spmtPrfmncComVO.setSysFrstInptUserId(getUserId());
			spmtPrfmncComVO.setSysFrstInptPrgrmId(getPrgrmId());
			spmtPrfmncComVO.setSysLastChgUserId(getUserId());
			spmtPrfmncComVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = spmtPrfmncService.insertSpmtPrfmncByGrd(spmtPrfmncComVO);
			if(rtnObj != null) {
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
		return getSuccessResponseEntity(resultMap);
	}
	

	/**
	 * 출하실적 등록 (by 포장번호)
	 */
	@PostMapping(value = "/am/spmt/insertSpmtPrfmncByPckgList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSpmtPrfmncByPckgList(@RequestBody SpmtPrfmncComVO spmtPrfmncComVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			spmtPrfmncComVO.setSysFrstInptUserId(getUserId());
			spmtPrfmncComVO.setSysFrstInptPrgrmId(getPrgrmId());
			spmtPrfmncComVO.setSysLastChgUserId(getUserId());
			spmtPrfmncComVO.setSysLastChgPrgrmId(getPrgrmId());

			spmtPrfmncComVO.setSpmtFrcdPrcsYn(ComConstants.CON_YES);
			
			HashMap<String, Object> rtnObj = spmtPrfmncService.insertSpmtPrfmncCallByPckgList(spmtPrfmncComVO);
			if(rtnObj != null) {
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
		
		resultMap.put(ComConstants.PROP_RESULT_MAP, spmtPrfmncComVO);
		
		return getSuccessResponseEntity(resultMap);
	}
	
	
	// 출하실적 등록
	@PostMapping(value = "/am/spmt/insertSpmtPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSpmtPrfmncList(@RequestBody List<SpmtPrfmncVO> spmtPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			for (SpmtPrfmncVO spmtPrfmncVO : spmtPrfmncList) {
				spmtPrfmncVO.setSysFrstInptUserId(getUserId());
				spmtPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				spmtPrfmncVO.setSysLastChgUserId(getUserId());
				spmtPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = spmtPrfmncService.insertSpmtPrfmncList(spmtPrfmncList);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		}catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		return getSuccessResponseEntity(resultMap);
	}

	// 출하실적 등록 태블릿
	@PostMapping(value = "/am/spmt/insertSpmtPrfmncTabletList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSpmtPrfmncTabletList(@RequestBody List<SpmtPrfmncVO> SpmtPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			for (SpmtPrfmncVO spmtPrfmncVO : SpmtPrfmncList) {
				spmtPrfmncVO.setSysFrstInptUserId(getUserId());
				spmtPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				spmtPrfmncVO.setSysLastChgUserId(getUserId());
				spmtPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = spmtPrfmncService.insertSpmtPrfmncTabletList(SpmtPrfmncList);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		}catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		return getSuccessResponseEntity(resultMap);
	}

	// 출하반품 등록
	@PostMapping(value = "/am/spmt/insertRtnSpmtPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertRtnSpmtPrfmncList(@RequestBody List<SpmtPrfmncVO> SpmtPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			for (SpmtPrfmncVO spmtPrfmncVO : SpmtPrfmncList) {
				spmtPrfmncVO.setSysFrstInptUserId(getUserId());
				spmtPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				spmtPrfmncVO.setSysLastChgUserId(getUserId());
				spmtPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
				spmtPrfmncVO.setOrgnPckgno(spmtPrfmncVO.getPckgno());
				spmtPrfmncVO.setOrgnPckgSn(spmtPrfmncVO.getPckgSn());
				spmtPrfmncVO.setOrgnSpmtno(spmtPrfmncVO.getSpmtno());
			}

			HashMap<String, Object> rtnObj = spmtPrfmncService.insertRtnSpmtPrfmncList(SpmtPrfmncList);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		}catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		return getSuccessResponseEntity(resultMap);
	}
	// 출하반품 취소
	@PostMapping(value = "/am/spmt/deleteRtnSpmtPrfmnCnclList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteRtnSpmtPrfmnCnclList(@RequestBody List<SpmtPrfmncVO> SpmtPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			for (SpmtPrfmncVO spmtPrfmncVO : SpmtPrfmncList) {
				spmtPrfmncVO.setSysFrstInptUserId(getUserId());
				spmtPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				spmtPrfmncVO.setSysLastChgUserId(getUserId());
				spmtPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = spmtPrfmncService.deleteRtnSpmtPrfmncList(SpmtPrfmncList);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		}catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		return getSuccessResponseEntity(resultMap);
	}

	// 출하실적 조회
	@PostMapping(value = "/am/spmt/selectSpmtPrfmncDtlList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtPrfmncDtlList(@RequestBody SpmtPrfmncVO spmtPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SpmtPrfmncVO> resultList = new ArrayList<>();
		try {
			resultList = spmtPrfmncService.selectSpmtPrfmncDtlList(spmtPrfmncVO);

			resultMap.put(ComConstants.PROP_RESULT_LIST,  resultList);

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		return getSuccessResponseEntity(resultMap);
	}

	// 출하실적 삭제
	@PostMapping(value = "/am/spmt/deleteSpmtPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteSpmtPrfmncList(@RequestBody List<SpmtPrfmncVO> SpmtPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			for (SpmtPrfmncVO spmtPrfmncVO : SpmtPrfmncList) {
				spmtPrfmncVO.setSysFrstInptUserId(getUserId());
				spmtPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				spmtPrfmncVO.setSysLastChgUserId(getUserId());
				spmtPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = spmtPrfmncService.deleteSpmtPrfmnc(SpmtPrfmncList);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		}catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		return getSuccessResponseEntity(resultMap);
	}

	// 파프라카출하실적 등록
	@PostMapping(value = "/am/spmt/insertSpmtPrfmncDsctn.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSpmtPrfmncDsctn(@RequestBody List<SpmtPrfmncComVO> spmtPrfmncComList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			for (SpmtPrfmncComVO spmtPrfmncComVO : spmtPrfmncComList) {
				spmtPrfmncComVO.setSysFrstInptUserId(getUserId());
				spmtPrfmncComVO.setSysFrstInptPrgrmId(getPrgrmId());
				spmtPrfmncComVO.setSysLastChgUserId(getUserId());
				spmtPrfmncComVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = spmtPrfmncService.insertSpmtPrfmncDsctn(spmtPrfmncComList);
			if(rtnObj != null) {
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
		resultMap.put(ComConstants.PROP_RESULT_MAP,spmtPrfmncComList.get(0));
		return getSuccessResponseEntity(resultMap);
	}
	@PostMapping(value = "/am/spmt/selectSpmtPrfmncInvntList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtPrfmncInvntList(@RequestBody SpmtPrfmncVO spmtPrfmncVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try{
			List<GdsInvntrVO> result = spmtPrfmncService.selectSpmtPrfmncInvntList(spmtPrfmncVO);
			resultMap.put(ComConstants.PROP_RESULT_LIST,result);

		}catch (Exception e){
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
		HashMap<String, Object> rtnObj = setMenuComLog(request);
		if (rtnObj != null) {
			return getErrorResponseEntity(rtnObj);
		}
	}
		return getSuccessResponseEntity(resultMap);
	}
	@PostMapping(value = "/am/spmt/selectSpmtPrfmncComList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtPrfmncComList(@RequestBody SpmtPrfmncVO spmtPrfmncVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try{
			List<SpmtPrfmncVO> list = spmtPrfmncService.selectSpmtPrfmncComList(spmtPrfmncVO);
			resultMap.put(ComConstants.PROP_RESULT_LIST,list);

		}catch (Exception e){
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		}finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		return getSuccessResponseEntity(resultMap);
	}
	@PostMapping(value = "/am/spmt/selectSpmtPrfmncRegList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtPrfmncRegList(@RequestBody SpmtPrfmncVO spmtPrfmncVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try{
			List<SpmtPrfmncVO> list = spmtPrfmncService.selectSpmtPrfmncRegList(spmtPrfmncVO);
			resultMap.put(ComConstants.PROP_RESULT_LIST,list);

		}catch (Exception e){
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		}finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		return getSuccessResponseEntity(resultMap);
	}
	
    /**
     * 출하실적 변경 (by 포장번호)
     */
    @PostMapping(value = "/am/spmt/updateSpmtPrfmncByPckgList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
    public ResponseEntity<HashMap<String, Object>> updateSpmtPrfmncByPckgList(@RequestBody SpmtPrfmncComVO spmtPrfmncComVO, HttpServletRequest request) throws Exception {

        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        try {

            spmtPrfmncComVO.setSysFrstInptUserId(getUserId());
            spmtPrfmncComVO.setSysFrstInptPrgrmId(getPrgrmId());
            spmtPrfmncComVO.setSysLastChgUserId(getUserId());
            spmtPrfmncComVO.setSysLastChgPrgrmId(getPrgrmId());

            HashMap<String, Object> rtnObj = spmtPrfmncService.updateSpmtPrfmncByPckgList(spmtPrfmncComVO);
            if(rtnObj != null) {
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
        
        resultMap.put(ComConstants.PROP_RESULT_MAP, spmtPrfmncComVO);
        
        return getSuccessResponseEntity(resultMap);
    }
	@PostMapping(value = "/am/spmt/reconciliationDaliySpmt.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateSpmtPrfmncByPckgList(@RequestBody Map<String, Object> data, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		try{
			SortInvntrVO sortInvntrVO = mapper.convertValue(data.get("sortData"), SortInvntrVO.class);
			SpmtPrfmncVO spmtPrfmncVO = mapper.convertValue(data.get("spmtData"), SpmtPrfmncVO.class);

			/** 공통 세팅 **/
			sortInvntrVO.setSysFrstInptUserId(getUserId());
			sortInvntrVO.setSysFrstInptPrgrmId(getPrgrmId());
			sortInvntrVO.setSysLastChgUserId(getUserId());
			sortInvntrVO.setSysLastChgPrgrmId(getPrgrmId());

			spmtPrfmncVO.setSysFrstInptUserId(getUserId());
			spmtPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
			spmtPrfmncVO.setSysLastChgUserId(getUserId());
			spmtPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());

			HashMap<String, Object> rtnObj = spmtPrfmncService.reconciliationDaliySpmt(sortInvntrVO,spmtPrfmncVO);
			if(rtnObj != null){
				return getErrorResponseEntity(rtnObj);
			}


		}catch (Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return getSuccessResponseEntity(resultMap);
	}
	// 출하실적 간편등록 포장, 출하
	@PostMapping(value = "/am/spmt/insertSpmtPrfmncByPckg.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSpmtPrfmncByPckg(@RequestBody List<SpmtPrfmncComVO> list, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String[] spmtNos;
		try {
			for(SpmtPrfmncComVO spmtPrfmncComVO : list){
				spmtPrfmncComVO.setSysFrstInptUserId(getUserId());
				spmtPrfmncComVO.setSysFrstInptPrgrmId(getPrgrmId());
				spmtPrfmncComVO.setSysLastChgUserId(getUserId());
				spmtPrfmncComVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = spmtPrfmncService.insertSpmtPrfmncByPckg(list);
			if(rtnObj == null) {
				return getErrorResponseEntity(rtnObj);
			}
			spmtNos = (String[])rtnObj.get("resultList");

		} catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, spmtNos);
		return getSuccessResponseEntity(resultMap);
	}
	@PostMapping(value = "/am/spmt/selectSpmtPrfmncDetailList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtPrfmncDetailList(@RequestBody SpmtPrfmncVO spmtPrfmncVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<SpmtPrfmncVO> resultList = new ArrayList<>();
		try{
			resultList = spmtPrfmncService.selectSpmtPrfmncDetailList(spmtPrfmncVO);
		} catch (Exception e){
			return getErrorResponseEntity(e);
		} finally{
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if(rtnObj != null){
				return getErrorResponseEntity(rtnObj);
			}
		}
	resultMap.put(ComConstants.PROP_RESULT_LIST,resultList);
		return getSuccessResponseEntity(resultMap);
	}




	@PostMapping(value = "/am/spmt/selectSpmtDtlPrfmncListForCryn.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtDtlPrfmncListForCryn(@RequestBody SpmtPrfmncVO spmtPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<>();
		HashMap<String, Object> rtnObj = null;

		List<SpmtPrfmncVO> resultList = new ArrayList<>();
		try{
			resultList = spmtPrfmncService.selectSpmtDtlPrfmncListForCryn(spmtPrfmncVO);
		} catch (Exception e){
			return getErrorResponseEntity(e);
		} finally {
			rtnObj = setMenuComLog(request);
		}

		if (rtnObj != null){
			return getErrorResponseEntity(rtnObj);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST,resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//출하실적간편조회
	@PostMapping(value = "/am/spmt/selectSpmtPrfmncReg.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtPrfmncReg(@RequestBody SpmtPrfmncVO spmtPrfmncVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try{
			List<SpmtPrfmncVO> list = spmtPrfmncService.selectSpmtPrfmncReg(spmtPrfmncVO);
			resultMap.put(ComConstants.PROP_RESULT_LIST,list);

		}catch (Exception e){
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
			return getErrorResponseEntity(e);
		}finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/spmt/insertSpmtPrfmnWithList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSpmtPrfmnWithList(@RequestBody List<SpmtPrfmncComVO> spmtPrfmncComList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {

			for (SpmtPrfmncComVO spmtPrfmncComVO : spmtPrfmncComList) {
				spmtPrfmncComVO.setSysFrstInptUserId(getUserId());
				spmtPrfmncComVO.setSysFrstInptPrgrmId(getPrgrmId());
				spmtPrfmncComVO.setSysLastChgUserId(getUserId());
				spmtPrfmncComVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			HashMap<String, Object> rtnObj = spmtMngService.insertSpmtPrfmncWithList(spmtPrfmncComList);
			if(rtnObj != null) {
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
//		resultMap.put(ComConstants.PROP_RESULT_MAP,spmtPrfmncComList.get(0));
		return getSuccessResponseEntity(resultMap);
	}

	// 출하실적 등록
	@PostMapping(value = "/am/spmt/insertSpmtRsltMonthly.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSpmtRsltMonthly(@RequestBody List<SpmtPrfmncComVO> spmtPrfmncComList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			for (SpmtPrfmncComVO spmtPrfmncComVO : spmtPrfmncComList) {
				spmtPrfmncComVO.setSysFrstInptUserId(getUserId());
				spmtPrfmncComVO.setSysFrstInptPrgrmId(getPrgrmId());
				spmtPrfmncComVO.setSysLastChgUserId(getUserId());
				spmtPrfmncComVO.setSysLastChgPrgrmId(getPrgrmId());
				spmtPrfmncComVO.setSpmtFrcdPrcsYn(ComConstants.CON_YES);
//				spmtPrfmncComVO.setNeedsPckgYn(ComConstants.CON_YES);
//				spmtPrfmncComVO.setInvntrSttsCd(AmConstants.CON_INVNTR_STTS_CD_SPMT_BELOW_ZERO);
			}

			HashMap<String, Object> rtnObj = spmtMngService.insertSpmtPrfmncWithList(spmtPrfmncComList);
			if(rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}

		}catch (Exception e) {
			logger.debug(ComConstants.ERROR_CODE, e.getMessage());
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
