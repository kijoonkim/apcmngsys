package com.at.apcss.pd.dsm.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.dsm.vo.DocsSbmsnVO;
import com.at.apcss.pd.dsm.vo.DocsVO;
import com.at.apcss.pd.pcorm.vo.BizPlanRegFileVO;
import com.at.apcss.pd.pcorm.vo.BizPlanRegVO;

import egovframework.let.utl.fcc.service.EgovFileUploadUtil;

import com.at.apcss.pd.bsm.vo.UoListVO;
import com.at.apcss.pd.dsm.service.DocsSbmsnService;

@Controller
public class DocsSbmsnController extends BaseController{

	@Resource(name= "DocsSbmsnService")
	private DocsSbmsnService DocsSbmsnService;

	//화면이동
	@RequestMapping(value = "/pd/dsm/docsSbmsn.do")
	public String DocsSbmsn() {
		return "apcss/pd/dsm/docsSbmsn";
	}

	// 조회
	@PostMapping(value = "/pd/dsm/selectDocsSbmsnUoAprv.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectDocsSbmsnUoAprv(Model model, @RequestBody DocsSbmsnVO DocsSbmsnVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		DocsSbmsnVO result = new DocsSbmsnVO();

		try {
			result = DocsSbmsnService.selectDocsSbmsnUoAprv(DocsSbmsnVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_MAP, result);
		return getSuccessResponseEntity(resultMap);
	}

	// 조회
	@PostMapping(value = "/pd/dsm/selectDocsSbmsnUoAprvList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectDocsSbmsnUoAprvList(Model model, @RequestBody DocsSbmsnVO DocsSbmsnVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<DocsSbmsnVO> resultList = new ArrayList<>();

		try {
			resultList = DocsSbmsnService.selectDocsSbmsnUoAprvList(DocsSbmsnVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 조회
	@PostMapping(value = "/pd/dsm/selectDocsSbmsnBscList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectDocsSbmsnBscList(Model model, @RequestBody DocsSbmsnVO DocsSbmsnVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<DocsSbmsnVO> resultBscList = new ArrayList<>();
		List<DocsSbmsnVO> resultDtlISoList = new ArrayList<>();
		List<DocsSbmsnVO> resultDtlPoList = new ArrayList<>();

		try {
			//기본요건 리스트
			resultBscList = DocsSbmsnService.selectDocsSbmsnBscList(DocsSbmsnVO);
			//세부요건 출자출하조직 리스트
			resultDtlISoList = DocsSbmsnService.selectDocsSbmsnDtlIsoList(DocsSbmsnVO);
			//세부요건 생산자조직 리스트
			resultDtlPoList = DocsSbmsnService.selectDocsSbmsnDtlPoList(DocsSbmsnVO);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put("resultBscList", resultBscList);
		resultMap.put("resultDtlISoList", resultDtlISoList);
		resultMap.put("resultDtlPoList", resultDtlPoList);
		return getSuccessResponseEntity(resultMap);
	}

	// 조회
	@PostMapping(value = "/pd/dsm/selectDocsSbmsnList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectDocsSbmsnList(Model model, @RequestBody DocsSbmsnVO DocsSbmsnVO, HttpServletRequest request) throws Exception{
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<DocsSbmsnVO> resultList = new ArrayList<>();

		try {
			//기본요건 리스트
			resultList = DocsSbmsnService.selectDocsSbmsnList(DocsSbmsnVO);

		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 첨부파일 업로드
	@PostMapping("/pd/dsm/docsFileUpload.do")
	public ResponseEntity<HashMap<String, Object>> docsFileUpload(
			@ModelAttribute DocsSbmsnVO docsSbmsnVO
		) throws Exception{

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		// audit 항목
		docsSbmsnVO.setSysUserId(getUserId());
		docsSbmsnVO.setSysPrgrmId("docsFileUpload.do");
		docsSbmsnVO.setSysFrstInptUserId(getUserId());
		docsSbmsnVO.setSysFrstInptPrgrmId("docsFileUpload.do");
		docsSbmsnVO.setSysLastChgUserId(getUserId());
		docsSbmsnVO.setSysLastChgPrgrmId("docsFileUpload.do");

		//pd 업로드 파일 경로
		String filepathPd = getFilepathPd();

		int savedCnt = 0;
		try {
			savedCnt = DocsSbmsnService.multiSaveFileList(docsSbmsnVO , filepathPd);
			savedCnt = DocsSbmsnService.multiSaveList(docsSbmsnVO);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);

		return getSuccessResponseEntity(resultMap);
	}

	@PostMapping(value = "/pd/dsm/multiSaveDocsSbmsnAprv.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> multiSaveDocsSbmsnAprv(@RequestBody List<DocsSbmsnVO> DocsSbmsnVOList, HttpServletRequest request) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		int savedCnt = 0;
		try {
			for (DocsSbmsnVO DocsSbmsnVO : DocsSbmsnVOList) {
				DocsSbmsnVO.setSysFrstInptPrgrmId(getPrgrmId());
				DocsSbmsnVO.setSysFrstInptUserId(getUserId());
				DocsSbmsnVO.setSysLastChgPrgrmId(getPrgrmId());
				DocsSbmsnVO.setSysLastChgUserId(getUserId());
			}

			savedCnt = DocsSbmsnService.multiSaveDocsSbmsnAprv(DocsSbmsnVOList);
		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		resultMap.put(ComConstants.PROP_SAVED_CNT, savedCnt);
		return getSuccessResponseEntity(resultMap);
	}
}
