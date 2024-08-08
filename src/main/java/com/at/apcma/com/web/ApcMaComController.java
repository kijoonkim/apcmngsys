package com.at.apcma.com.web;

import java.io.*;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.URLEncoder;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.at.apcss.co.sys.vo.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.at.apcma.com.service.ApcMaComService;
import com.at.apcma.com.service.ApcMaCommDirectService;
import com.at.apcss.co.sys.controller.BaseController;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * 경영정보 공통업무를 처리하는 컨트롤러 클래스
 * @author 		인텔릭아이앤에스
 * @since 		2024.04.29
 * @version 	1.0
 * @see
 *
 * <pre>
 * << 국가정보(Modification Information) >>
 *
 *  수정일      수정자		수정내용
 *  ----------	----------	---------------------------
 *  2023.04.29  장성주     	최초 생성
 *
 *  </pre>
 */
@Controller
public class ApcMaComController extends BaseController {

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
	
	@Resource(name= "apcMaComService")
	private ApcMaComService apcMaComService;
	
	//select 조회
	@PostMapping(value = "/com/comSelectList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> comSelectList(
    		@RequestBody Map<String, Object> param
			,Model model
			//,@RequestBody ComMsgVO comMsgVO
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============comSelectList=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"SP_ESS_BIZCOMP_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug("", e);
			return getErrorResponseEntity(e);
		}

		logger.info("=============comSelectList=====end========");
		return getSuccessResponseEntity(resultMap);
	}		
	
	//file select 조회
	@PostMapping(value = "/com/comFileList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> comFileList(
			@RequestBody Map<String, Object> param
			,Model model
			//,@RequestBody ComMsgVO comMsgVO
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============comFileList=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"P_COM5100_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug("", e);
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============comFileList=====end========");
		return getSuccessResponseEntity(resultMap);
	}		
	
	//file + 링크 저장
	@PostMapping(value = "/com/saveFile.do")
	public ResponseEntity<HashMap<String, Object>> saveFile(
			@RequestParam HashMap<String, Object> param
			,@RequestParam(value="files", required = false) List<MultipartFile> files
    		,MultipartHttpServletRequest request
			,Model model
			,HttpSession session) throws Exception{
		
		logger.info("=============saveFile=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
    	int	cnt		= 0;	
    	
		try {

			//get ipAddress
			String ipAddress = request.getHeader("X-Forwarded-For");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}
			
			//공통파라미터
			Map<String, Object> pamap = new HashMap<String,Object>();
			pamap.put("comp_code", 		param.get("comp_code").toString());
			pamap.put("client_code", 	param.get("client_code").toString());
			pamap.put("source_type", 	param.get("source_type").toString());
			pamap.put("source_code", 	param.get("source_code").toString());
			pamap.put("formID", 		param.get("formID").toString());
			pamap.put("menuId", 		param.get("menuId").toString());
			pamap.put("ipAddress", 		ipAddress);
			
			List<Map<String, Object>> slist = new ObjectMapper().readValue(param.get("slist").toString(), new TypeReference<List<Map<String, Object>>>(){});
			
			//신규 -----------------------------------------------------
			for (int i = 0; i < slist.size(); i++) {
				Map<String, Object> tmap1 = slist.get(i);
				if(tmap1.get("CHG_STAT").equals("N")) {
					if(tmap1.get("FILE_TYPE").equals("2")) {
						//링크
						pamap.put("workType", 	"N");
						pamap.put("SEQ", 		"0");
						pamap.put("TITLE_TXT", 	tmap1.get("TITLE_TXT"));
						pamap.put("LINK_TXT", 	tmap1.get("LINK_TXT"));
						pamap.put("ORD_SEQ", 	tmap1.get("ORD_SEQ"));
						resultMap = apcMaComService.linkAddProcess(pamap, session);
						if(resultMap.get("resultStatus").equals("E")) {
							return getSuccessResponseEntity(resultMap);
						}
					}
				}
			}
			cnt = 0;
			for (int i = 0; i < slist.size(); i++) {
				Map<String, Object> tmap1 = slist.get(i);
				if(tmap1.get("CHG_STAT").equals("N")) {
					if(tmap1.get("FILE_TYPE").equals("1")) {
						//파일
						pamap.put("workType", 	"N");
						pamap.put("SEQ", 		"0");
						pamap.put("TITLE_TXT", 	tmap1.get("TITLE_TXT"));
						pamap.put("ORD_SEQ", 	tmap1.get("ORD_SEQ"));
						resultMap = apcMaComService.fileAddProcess(files.get(cnt), pamap, session);
						cnt ++;
						if(resultMap.get("resultStatus").equals("E")) {
							return getSuccessResponseEntity(resultMap);
						}
					}
				}
			}
			
			//삭제/수정 -------------------------------------------------
			for (int i = 0; i < slist.size(); i++) {
				Map<String, Object> tmap1 = slist.get(i);
				if(tmap1.get("ORG_STAT").equals("A")) {
					if(!tmap1.get("CHG_STAT").equals("D")) {
						//수정(링크,파일)
						pamap.put("workType", 	"U");
						pamap.put("SEQ", 		tmap1.get("SEQ"));
						pamap.put("TITLE_TXT", 	tmap1.get("TITLE_TXT"));
						pamap.put("ORD_SEQ", 	tmap1.get("ORD_SEQ"));
						pamap.put("FILE_TYPE", 	tmap1.get("FILE_TYPE"));
						resultMap = apcMaComService.linkFileUpdateProcess(pamap, session);
						if(resultMap.get("resultStatus").equals("E")) {
							return getSuccessResponseEntity(resultMap);
						}
					}
				}
			}
			for (int i = 0; i < slist.size(); i++) {
				Map<String, Object> tmap1 = slist.get(i);
				if(tmap1.get("ORG_STAT").equals("A")) {
					if(tmap1.get("CHG_STAT").equals("D")) {
						//삭제
						if(tmap1.get("FILE_TYPE").equals("1")) {
							//파일
							pamap.put("workType", 	"D");
							pamap.put("SEQ", 		tmap1.get("SEQ"));
							resultMap = apcMaComService.fileDeleteProcess(pamap, session);
							if(resultMap.get("resultStatus").equals("E")) {
								return getSuccessResponseEntity(resultMap);
							}
						} else {
							//링크
							pamap.put("workType", 	"D");
							pamap.put("SEQ", 		tmap1.get("SEQ"));
							resultMap = apcMaComService.linkDeleteProcess(pamap, session);
							if(resultMap.get("resultStatus").equals("E")) {
								return getSuccessResponseEntity(resultMap);
							}
						}
					}
				}
			}
			
		} catch (Exception e) {
			logger.debug("", e);
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============saveFile=====end========");
		return getSuccessResponseEntity(resultMap);
	}		
	
    @RequestMapping("/com/getFileImage.do")
    public void getFileImage(
    		@RequestParam Map<String, Object> param
    		,HttpServletRequest request
    		,HttpServletResponse response
    		,HttpSession session
    		,Model model) throws Exception {
    	
    	logger.debug("/com/getFileImage started =======>" + param);
    	
    	try {
			//get ipAddress
			String ipAddress = request.getHeader("X-Forwarded-For");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}
			
    		Map<String, Object> ssmap 	= (HashMap<String, Object>)session.getAttribute("maSessionInfo");
    		
			//get key ---------------------------------------------------------
			Map<String, Object> gmap4 = new HashMap<String, Object>();
			gmap4.put("procedure", 			"P_COM5100_Q");
			gmap4.put("workType", 			"Q1");
			gmap4.put("getType", 			"json");
			gmap4.put("cv_count", 			"1");
			
			String palist2[][] = {
					{"V_P_DEBUG_MODE_YN",		ssmap.get("DEBUGMODEYN").toString()},
					{"V_P_LANG_ID",				ssmap.get("LANGID").toString()},
					{"V_P_COMP_CODE",			param.get("comp_code").toString()},
					{"V_P_CLIENT_CODE",			param.get("client_code").toString()},
					{"V_P_FILE_NAME",			""},
					{"V_P_SOURCE_TYPE",			""},
					{"V_P_SOURCE_CODE",			param.get("fkey").toString()},
					{"V_P_USER",				""},
					{"V_P_FORM_ID",				""},
					{"V_P_MENU_ID",				""},
					{"V_P_PROC_ID",				"P_COM5100_Q"},
					{"V_P_USERID",				ssmap.get("USERID").toString()},
					{"V_P_PC",					ipAddress}
			};			
			Map<String, Object> map3 = apcMaCommDirectService.InnerCallProc2(gmap4, palist2); 
    		List<Map<String, Object>> clist = (ArrayList<Map<String, Object>>)map3.get("cv_1");	
			Map<String, Object> map4 = clist.get(0);			
    		//-------------------------------------------------------------------------
			String filePath = map4.get("FILE_SERVER_PATH").toString();
			
    		if(filePath!=null && !filePath.equals("")) {
    			
    			File imgFile = new File(filePath);
    			FileInputStream fis 		= new FileInputStream(imgFile);
    			ByteArrayOutputStream baos	= new ByteArrayOutputStream();
    			byte[] buf 		= new byte[1024];
    			int readlength 	= 0;
    			while ( (readlength = fis.read(buf)) != -1 ) {
					baos.write(buf,0,readlength);
				}
    			byte[] imgbuf	= null;
    			imgbuf = baos.toByteArray();
    			baos.close();
    			fis.close();
    			
    			int length = imgbuf.length;
    			OutputStream out = response.getOutputStream();
    			out.write(imgbuf, 0, length);
    			out.close();     			
    		}
    	} catch (Exception e) {
    		logger.debug("", e);
    	}
    } 
    
    @RequestMapping("/com/getFileDown.do")
    public void getFileDown(
    		@RequestParam Map<String, Object> param
    		,HttpServletRequest request
    		,HttpServletResponse response
    		,HttpSession session
    		,Model model) throws Exception {
    	
    	logger.debug("/com/getFileDown started =======>" + param);
    	
    	try {
    		//get ipAddress
    		String ipAddress = request.getHeader("X-Forwarded-For");
    		if (ipAddress == null) {
    			ipAddress = request.getRemoteAddr();
    		}
    		
    		Map<String, Object> ssmap 	= (HashMap<String, Object>)session.getAttribute("maSessionInfo");
    		
    		//get delete key ---------------------------------------------------------
    		Map<String, Object> gmap4 = new HashMap<String, Object>();
    		gmap4.put("procedure", 			"P_COM5100_Q");
    		gmap4.put("workType", 			"Q1");
    		gmap4.put("getType", 			"json");
    		gmap4.put("cv_count", 			"1");
    		
    		String palist2[][] = {
    				{"V_P_DEBUG_MODE_YN",		ssmap.get("DEBUGMODEYN").toString()},
    				{"V_P_LANG_ID",				ssmap.get("LANGID").toString()},
    				{"V_P_COMP_CODE",			param.get("comp_code").toString()},
    				{"V_P_CLIENT_CODE",			param.get("client_code").toString()},
    				{"V_P_FILE_NAME",			""},
    				{"V_P_SOURCE_TYPE",			""},
    				{"V_P_SOURCE_CODE",			param.get("fkey").toString()},
    				{"V_P_USER",				""},
    				{"V_P_FORM_ID",				""},
    				{"V_P_MENU_ID",				""},
    				{"V_P_PROC_ID",				"P_COM5100_Q"},
    				{"V_P_USERID",				ssmap.get("USERID").toString()},
    				{"V_P_PC",					ipAddress}
    		};			
    		Map<String, Object> map3 = apcMaCommDirectService.InnerCallProc2(gmap4, palist2); 
    		List<Map<String, Object>> clist = (ArrayList<Map<String, Object>>)map3.get("cv_1");	
    		Map<String, Object> map4 = clist.get(0);			
    		//-------------------------------------------------------------------------
    		String filePath 	= map4.get("FILE_SERVER_PATH").toString();
    		String orgfileName 	= map4.get("FILE_NAME").toString();
    		
    		if(filePath!=null && !filePath.equals("")) {
    			
    	        File f = new File(filePath);
    	        // file 다운로드 설정
    	        response.setContentType("application/download");
    	        response.setContentLength((int)f.length());
    	        response.setHeader("Content-disposition", "attachment;filename=\"" + URLEncoder.encode(orgfileName,"UTF-8") + "\"");
    	        // response 객체를 통해서 서버로부터 파일 다운로드
    	        OutputStream os = response.getOutputStream();
    	        // 파일 입력 객체 생성
    	        FileInputStream fis = new FileInputStream(f);
    	        FileCopyUtils.copy(fis, os);
    	        fis.close();
    	        os.close();
    		}
    	} catch (Exception e) {
    		logger.debug("", e);
    	}
    } 
    
    @RequestMapping("/com/getPdfFileDown.do")
    public ResponseEntity<byte[]> getPdfFileDown(
    		@RequestParam Map<String, Object> param
    		,HttpServletRequest request
    		,HttpServletResponse response
    		,HttpSession session
    		,Model model) throws Exception {
    	
    	logger.debug("/com/getPdfFileDown started =======>" + param);
    	
        HttpHeaders headers = new HttpHeaders();
    	byte[] pdfBytes 	= null;
    	
    	try {
    		//get ipAddress
    		String ipAddress = request.getHeader("X-Forwarded-For");
    		if (ipAddress == null) {
    			ipAddress = request.getRemoteAddr();
    		}
    		
    		Map<String, Object> ssmap 	= (HashMap<String, Object>)session.getAttribute("maSessionInfo");
    		
    		//get delete key ---------------------------------------------------------
    		Map<String, Object> gmap4 = new HashMap<String, Object>();
    		gmap4.put("procedure", 			"P_COM5100_Q");
    		gmap4.put("workType", 			"Q1");
    		gmap4.put("getType", 			"json");
    		gmap4.put("cv_count", 			"1");
    		
    		String palist2[][] = {
    				{"V_P_DEBUG_MODE_YN",		ssmap.get("DEBUGMODEYN").toString()},
    				{"V_P_LANG_ID",				ssmap.get("LANGID").toString()},
    				{"V_P_COMP_CODE",			param.get("comp_code").toString()},
    				{"V_P_CLIENT_CODE",			param.get("client_code").toString()},
    				{"V_P_FILE_NAME",			""},
    				{"V_P_SOURCE_TYPE",			""},
    				{"V_P_SOURCE_CODE",			param.get("fkey").toString()},
    				{"V_P_USER",				""},
    				{"V_P_FORM_ID",				""},
    				{"V_P_MENU_ID",				""},
    				{"V_P_PROC_ID",				"P_COM5100_Q"},
    				{"V_P_USERID",				ssmap.get("USERID").toString()},
    				{"V_P_PC",					ipAddress}
    		};			
    		Map<String, Object> map3 = apcMaCommDirectService.InnerCallProc2(gmap4, palist2); 
    		List<Map<String, Object>> clist = (ArrayList<Map<String, Object>>)map3.get("cv_1");	
    		Map<String, Object> map4 = clist.get(0);			
    		//-------------------------------------------------------------------------
    		String filePath 	= map4.get("FILE_SERVER_PATH").toString();
    		String orgfileName 	= map4.get("FILE_NAME").toString();
    		
    		if(filePath!=null && !filePath.equals("")) {
    			
    	        headers.setContentType(MediaType.parseMediaType("application/pdf"));
    	        headers.add("Content-Disposition", "inline; filename=\"" + URLEncoder.encode(orgfileName,"UTF-8") + "\"");
    	        try {
    	            Path path = Paths.get(filePath);
    	            pdfBytes = Files.readAllBytes(path);
    	        } catch (IOException e) {
    	    		logger.debug("", e);
    	            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    	        }
    		}
    	} catch (Exception e) {
    		logger.debug("", e);
    	}
        return new ResponseEntity<>(pdfBytes, headers, HttpStatus.OK);
    } 
	
	//인적사항 사진 및 싸인올리기
	@PostMapping(value = "/com/hrImageUpload.do")
	public ResponseEntity<HashMap<String, Object>> hrImageUpload(
			@RequestParam HashMap<String, Object> param
			,@RequestParam(value="files", required = false) List<MultipartFile> files
    		,MultipartHttpServletRequest request
			,Model model
			,HttpSession session) throws Exception{
		
		logger.info("=============hrImageUpload=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
    	int	cnt		= 0;	
    	
		try {
			
			//get ipAddress
			String ipAddress = request.getHeader("X-Forwarded-For");
			if (ipAddress == null) {
				ipAddress = request.getRemoteAddr();
			}
			param.put("ipAddress", ipAddress);
			resultMap = apcMaComService.hrImageUploadProcess(files.get(0), param, session);
			
		} catch (Exception e) {
			logger.debug("", e);
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============hrImageUpload=====end========");
		return getSuccessResponseEntity(resultMap);
	}	    
    
	//결재관리 사원(트리)/승인경로 조회
	@PostMapping(value = "/com/comApprEmpList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> comApprEmpList(
			@RequestBody Map<String, Object> param
			,Model model
			//,@RequestBody ComMsgVO comMsgVO
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============comApprEmpList=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"P_FIM3400_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug("", e);
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============comApprEmpList=====end========");
		return getSuccessResponseEntity(resultMap);
	}		
	
	//결재관리 승인/반려
	@PostMapping(value = "/com/comApprEmpOk.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> comApprEmpOk(
			@RequestBody Map<String, Object> param
			,Model model
			//,@RequestBody ComMsgVO comMsgVO
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============comApprEmpOk=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"P_FIM3400_S");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug("", e);
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============comApprEmpOk=====end========");
		return getSuccessResponseEntity(resultMap);
	}		
	
	//결재관리 회수/삭제
	@PostMapping(value = "/com/comApprEmpCancel.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> comApprEmpCancel(
			@RequestBody Map<String, Object> param
			,Model model
			//,@RequestBody ComMsgVO comMsgVO
			,HttpSession session
			,HttpServletRequest request) throws Exception{
		
		logger.info("=============comApprEmpCancel=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			param.put("procedure", 		"P_FIM3400_S3");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");
			
		} catch (Exception e) {
			logger.debug("", e);
			return getErrorResponseEntity(e);
		}
		
		logger.info("=============comApprEmpCancel=====end========");
		return getSuccessResponseEntity(resultMap);
	}		
	
	
	//com5500 메일링 리스트 조회
	@PostMapping(value = "/com/com5500tList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> com5500tList(
    		@RequestBody Map<String, Object> param
			,Model model
			//,@RequestBody ComMsgVO comMsgVO
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============com5500tList=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			
			param.put("procedure", 		"P_COM5500_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug("", e);
			return getErrorResponseEntity(e);
		}

		logger.info("=============com5500tList=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}

	//fbs2040 자금이체 내역정보
	@PostMapping(value = "/com/fbs2040tList.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> fbs2040tList(
			@RequestBody Map<String, Object> param
			,Model model
			//,@RequestBody ComMsgVO comMsgVO
			,HttpSession session
			,HttpServletRequest request) throws Exception{

		logger.info("=============fbs2040tList=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {

			param.put("procedure", 		"P_FBS2040_Q");
			resultMap = apcMaCommDirectService.callProc(param, session, request, "");

		} catch (Exception e) {
			logger.debug("", e);
			return getErrorResponseEntity(e);
		}

		logger.info("=============fbs2040tList=====end========");
		return getSuccessResponseEntityMa(resultMap);
	}

	@PostMapping(value = "/com/sendFirmBanking.do", consumes = {MediaType.APPLICATION_JSON_VALUE , MediaType.TEXT_HTML_VALUE})
	public ResponseEntity<HashMap<String, Object>> sendFirmBanking(
			@RequestBody Map<String, Object> param
			, Model model
			, HttpSession session
			, HttpServletRequest request) throws Exception{

		logger.info("=============sendFirmBanking=====start========");
		HashMap<String,Object> resultMap = new HashMap<String,Object>();

		try {
			resultMap = apcMaComService.sendFirmBanking(param);
		} catch (Exception e) {
			logger.error(e.getMessage());
			return getErrorResponseEntity(e);
		}

		logger.info("=============sendFirmBanking=====end========");
		return getSuccessResponseEntity(resultMap);
	}
}
