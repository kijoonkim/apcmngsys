package com.at.apcss.am.cmns.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.at.apcss.am.cmns.vo.ApcItemCrtrDtlVO;
import com.at.apcss.am.cmns.vo.ApcSeedCrtrVO;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.am.cmns.service.CmnsItemService;
import com.at.apcss.am.cmns.vo.CmnsItemVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : CmnsItemController.java
 * @Description : 품목 정보관리에 대한 Controller 클래스
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
public class CmnsItemController extends BaseController {

	@Resource(name = "cmnsItemService")
	private CmnsItemService cmnsItemService;

	// APC 환경설정 - 품목 단건 조회
	@PostMapping(value = "/am/cmns/selectCmnsApcItem.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCmnsApcItem(@RequestBody CmnsItemVO cmnsItemVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		CmnsItemVO resultVO = new CmnsItemVO();

		try {

			resultVO = cmnsItemService.selectCmnsApcItem(cmnsItemVO);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}

		resultMap.put(ComConstants.PROP_RESULT_MAP, resultVO);

		return getSuccessResponseEntity(resultMap);
	}

	// APC 환경설정 - 품목 목록 조회
	@PostMapping(value = "/am/cmns/selectCmnsItemList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectCmnsItemList(@RequestBody CmnsItemVO cmnsItemVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsItemVO> resultList = new ArrayList<>();

		try {

			resultList = cmnsItemService.selectCmnsItemList(cmnsItemVO);

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

	// APC 환경설정 - APC 품목 목록 조회
	@PostMapping(value = "/am/cmns/selectApcCmnsItemList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcCmnsItemList(@RequestBody CmnsItemVO cmnsItemVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsItemVO> resultList = new ArrayList<>();

		try {

			resultList = cmnsItemService.selectApcCmnsItemList(cmnsItemVO);

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

	// APC 환경설정 - APC 품목 등록
	@PostMapping(value = "/am/cmns/insertApcCmnsItem.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertApcCmnsItem(@RequestBody CmnsItemVO cmnsItemVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			cmnsItemVO.setSysFrstInptPrgrmId(getPrgrmId());
			cmnsItemVO.setSysFrstInptUserId(getUserId());
			cmnsItemVO.setSysLastChgPrgrmId(getPrgrmId());
			cmnsItemVO.setSysLastChgUserId(getUserId());

			HashMap<String, Object> rtnObj = cmnsItemService.insertCmnsItem(cmnsItemVO);
			if(rtnObj != null) {
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

	// APC 환경설정 - APC 품목 삭제
	@PostMapping(value = "/am/cmns/deleteApcCmnsItem.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteApcCmnsItem(@RequestBody CmnsItemVO cmnsItemVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			HashMap<String, Object> rtnObj = cmnsItemService.deleteCmnsItem(cmnsItemVO);

			if(rtnObj != null) {
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

	// APC 환경설정 - APC 품목 정보 변경
	@PostMapping(value = "/am/cmns/updateApcCmnsItem.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateApcCmnsItem(@RequestBody CmnsItemVO cmnsItemVO, HttpServletRequest request) throws Exception {

		int updatedCnt = 0;

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			cmnsItemVO.setSysLastChgPrgrmId(getPrgrmId());
			cmnsItemVO.setSysLastChgUserId(getUserId());
			updatedCnt = cmnsItemService.updateApcCmnsItem(cmnsItemVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}
	
	@PostMapping(value = "/am/cmns/selectApcItemCrtrDtlList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	    public ResponseEntity<HashMap<String, Object>> selectApcItemCrtrDtlList(@RequestBody ApcItemCrtrDtlVO apcItemCrtrDtlVO, HttpServletRequest request) throws Exception {
	        HashMap<String, Object> resultMap = new HashMap<String, Object>();
			ArrayList<ApcItemCrtrDtlVO> resultList = new ArrayList<>();
	        try{
				resultList = cmnsItemService.selectApcItemCrtrDtlList(apcItemCrtrDtlVO);
	            
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

	@PostMapping(value = "/am/cmns/selectApcSeedCrtrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectApcSeedCrtrList(@RequestBody ApcSeedCrtrVO apcSeedCrtrVO, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		ArrayList<ApcSeedCrtrVO> resultList = new ArrayList<>();
		try{
			resultList = cmnsItemService.selectApcSeedCrtrList(apcSeedCrtrVO);

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

	@PostMapping(value = "/am/cmns/mergeApcItemCrtrDtlList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	    public ResponseEntity<HashMap<String, Object>> mergeApcItemCrtrDtlList(@RequestBody List<ApcItemCrtrDtlVO> apcItemCrtrDtlList, HttpServletRequest request) throws Exception {
	        HashMap<String, Object> resultMap = new HashMap<String, Object>();
			int resultCnt = 0;
	        try{
				setComVOFields(apcItemCrtrDtlList);
				resultCnt = cmnsItemService.mergeApcItemCrtrDtlList(apcItemCrtrDtlList);
	        }catch (Exception e) {
	            return getErrorResponseEntity(e);
	        } finally {
	            HashMap<String, Object> rtnObj = setMenuComLog(request);
	            if (rtnObj != null) {
	                return getErrorResponseEntity(rtnObj);
	            }
	        }
			resultMap.put(ComConstants.PROP_RESULT_CNT,resultCnt);
	        return getSuccessResponseEntity(resultMap);
	    }

	@PostMapping(value = "/am/cmns/mergeSeedCrtrList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> mergeSeedCrtrList(@RequestBody List<ApcSeedCrtrVO> apcSeedCrtrVOList, HttpServletRequest request) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int resultCnt = 0;
		try{
			setComVOFields(apcSeedCrtrVOList);
			resultCnt = cmnsItemService.mergeSeedCrtrList(apcSeedCrtrVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		} finally {
			HashMap<String, Object> rtnObj = setMenuComLog(request);
			if (rtnObj != null) {
				return getErrorResponseEntity(rtnObj);
			}
		}
		resultMap.put(ComConstants.PROP_RESULT_CNT,resultCnt);
		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/am/cmns/deleteApcItemCrtrDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	    public ResponseEntity<HashMap<String, Object>> deleteApcItemCrtrDtl(@RequestBody ApcItemCrtrDtlVO apcItemCrtrDtlVO, HttpServletRequest request) throws Exception {
	        HashMap<String, Object> resultMap = new HashMap<String, Object>();
			int deleteCnt = 0;
	        try{
	            deleteCnt = cmnsItemService.deleteApcItemCrtrDtl(apcItemCrtrDtlVO);
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
	@PostMapping(value = "/am/cmns/deleteSeedCrtr.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	    public ResponseEntity<HashMap<String, Object>> deleteSeedCrtr(@RequestBody ApcSeedCrtrVO apcSeedCrtrVO, HttpServletRequest request) throws Exception {
	        HashMap<String, Object> resultMap = new HashMap<String, Object>();
			int deleteCnt = 0;
	        try{
				deleteCnt = cmnsItemService.deleteSeedCrtr(apcSeedCrtrVO);
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

	@PostMapping(value = "/am/cmns/selectVrtyItemDtlList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectItemVrtyDtlList(@RequestBody CmnsItemVO cmnsItemVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsItemVO> resultList = new ArrayList<>();

		try {
			resultList = cmnsItemService.selectItemVrtyDtlList(cmnsItemVO);
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

	@PostMapping(value = "/am/cmns/selectVrtyByItemCd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectVrtyByItemCd(@RequestBody CmnsItemVO cmnsItemVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CmnsItemVO> resultList = new ArrayList<>();

		try {
			resultList = cmnsItemService.selectVrtyByItemCd(cmnsItemVO);
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
}
