package com.at.apcss.fm.clt.web;

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
import com.at.apcss.fm.clt.service.CltvtnEngttSptMngService;
import com.at.apcss.fm.clt.vo.CltvtnEngttSptMngVO;


/**
 * @Class Name : CltvtnEngttSptMngController.java
 * @Description : 재배약정현장관리에 대한 Controller 클래스
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
public class CltvtnEngttSptMngController extends BaseController {


	// 재배약정현장관리에
	@Resource(name= "cltvtnEngttSptMngService")
	private CltvtnEngttSptMngService cltvtnEngttSptMngService;

	// 재배약정현장관리에 화면이동
	@GetMapping("/fm/clt/cltvtnEngttSptMng.do")
	public String doCltvtnEngttSptMng() {
		return "apcss/fm/clt/cltvtnEngttSptMng";
	}

	// 재배약정현장관리에 조회
	@PostMapping(value = "/fm/clt/selectCltvtnEngttSptMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody CltvtnEngttSptMngVO cltvtnEngttSptMngVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<CltvtnEngttSptMngVO> resultList = new ArrayList<>();

		try {
			 resultList = cltvtnEngttSptMngService.selectCltvtnEngttSptMngList(cltvtnEngttSptMngVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (CltvtnEngttSptMngVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 재배약정현장관리에 등록
	@PostMapping(value = "/fm/clt/insertCltvtnEngttSptMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertCltvtnEngttSptMng(@RequestBody CltvtnEngttSptMngVO cltvtnEngttSptMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		cltvtnEngttSptMngVO.setSysFrstInptUserId(getUserId());
		cltvtnEngttSptMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		cltvtnEngttSptMngVO.setSysLastChgUserId(getUserId());
		cltvtnEngttSptMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = cltvtnEngttSptMngService.insertCltvtnEngttSptMng(cltvtnEngttSptMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 재배약정현장관리에 변경
	@PostMapping(value = "/fm/clt/updateCltvtnEngttSptMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateCltvtnEngttSptMng(@RequestBody CltvtnEngttSptMngVO cltvtnEngttSptMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		cltvtnEngttSptMngVO.setSysFrstInptUserId(getUserId());
		cltvtnEngttSptMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		cltvtnEngttSptMngVO.setSysLastChgUserId(getUserId());
		cltvtnEngttSptMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = cltvtnEngttSptMngService.updateCltvtnEngttSptMng(cltvtnEngttSptMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 재배약정현장관리에 삭제
	@PostMapping(value = "/fm/clt/deleteCltvtnEngttSptMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteCltvtnEngttSptMng(@RequestBody CltvtnEngttSptMngVO cltvtnEngttSptMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		cltvtnEngttSptMngVO.setSysLastChgUserId(getUserId());
		cltvtnEngttSptMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = cltvtnEngttSptMngService.deleteCltvtnEngttSptMng(cltvtnEngttSptMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 재배약정현장관리에 목록 삭제
	@PostMapping(value = "/fm/clt/deleteCltvtnEngttSptMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteCltvtnEngttSptMngList(@RequestBody List<CltvtnEngttSptMngVO> cltvtnEngttSptMngList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (CltvtnEngttSptMngVO cltvtnEngttSptMngVO : cltvtnEngttSptMngList ) {
			cltvtnEngttSptMngVO.setSysLastChgUserId(getUserId());
			cltvtnEngttSptMngVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = cltvtnEngttSptMngService.deleteCltvtnEngttSptMngList(cltvtnEngttSptMngList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}