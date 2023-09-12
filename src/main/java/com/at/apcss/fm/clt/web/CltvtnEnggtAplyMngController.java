package com.at.apcss.fm.clt.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.fm.clt.service.CltvtnEnggtAplyMngService;
import com.at.apcss.fm.clt.vo.CltvtnApcItemVO;
import com.at.apcss.fm.clt.vo.CltvtnEnggtAplyMngVO;


/**
 * @Class Name : CltvtnEnggtAplyMngController.java
 * @Description : 재배약정신청관리에 대한 Controller 클래스
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
public class CltvtnEnggtAplyMngController extends BaseController {


	// 재배약정신청관리
	@Resource(name= "cltvtnEnggtAplyMngService")
	private CltvtnEnggtAplyMngService cltvtnEnggtAplyMngService;

	// 재배약정신청관리 화면이동
	@RequestMapping("/fm/clt/cltvtnEnggtAplyMng.do")
	public String doCltvtnEnggtAplyMng() {
		return "apcss/fm/clt/cltvtnEnggtAplyMng";
	}

	// 제배약정신청관리 조회
	@PostMapping(value = "/fm/clt/selectCltvtnEnggtAplyMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<CltvtnEnggtAplyMngVO> resultList = new ArrayList<>();

		try {
			 resultList = cltvtnEnggtAplyMngService.selectCltvtnEnggtAplyMngList(cltvtnEnggtAplyMngVO);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 제배약정신청관리 등록
	@PostMapping(value = "/fm/clt/insertCltvtnEnggtAplyMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCltvtnEnggtAplyMng(@RequestBody CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO, HttpServletRequest requset) throws Exception{
		logger.info("================insertCltvtnEnggtAplyMng===================");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		cltvtnEnggtAplyMngVO.setSysFrstInptUserId(getUserId());
		cltvtnEnggtAplyMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		cltvtnEnggtAplyMngVO.setSysLastChgUserId(getUserId());
		cltvtnEnggtAplyMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = cltvtnEnggtAplyMngService.insertCltvtnEnggtAplyMng(cltvtnEnggtAplyMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 제배약정신청관리 변경
	@PostMapping(value = "/fm/clt/updateCltvtnEnggtAplyMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateCltvtnEnggtAplyMng(@RequestBody CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		cltvtnEnggtAplyMngVO.setSysLastChgUserId(getUserId());
		cltvtnEnggtAplyMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = cltvtnEnggtAplyMngService.updateCltvtnEnggtAplyMng(cltvtnEnggtAplyMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 제배약정신청관리 삭제
	@PostMapping(value = "/fm/clt/deleteCltvtnEnggtAplyMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteCltvtnEnggtAplyMng(@RequestBody List<CltvtnEnggtAplyMngVO> list, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for(CltvtnEnggtAplyMngVO vo : list) {
			vo.setDelYn("Y");
			vo.setSysLastChgUserId(getUserId());
			vo.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = cltvtnEnggtAplyMngService.deleteCltvtnEnggtAplyMngList(list);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 제배약정신청관리 목록 삭제
	@PostMapping(value = "/fm/clt/deleteCltvtnEnggtAplyMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteCltvtnEnggtAplyMngList(@RequestBody List<CltvtnEnggtAplyMngVO> cltvtnEnggtAplyMngList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (CltvtnEnggtAplyMngVO cltvtnEnggtAplyMngVO : cltvtnEnggtAplyMngList ) {
			cltvtnEnggtAplyMngVO.setSysLastChgUserId(getUserId());
			cltvtnEnggtAplyMngVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = cltvtnEnggtAplyMngService.deleteCltvtnEnggtAplyMngList(cltvtnEnggtAplyMngList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	//재배약정신청관리 > APC 조회 팝업
	@PostMapping(value = "/fm/clt/selectApcListPopup.do", consumes = { MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE })
	public ResponseEntity<HashMap<String, Object>> selectApcListPopup(@RequestBody CltvtnApcItemVO vo, HttpServletRequest request) throws Exception {

		logger.debug("selectApcListPopup 호출 <><><><> ");
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<CltvtnApcItemVO> resultList = new ArrayList<>();

		try {

			resultList = cltvtnEnggtAplyMngService.selectApcList(vo);

		} catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
}