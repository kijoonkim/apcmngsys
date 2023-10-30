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
import com.at.apcss.fm.clt.vo.CltvtnEnggtAplyMngVO;
import com.at.apcss.fm.spmt.service.SpmtEnggtInfoMngService;
import com.at.apcss.fm.spmt.vo.SpmtEnggtInfoMngVO;


/**
 * @Class Name : SpmtEnggtInfoMngController.java
 * @Description : 출하약정관리에 대한 Controller 클래스
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
public class SpmtEnggtInfoMngController extends BaseController {


	// 출하약정관리
	@Resource(name= "spmtEnggtInfoMngService")
	private SpmtEnggtInfoMngService spmtEnggtInfoMngService;

	// 출하약정관리 화면이동
	@GetMapping("/fm/spmt/spmtEnggtInfoMng.do")
	public String doSpmtEnggtInfoMng() {
		return "apcss/fm/spmt/spmtEnggtInfoMng";
	}



	// 출하약정관리 조회
	@PostMapping(value = "/fm/spmt/selectSpmtEnggtInfoMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody SpmtEnggtInfoMngVO spmtEnggtInfoMngVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<SpmtEnggtInfoMngVO> resultList = new ArrayList<>();

		try {
			 resultList = spmtEnggtInfoMngService.selectSpmtEnggtInfoMngList(spmtEnggtInfoMngVO);


		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 출하약정관리 등록
	@PostMapping(value = "/fm/spmt/insertSpmtEnggtInfoMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertSpmtEnggtInfoMng(@RequestBody SpmtEnggtInfoMngVO spmtEnggtInfoMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		spmtEnggtInfoMngVO.setSysFrstInptUserId(getUserId());
		spmtEnggtInfoMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		spmtEnggtInfoMngVO.setSysLastChgUserId(getUserId());
		spmtEnggtInfoMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = spmtEnggtInfoMngService.insertSpmtEnggtInfoMng(spmtEnggtInfoMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 출하약정관리 변경
	@PostMapping(value = "/fm/spmt/updateSpmtEnggtInfoMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateSpmtEnggtInfoMng(@RequestBody SpmtEnggtInfoMngVO spmtEnggtInfoMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		spmtEnggtInfoMngVO.setSysLastChgUserId(getUserId());
		spmtEnggtInfoMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = spmtEnggtInfoMngService.updateSpmtEnggtInfoMng(spmtEnggtInfoMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	
	
	

	// 출하약정관리 삭제
	@PostMapping(value = "/fm/spmt/deleteSpmtEnggtInfoMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteSpmtEnggtInfoMng(@RequestBody List<SpmtEnggtInfoMngVO> list, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for(SpmtEnggtInfoMngVO vo : list) {
			vo.setDelYn("Y");
			vo.setSysLastChgUserId(getUserId());
			vo.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = spmtEnggtInfoMngService.deleteSpmtEnggtInfoMng(list);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 출하약정관리 목록 삭제
	@PostMapping(value = "/fm/spmt/deleteSpmtEnggtInfoMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteSpmtEnggtInfoMngList(@RequestBody List<SpmtEnggtInfoMngVO> spmtEnggtInfoMngList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (SpmtEnggtInfoMngVO spmtEnggtInfoMngVO : spmtEnggtInfoMngList ) {
			spmtEnggtInfoMngVO.setSysLastChgUserId(getUserId());
			spmtEnggtInfoMngVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = spmtEnggtInfoMngService.deleteSpmtEnggtInfoMngList(spmtEnggtInfoMngList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
	
}