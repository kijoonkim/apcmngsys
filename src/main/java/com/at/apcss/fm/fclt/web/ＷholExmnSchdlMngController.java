package com.at.apcss.fm.fclt.web;

import java.util.ArrayList;
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
import com.at.apcss.fm.fclt.service.ＷholExmnSchdlMngService;
import com.at.apcss.fm.fclt.vo.ＷholExmnSchdlMngVO;


/**
 * @Class Name : ＷholExmnSchdlMngController.java
 * @Description : 전수조사일정관리에 대한 Controller 클래스
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
public class ＷholExmnSchdlMngController extends BaseController {


	// 전수조사일정관리
	@Resource(name= "wholExmnSchdlMngService")
	private ＷholExmnSchdlMngService wholExmnSchdlMngService;

	// 전수조사일정관리 화면이동
	@RequestMapping("/fm/fclt/wholExmnSchdlMng.do")
	public String doＷholExmnSchdlMng() {
		return "apcss/fm/fclt/wholExmnSchdlMng";
	}

	// 전수조사일정관리 조회
	@PostMapping(value = "/fm/fclt/selectＷholExmnSchdlMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody ＷholExmnSchdlMngVO wholExmnSchdlMngVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<ＷholExmnSchdlMngVO> resultList = new ArrayList<>();

		try {
			 resultList = wholExmnSchdlMngService.selectＷholExmnSchdlMngList(wholExmnSchdlMngVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (ＷholExmnSchdlMngVO msg : resultList ) {
				 logger.debug("msgCn : {}", msg.getMsgCn());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}

	// 전수조사일정관리 등록
	@PostMapping(value = "/fm/fclt/insertＷholExmnSchdlMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertＷholExmnSchdlMng(@RequestBody ＷholExmnSchdlMngVO wholExmnSchdlMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		wholExmnSchdlMngVO.setSysFrstInptUserId(getUserId());
		wholExmnSchdlMngVO.setSysFrstInptPrgrmId(getPrgrmId());
		wholExmnSchdlMngVO.setSysLastChgUserId(getUserId());
		wholExmnSchdlMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = wholExmnSchdlMngService.insertＷholExmnSchdlMng(wholExmnSchdlMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 전수조사일정관리 변경
	@PostMapping(value = "/fm/fclt/updateＷholExmnSchdlMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateＷholExmnSchdlMng(@RequestBody ＷholExmnSchdlMngVO wholExmnSchdlMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		wholExmnSchdlMngVO.setSysLastChgUserId(getUserId());
		wholExmnSchdlMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = wholExmnSchdlMngService.updateＷholExmnSchdlMng(wholExmnSchdlMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 전수조사일정관리 삭제
	@PostMapping(value = "/fm/fclt/deleteＷholExmnSchdlMng.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteＷholExmnSchdlMng(@RequestBody ＷholExmnSchdlMngVO wholExmnSchdlMngVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		wholExmnSchdlMngVO.setSysLastChgUserId(getUserId());
		wholExmnSchdlMngVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = wholExmnSchdlMngService.deleteＷholExmnSchdlMng(wholExmnSchdlMngVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 전수조사일정관리 목록 삭제
	@PostMapping(value = "/fm/fclt/deleteＷholExmnSchdlMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteＷholExmnSchdlMngList(@RequestBody List<ＷholExmnSchdlMngVO> wholExmnSchdlMngList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (ＷholExmnSchdlMngVO wholExmnSchdlMngVO : wholExmnSchdlMngList ) {
			wholExmnSchdlMngVO.setSysLastChgUserId(getUserId());
			wholExmnSchdlMngVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = wholExmnSchdlMngService.deleteＷholExmnSchdlMngList(wholExmnSchdlMngList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}
}