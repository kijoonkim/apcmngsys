package com.at.apcss.am.cmns.web;

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

import com.at.apcss.am.cmns.service.BffaSortService;
import com.at.apcss.am.cmns.vo.BffaSortVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;

/**
 * @Class Name : CnptController.java
 * @Description : 상품 정보관리에 대한 Controller 클래스
 * @author 하민우
 * @since 2023.09.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.11  하민우        최초 생성
 * </pre>
 */
@Controller
public class bffaSortController extends BaseController {

	@Resource(name = "bffaSortService")
	private BffaSortService bffaSortService;


	// APC 환경설정 - 육안등급유형 조회
	@PostMapping(value = "/am/cmns/selectBffaSortTypeList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectBffaSortTypeList(@RequestBody BffaSortVO bffaSortVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<BffaSortVO> resultList = new ArrayList<>();
		try {
			resultList = bffaSortService.selectBffaSortTypeList(bffaSortVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	// APC 환경설정 - 육안등급종류 조회
	@PostMapping(value = "/am/cmns/selectBffaSortKndList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectBffaSortKndList(@RequestBody BffaSortVO bffaSortVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<BffaSortVO> resultList = new ArrayList<>();
		try {
			resultList = bffaSortService.selectBffaSortKndList(bffaSortVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	
	// APC 환경설정 - 육안등급상세 조회
	@PostMapping(value = "/am/cmns/selectBffaSortDtlList.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectBffaSortDtlList(@RequestBody BffaSortVO bffaSortVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<BffaSortVO> resultList = new ArrayList<>();
		try {
			resultList = bffaSortService.selectBffaSortDtlList(bffaSortVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	//APC 환경설정 - 육안등급종류 등록
	@PostMapping(value = "/am/cmns/saveBffaSort.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> saveBffaSort(@RequestBody List<BffaSortVO> insertList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int insertedCnt = 0;
		try {
			for ( BffaSortVO bffaSortVO : insertList ) {
				bffaSortVO.setSysFrstInptUserId(getUserId());
				bffaSortVO.setSysFrstInptPrgrmId(getPrgrmId());
				bffaSortVO.setSysLastChgUserId(getUserId());
				bffaSortVO.setSysLastChgPrgrmId(getPrgrmId());
				String status = bffaSortVO.getStatus();
				String type = bffaSortVO.getType();
				if(status.equals("2")) {
					if(type.equals("knd")) {
						bffaSortService.insertBffaSortKnd(bffaSortVO);
					}else if(type.equals("dtl")) {
						bffaSortService.insertBffaSortDtl(bffaSortVO);
					}
				}else if(status.equals("1")) {
					if(type.equals("knd")) {
						bffaSortService.updateBffaSortKnd(bffaSortVO);
					}else if(type.equals("dtl")) {
						bffaSortService.updateBffaSortDtl(bffaSortVO);
					}
				}
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	//APC 환경설정 - 육안등급종류 수정
	@PostMapping(value = "/am/cmns/updateBffaSortKnd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateBffaSortKnd(@RequestBody List<BffaSortVO> updateList, HttpServletRequest request) throws Exception {

		int updatedCnt = 0;
		try {
			for ( BffaSortVO bffaSortVO : updateList ) {
				bffaSortVO.setSysLastChgUserId(getUserId());
				bffaSortVO.setSysLastChgPrgrmId(getPrgrmId());
				updatedCnt += bffaSortService.updateBffaSortKnd(bffaSortVO);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		return getSuccessResponseEntity(resultMap);
	}

	//APC 환경설정 - 육안등급종류 삭제
	@PostMapping(value = "/am/cmns/deleteBffaSortKnd.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteBffaSortKnd(@RequestBody BffaSortVO bffaSortVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			bffaSortVO.setSysLastChgUserId(getUserId());
			bffaSortVO.setSysLastChgPrgrmId(getPrgrmId());
			result = bffaSortService.deleteBffaSortKnd(bffaSortVO);
			
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}
	
	//APC 환경설정 - 육안등급상세 등록
	@PostMapping(value = "/am/cmns/insertBffaSortDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> insertBffaSortDtl(@RequestBody List<BffaSortVO> insertList, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int insertedCnt = 0;
		try {
			for ( BffaSortVO bffaSortVO : insertList ) {
				bffaSortVO.setSysFrstInptUserId(getUserId());
				bffaSortVO.setSysFrstInptPrgrmId(getPrgrmId());
				bffaSortVO.setSysLastChgUserId(getUserId());
				bffaSortVO.setSysLastChgPrgrmId(getPrgrmId());
				insertedCnt += bffaSortService.insertBffaSortDtl(bffaSortVO);
			}

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}
	//APC 환경설정 - 육안등급상세 수정
	@PostMapping(value = "/am/cmns/updateBffaSortDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> updateBffaSortDtl(@RequestBody List<BffaSortVO> updateList, HttpServletRequest request) throws Exception {

		int updatedCnt = 0;
		try {
			for ( BffaSortVO bffaSortVO : updateList ) {
				bffaSortVO.setSysLastChgUserId(getUserId());
				bffaSortVO.setSysLastChgPrgrmId(getPrgrmId());
				updatedCnt += bffaSortService.updateBffaSortDtl(bffaSortVO);
			}
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);
		return getSuccessResponseEntity(resultMap);
	}
	
	//APC 환경설정 - 육안등급상세 삭제
	@PostMapping(value = "/am/cmns/deleteBffaSortDtl.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> deleteBffaSort(@RequestBody BffaSortVO bffaSortVO, HttpServletRequest request) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		try {
			bffaSortVO.setSysLastChgUserId(getUserId());
			bffaSortVO.setSysLastChgPrgrmId(getPrgrmId());
			result = bffaSortService.deleteBffaSortDtl(bffaSortVO);
		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put("result", result);

		return getSuccessResponseEntity(resultMap);
	}
}
