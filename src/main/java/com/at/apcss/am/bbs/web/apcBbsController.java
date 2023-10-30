package com.at.apcss.am.bbs.web;

import java.net.HttpURLConnection;
import java.net.URL;
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
import com.at.apcss.am.bbs.service.apcBbsService;
import com.at.apcss.am.bbs.vo.apcBbsCmntVO;
import com.at.apcss.am.bbs.vo.apcBbsVO;


import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;


/**
 * @Class Name : BbsController.java
 * @Description : 게시판 대한 Controller 클래스
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
public class apcBbsController extends BaseController {


	// 게시판
	@Resource(name= "apcBbsService")
	private apcBbsService bbsService;

	// 게시판 화면이동
	@GetMapping("/am/bbs/bbs.do")
	public String doBbs() {
		return "apcss/am/bbs/bbs";
	}

	// 게시판 조회
	@PostMapping(value = "/am/bbs/selectBbsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectMenuList(Model model, @RequestBody apcBbsVO apcBbsVO, HttpServletRequest request) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<apcBbsVO> resultList = new ArrayList<>();

		try {
			 resultList = bbsService.selectBbsList(apcBbsVO);

			 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
			 for (apcBbsVO bbs : resultList ) {
				 logger.debug("bbsTitle : {}", bbs.getBbsTitle());
				 logger.debug("sysFrstInptUserIdNm : {}", bbs.getSysFrstInptUserIdNm());
			 }

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

		return getSuccessResponseEntity(resultMap);
	}
	// 게시판 등록
	@PostMapping(value = "/am/bbs/insertBbs.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> insertBbs(@RequestBody apcBbsVO apcBbsVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		apcBbsVO.setSysFrstInptUserId(getUserId());
		apcBbsVO.setSysFrstInptPrgrmId(getPrgrmId());
		apcBbsVO.setSysLastChgUserId(getUserId());
		apcBbsVO.setSysLastChgPrgrmId(getPrgrmId());

		int insertedCnt = 0;

		try {
			insertedCnt = bbsService.insertBbs(apcBbsVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

		return getSuccessResponseEntity(resultMap);
	}


	// 게시판 변경
	@PostMapping(value = "/am/bbs/updateBbs.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> updateBbs(@RequestBody apcBbsVO apcBbsVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		apcBbsVO.setSysLastChgUserId(getUserId());
		apcBbsVO.setSysLastChgPrgrmId(getPrgrmId());

		int updatedCnt = 0;

		try {
			updatedCnt = bbsService.updateBbs(apcBbsVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_UPDATED_CNT, updatedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 게시판 삭제
	@PostMapping(value = "/am/bbs/deleteBbs.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteBbs(@RequestBody apcBbsVO apcBbsVO, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		apcBbsVO.setSysLastChgUserId(getUserId());
		apcBbsVO.setSysLastChgPrgrmId(getPrgrmId());

		int deletedCnt = 0;

		try {
			deletedCnt = bbsService.deleteBbs(apcBbsVO);
			deletedCnt = bbsService.deleteBbsAllCmnt(apcBbsVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	// 게시판 목록 삭제
	@PostMapping(value = "/am/bbs/deleteBbsList.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteBbsList(@RequestBody List<apcBbsVO> bbsList, HttpServletRequest requset) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// validation check

		// audit 항목
		for (apcBbsVO apcBbsVO : bbsList ) {
			apcBbsVO.setSysLastChgUserId(getUserId());
			apcBbsVO.setSysLastChgPrgrmId(getPrgrmId());
		}

		int deletedCnt = 0;

		try {
			deletedCnt = bbsService.deleteBbsList(bbsList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_DELETED_CNT, deletedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	//게시판댓글등록
		@PostMapping(value = "/am/bbs/insertBbsCmnt.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertBbsCmnt(@RequestBody apcBbsCmntVO apcBbsCmntVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			apcBbsCmntVO.setSysFrstInptUserId(getUserId());
			apcBbsCmntVO.setSysFrstInptPrgrmId(getPrgrmId());
			apcBbsCmntVO.setSysLastChgUserId(getUserId());
			apcBbsCmntVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;
			String cmntSeNum = apcBbsCmntVO.getCmntChildNo();
			try {

					insertedCnt = bbsService.insertBbsCmnt(apcBbsCmntVO);

			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}
		//게시판대댓글등록
		@PostMapping(value = "/am/bbs/insertBbsChildCmnt.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> insertBbsChildCmnt(@RequestBody apcBbsCmntVO apcBbsCmntVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목
			apcBbsCmntVO.setSysFrstInptUserId(getUserId());
			apcBbsCmntVO.setSysFrstInptPrgrmId(getPrgrmId());
			apcBbsCmntVO.setSysLastChgUserId(getUserId());
			apcBbsCmntVO.setSysLastChgPrgrmId(getPrgrmId());

			int insertedCnt = 0;
			String cmntSeNum = apcBbsCmntVO.getCmntChildNo();
			try {

					insertedCnt = bbsService.insertBbsChildCmnt(apcBbsCmntVO);

			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}
		//게시판댓글삭제
		@PostMapping(value = "/am/bbs/deleteCmntBbs.do", consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> deleteBbsCmnt(@RequestBody apcBbsCmntVO apcBbsCmntVO, HttpServletRequest requset) throws Exception{
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			// validation check

			// audit 항목


			int insertedCnt = 0;

			try {
				insertedCnt = bbsService.deleteBbsCmnt(apcBbsCmntVO);
			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_INSERTED_CNT, insertedCnt);

			return getSuccessResponseEntity(resultMap);
		}
		//게시판댓글조회
		@PostMapping(value = "/am/bbs/selectBbsCmntList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
		public ResponseEntity<HashMap<String, Object>> selectBbsCmntList(Model model, @RequestBody apcBbsVO apcBbsVO, HttpServletRequest request) throws Exception{

			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			List<apcBbsCmntVO> resultList = new ArrayList<>();

			try {
				 resultList = bbsService.selectBbsCmntList(apcBbsVO);

				 logger.debug("$$$$$$$$$$$$$$$$$$$$$");
				 for (apcBbsCmntVO bbs : resultList ) {
					 logger.debug("bbsTitle : {}", bbs.getBbsNo());
					 logger.debug("sysFrstInptUserIdNm : {}", bbs.getSysFrstInptUserIdNm());
				 }

			} catch (Exception e) {
				logger.debug(e.getMessage());
				return getErrorResponseEntity(e);
			}

			resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);

			return getSuccessResponseEntity(resultMap);
		}


}