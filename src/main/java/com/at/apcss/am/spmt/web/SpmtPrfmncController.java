package com.at.apcss.am.spmt.web;

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

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.spmt.service.SpmtPrfmncService;
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

	@Resource(name= "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;


	// 출하실적 조회
	@PostMapping(value = "/am/spmt/selectSpmtPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectSpmtPrfmncList(@RequestBody SpmtPrfmncVO SpmtPrfmncVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SpmtPrfmncVO> resultList = new ArrayList<>();
		try {
			resultList = spmtPrfmncService.selectSpmtPrfmncList(SpmtPrfmncVO);
		} catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}


	// 출하실적 등록
	@PostMapping(value = "/am/spmt/insertSpmtPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSpmtPrfmncList(@RequestBody List<SpmtPrfmncVO> SpmtPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int insertedCnt = 0;
		try {
			String spmtno = cmnsTaskNoService.selectSpmtno(SpmtPrfmncList.get(0).getApcCd(), SpmtPrfmncList.get(0).getSpmtYmd());

			for ( var i=0; i<SpmtPrfmncList.size(); i++ ) {
				SpmtPrfmncList.get(i).setSpmtno(spmtno);
				SpmtPrfmncList.get(i).setSysFrstInptUserId(getUserId());
				SpmtPrfmncList.get(i).setSysFrstInptPrgrmId(getPrgrmId());
				SpmtPrfmncList.get(i).setSysLastChgUserId(getUserId());
				SpmtPrfmncList.get(i).setSysLastChgPrgrmId(getPrgrmId());
			}

			insertedCnt = spmtPrfmncService.insertSpmtPrfmnc(SpmtPrfmncList);
			resultMap.put(ComConstants.PROP_INSERTED_CNT,  insertedCnt);

		}catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}

	// 출하대상내역 등록
	@PostMapping(value = "/am/spmt/insertSpmtTrgtDsctnList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertSpmtTrgtDsctnList(@RequestBody List<SpmtPrfmncVO> SpmtPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int insertedCnt = 0;
		try {
			String spmtno = cmnsTaskNoService.selectSpmtno(SpmtPrfmncList.get(0).getApcCd(), SpmtPrfmncList.get(0).getSpmtYmd());

			for ( var i=0; i<SpmtPrfmncList.size(); i++ ) {
				SpmtPrfmncList.get(i).setSpmtno(spmtno);
				SpmtPrfmncList.get(i).setSysFrstInptUserId(getUserId());
				SpmtPrfmncList.get(i).setSysFrstInptPrgrmId(getPrgrmId());
				SpmtPrfmncList.get(i).setSysLastChgUserId(getUserId());
				SpmtPrfmncList.get(i).setSysLastChgPrgrmId(getPrgrmId());
				insertedCnt = spmtPrfmncService.insertSpmtPrfmncCom(SpmtPrfmncList.get(i));
				insertedCnt = spmtPrfmncService.insertSpmtPrfmncDtl(SpmtPrfmncList.get(i));
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT,  insertedCnt);

		}catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
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
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}

	// 출하실적 삭제
	@PostMapping(value = "/am/spmt/deleteSpmtPrfmncList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteSpmtPrfmncList(@RequestBody List<SpmtPrfmncVO> SpmtPrfmncList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int deletedCnt = 0;
		try {

			for (SpmtPrfmncVO spmtPrfmncVO : SpmtPrfmncList) {
				spmtPrfmncVO.setSysFrstInptUserId(getUserId());
				spmtPrfmncVO.setSysFrstInptPrgrmId(getPrgrmId());
				spmtPrfmncVO.setSysLastChgUserId(getUserId());
				spmtPrfmncVO.setSysLastChgPrgrmId(getPrgrmId());
			}

			deletedCnt = spmtPrfmncService.deleteSpmtPrfmnc(SpmtPrfmncList);
			resultMap.put(ComConstants.PROP_DELETED_CNT,  deletedCnt);

		}catch (Exception e) {
			logger.debug("error: {}", e.getMessage());
			return getErrorResponseEntity(e);
		}
		return getSuccessResponseEntity(resultMap);
	}
}
