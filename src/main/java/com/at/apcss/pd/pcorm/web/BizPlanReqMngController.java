package com.at.apcss.pd.pcorm.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StreamUtils;
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

	//미리보기 팝업 화면이동
	@GetMapping(value = "/pd/popup/BizPlanPdfViewerPopup.do")
	public String BizPlanPdfViewerPopup() {
		return "apcss/pd/popup/BizPlanPdfViewerPopup";
	}


	// 조회
	@PostMapping(value = "/pd/pcorm/selectBizPlanReqMngList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> selectBizPlanReqMngList(Model model, @RequestBody BizPlanReqMngVO bizPlanReqMngVO, HttpServletRequest request) throws Exception{
		System.out.println("==============selectBizPlanReqMngList=======================");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		List<BizPlanReqMngVO> resultList = new ArrayList<>();
		try {
			resultList = bizPlanReqMngService.selectBizPlanReqMngList(bizPlanReqMngVO);
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

		String convertFileNm = URLEncoder.encode(orgFileNm, "utf-8").replaceAll("\\+", "%20");

		//물리 파일명
		String filename = srvrFileNm + "_" + fileExtnNm;

		EgovFormBasedFileUtil.downloadFile(response, uploadPath, filePathNm, filename, convertFileNm);

	}

	@GetMapping("/pd/pcorm/downloadAll/{yr}")
	public void downloadAllFile(@PathVariable String yr, HttpServletRequest requset, HttpServletResponse response) throws Exception {
		logger.debug("============/pd/pcorm/downloadAll=============");

		String zipFileNm = "제출 서류 일괄 다운로드.zip";
		String convertFileNm = URLEncoder.encode(zipFileNm, "utf-8").replaceAll("\\+", "%20");


		response.setStatus(HttpServletResponse.SC_OK);
		response.setContentType("application/zip");
		response.addHeader("Content-Disposition", "attachment; filename=\"" + convertFileNm +  "\";");

		String uploadPath = getFilepathPd();

		BizPlanReqMngVO bizPlanReqMngVO = new BizPlanReqMngVO();
		bizPlanReqMngVO.setYr(yr);

		List<BizPlanReqMngVO> resultList;

		//파일정보 리스트
		resultList = bizPlanReqMngService.selectFileInfoList(bizPlanReqMngVO);

		if(resultList != null) {
			ZipOutputStream zipOut = null;
			FileInputStream fis = null;

			try {

				zipOut = new ZipOutputStream(response.getOutputStream());

				for (BizPlanReqMngVO result : resultList) {
					//서버 저장 파일명
					String srvrFileNm = result.getSrvrFileNm();
					//확장자명
					String fileExtnNm = result.getFileExtnNm();
					//파일 경로명
					String filePathNm = result.getFilePathNm();
					//원본 파일명
					String orgFileNm = result.getOrgFileNm();
					//법인명
					String corpNm = result.getCorpNm();
					//서류 종류
					String dcmntKndNm = result.getDcmntKndNm();
					//압축할 실제 파일명
					String realFileName = dcmntKndNm + "_" + corpNm + "_" + orgFileNm;
					//String convertFileNm = URLEncoder.encode(orgFileNm, "utf-8").replaceAll("\\+", "%20");

					//파일 경로
					String filePath = uploadPath + File.separator + filePathNm + File.separator;
					//물리 파일명
					String fileName = srvrFileNm + "_" + fileExtnNm;

					File newFile = new File(filePath + fileName);

					//파일 존재 여부 체크
					if(newFile.exists()) {
						zipOut.putNextEntry(new ZipEntry(realFileName));
						fis = new FileInputStream(newFile);

						StreamUtils.copy(fis, zipOut);
						fis.close();
						zipOut.closeEntry();
					}
				}
				zipOut.close();

			} catch (IOException e) {
				try { if(fis != null)fis.close(); } catch (IOException e1) {logger.debug(e1.getMessage());/*ignore*/}
				try { if(zipOut != null)zipOut.closeEntry();} catch (IOException e2) {logger.debug(e2.getMessage());/*ignore*/}
				try { if(zipOut != null)zipOut.close();} catch (IOException e3) {logger.debug(e3.getMessage());/*ignore*/}
			}
		}
	}

	//파일 삭제
	@PostMapping(value = "/pd/pcorm/deleteFile.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> deleteFile(@RequestBody BizPlanReqMngVO bizPlanReqMngVO, HttpServletRequest request) throws Exception {
		logger.debug("/pd/aom/deleteFile.do >>> 호출 >>> ");

		String uploadPath = getFilepathPd();

		int deleteCnt = 0;
		try {

			BizPlanReqMngVO fileInfo = bizPlanReqMngService.selectFileInfo(bizPlanReqMngVO);

			//서버 저장 파일명
			String srvrFileNm = fileInfo.getSrvrFileNm();
			//확장자명
			String fileExtnNm = fileInfo.getFileExtnNm();
			//파일 경로명
			String filePathNm = fileInfo.getFilePathNm();

			//파일 경로
			String filePath = uploadPath + File.separator + filePathNm + File.separator;
			//물리 파일명
			String fileName = srvrFileNm + "_" + fileExtnNm;

			File targetFile = new File(filePath + fileName);

			//파일 존재 여부 체크
			if(targetFile.exists()) {
				Boolean deleteChk = targetFile.delete();
				if(deleteChk) {
					deleteCnt = bizPlanReqMngService.deleteFileInfo(bizPlanReqMngVO);
				}
			}

		}catch (Exception e) {
			return getErrorResponseEntity(e);
		}

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("deleteCnt", deleteCnt);
		return getSuccessResponseEntity(resultMap);
	}
}
