package com.at.apcss.pd.pcorm.web;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.controller.BaseController;
import com.at.apcss.pd.pcorm.service.BizPlanReqMngService;
import com.at.apcss.pd.pcorm.vo.BizPlanReqMngVO;

import egovframework.let.utl.fcc.service.EgovFormBasedFileUtil;

@Controller
public class BizPlanReqMngController extends BaseController{

	@Resource(name= "BizPlanReqMngService")
	private BizPlanReqMngService bizPlanReqMngService;

	//화면이동
	@GetMapping(value = "/pd/pcorm/BizPlanReqMng.do")
	public String BizPlanReqMng() {
		return "apcss/pd/pcorm/BizPlanReqMng";
	}


	// 조회
	@PostMapping(value = "/pd/pcorm/selectBizPlanReqMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectBizPlanReqMngList(Model model, @RequestBody BizPlanReqMngVO bizPlanReqMngVO, HttpServletRequest request) throws Exception{
		System.out.println("==============selectBizPlanReqMngList=======================");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<BizPlanReqMngVO> resultList = new ArrayList<>();
		try {
			resultList = bizPlanReqMngService.selectBizPlanReqMngList(bizPlanReqMngVO);
			System.out.println(resultList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	// 미리보기 팝업 파일 패스 조회
	@PostMapping(value = "/pd/pcorm/bppvSelectFilePathList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> bppvSelectFilePathList(Model model, @RequestBody BizPlanReqMngVO bizPlanReqMngVO, HttpServletRequest request) throws Exception{
		System.out.println("==============selectFilePath=======================");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<BizPlanReqMngVO> resultList = new ArrayList<>();
		try {
			resultList = bizPlanReqMngService.bppvSelectFilePathList(bizPlanReqMngVO);
			System.out.println(resultList);
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return getErrorResponseEntity(e);
		}
		resultMap.put(ComConstants.PROP_RESULT_LIST, resultList);
		return getSuccessResponseEntity(resultMap);
	}

	//제출 서류 정보 업데이트
	@PostMapping(value = "/pd/pcorm/bppvUpdateSbmsnDcnmt.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> bppvUpdateSbmsnDcnmt(@RequestBody BizPlanReqMngVO bizPlanReqMngVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/aom/updatePrfmncCorpDdlnYn.do >>> 호출 >>> ");

		int result = 0;
		try {

			bizPlanReqMngVO.setSysFrstInptPrgrmId(getPrgrmId());
			bizPlanReqMngVO.setSysFrstInptUserId(getUserId());
			bizPlanReqMngVO.setSysLastChgPrgrmId(getPrgrmId());
			bizPlanReqMngVO.setSysLastChgUserId(getUserId());

			result =+ bizPlanReqMngService.bppvUpdateSbmsnDcnmt(bizPlanReqMngVO);

		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result", result);
		return getSuccessResponseEntity(resultMap);
	}

	@GetMapping("/pd/pcorm/download/{fileSn}")
	public void downloadFile(@PathVariable String fileSn, HttpServletRequest requset, HttpServletResponse response) throws Exception {
		logger.debug("============/pd/pcorm/download/{fileSn}=============");

		String uploadPath = getFilepathPd();

		BizPlanReqMngVO bizPlanReqMngVO = new BizPlanReqMngVO();
		bizPlanReqMngVO.setFileSn(fileSn);
		BizPlanReqMngVO result;

		result = bizPlanReqMngService.selectFileInfo(bizPlanReqMngVO);

		//서버 저장 파일명
		String srvrFileNm = result.getSrvrFileNm();
		//확장자명
		String fileExtnNm = result.getFileExtnNm();
		//파일 경로명
		String filePathNm = result.getFilePathNm();
		//원본 파일명
		String orgFileNm = result.getOrgFileNm();

		String convertFileNm = URLEncoder.encode(orgFileNm, "utf-8");

		//물리 파일명
		String filename = srvrFileNm + "_" + fileExtnNm;

		EgovFormBasedFileUtil.downloadFile(response, uploadPath, filePathNm, filename, convertFileNm);

	}
}
