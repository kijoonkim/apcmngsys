package com.at.apcss.fm.spmt.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.spmt.service.SpmtEnggtRsltMngService;
import com.at.apcss.fm.spmt.vo.SpmtEnggtRsltMngVO;


/**
 * @Class Name : SpmtEnggtRsltMngController.java
 * @Description : 출하약정실적관리에 대한 Controller 클래스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Controller
public class SpmtEnggtRsltMngController extends BaseController {


	// 출하약정관리
	@Resource(name= "spmtEnggtRsltMngService")
	private SpmtEnggtRsltMngService spmtEnggtRsltMngService;

	// 출하약정관리 화면이동
	@GetMapping("/fm/spmt/spmtEnggtRsltMng.do")
	public String doSpmtEnggtRsltMng() {
		return "apcss/fm/spmt/spmtEnggtRsltMng";
	}


	// 출하약정관리 조회
	@PostMapping(value = "/fm/spmt/selectSpmtEnggtRsltMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody SpmtEnggtRsltMngVO spmtEnggtRsltMngVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SpmtEnggtRsltMngVO> resultList = new ArrayList<>();

		try {
			 resultList = spmtEnggtRsltMngService.selectSpmtEnggtRsltMngList(spmtEnggtRsltMngVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (SpmtEnggtRsltMngVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 출하약정관리 등록
	@PostMapping(value = "/fm/spmt/insertSpmtEnggtRsltMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertSpmtEnggtRsltMng(@RequestBody SpmtEnggtRsltMngVO spmtEnggtRsltMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		spmtEnggtRsltMngVO.setSysFrstInptUserId(getUserId());
		spmtEnggtRsltMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		spmtEnggtRsltMngVO.setSysLastChgUserId(getUserId());
		spmtEnggtRsltMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = spmtEnggtRsltMngService.insertSpmtEnggtRsltMng(spmtEnggtRsltMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 출하약정관리 변경
	@PostMapping(value = "/fm/spmt/updateSpmtEnggtRsltMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateSpmtEnggtRsltMng(@RequestBody SpmtEnggtRsltMngVO spmtEnggtRsltMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		spmtEnggtRsltMngVO.setSysLastChgUserId(getUserId());
		spmtEnggtRsltMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = spmtEnggtRsltMngService.updateSpmtEnggtRsltMng(spmtEnggtRsltMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 출하약정관리 삭제
	@PostMapping(value = "/fm/spmt/deleteSpmtEnggtRsltMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteSpmtEnggtRsltMng(@RequestBody SpmtEnggtRsltMngVO spmtEnggtRsltMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		spmtEnggtRsltMngVO.setSysLastChgUserId(getUserId());
		spmtEnggtRsltMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = spmtEnggtRsltMngService.deleteSpmtEnggtRsltMng(spmtEnggtRsltMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 출하약정관리 목록 삭제
	@PostMapping(value = "/fm/spmt/deleteSpmtEnggtRsltMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteSpmtEnggtRsltMngList(@RequestBody List<SpmtEnggtRsltMngVO> spmtEnggtRsltMngList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (SpmtEnggtRsltMngVO spmtEnggtRsltMngVO : spmtEnggtRsltMngList ) {
			spmtEnggtRsltMngVO.setSysLastChgUserId(getUserId());
			spmtEnggtRsltMngVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = spmtEnggtRsltMngService.deleteSpmtEnggtRsltMngList(spmtEnggtRsltMngList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}