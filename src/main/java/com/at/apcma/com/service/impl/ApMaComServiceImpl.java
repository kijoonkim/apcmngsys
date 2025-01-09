package com.at.apcma.com.service.impl;

import com.at.apcma.com.mapper.ProcMapper;
import com.at.apcma.com.service.ApcMaComService;
import com.at.apcma.com.service.ApcMaComUtil;
import com.at.apcma.com.service.ApcMaCommDirectService;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.vo.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.*;
import java.nio.ByteBuffer;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.*;

/**
 * @Class Name 		: ComMsgServiceImpl.java
 * @Description 	: 공통으로 처리하는 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 			: 장성주
 * @since 			: 2024.06.12
 * @version 		: 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일      수정자     	수정내용
 * ----------  ----------  	---------------------------
 * 2024.06.12  장성주       최초 생성
 * </pre>
 */
/**
 * @author admin
 *
 */
@Service("apcMaComService")
public class ApMaComServiceImpl implements ApcMaComService {

	public final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource(name= "apcMaCommDirectService")
	private ApcMaCommDirectService apcMaCommDirectService;
	
	private ProcMapper procMapper;
	
	private Socket socket;
	
    @Autowired
    public void setProcMapper(ProcMapper mapper) {
    	this.procMapper = mapper;
    }	
	
	//파일 업로드 경로
	@Value("${apcss.filepath.ma}")
    private String filePath_ma;
	
    public Map<String, Object> callProcTibero(Map<String, Object> param) throws Exception{
    	return procMapper.callProcTibero(param);
    }    
    
	public HashMap<String, Object> linkAddProcess(Map<String, Object> param, HttpSession session) {

		HashMap<String, Object> rmap 	= new HashMap<String, Object>();
		Map<String, Object> ssmap 		= (HashMap<String, Object>)session.getAttribute("maSessionInfo");
		
		try {
			
			Map<String, Object> gmap1 = new HashMap<String, Object>();
			gmap1.put("procedure", 			"SP_COM5100_S");
			gmap1.put("workType", 			param.get("workType"));
			gmap1.put("getType", 			"json");
			gmap1.put("cv_count", 			"0");
			
    		String gmap2[][] = {
				{"V_P_DEBUG_MODE_YN",		ssmap.get("DEBUGMODEYN").toString()},
				{"V_P_LANG_ID",				ssmap.get("LANGID").toString()},
				{"V_P_COMP_CODE",			param.get("comp_code").toString()},
				{"V_P_CLIENT_CODE",			param.get("client_code").toString()},
				{"IV_P_SEQ",				param.get("SEQ").toString()},
				{"V_P_FILE_NAME",			param.get("LINK_TXT").toString()},
				{"V_P_FILE_SERVER_PATH",	""},
				{"V_P_MEMO",				param.get("TITLE_TXT").toString()},
				{"V_P_ORDER_SEQ",			param.get("ORD_SEQ").toString()},
				{"V_P_SOURCE_TYPE",			param.get("source_type").toString()},
				{"V_P_SOURCE_CODE",			param.get("source_code").toString()},
				{"V_P_FILE_TYPE",			"2"},
				{"V_P_SERVER_FILE_NAME",	""},
				{"V_P_FORM_ID",				param.get("formID").toString()},
				{"V_P_MENU_ID",				param.get("menuId").toString()},
				{"V_P_PROC_ID",				"SP_COM5100_S"},
				{"V_P_USERID",				ssmap.get("USERID").toString()},
				{"V_P_PC",					param.get("ipAddress").toString()}
        	};			
			Map<String, Object> gmap3 = apcMaCommDirectService.InnerCallProc2(gmap1, gmap2);    
			rmap = apcMaCommDirectService.checkError(gmap3);
			
		} catch (Exception e) {
			logger.debug("", e);
		}
		return rmap;
	}    
	
	public HashMap<String, Object> linkFileUpdateProcess(Map<String, Object> param, HttpSession session) {

		HashMap<String, Object> rmap 	= new HashMap<String, Object>();
		Map<String, Object> ssmap 		= (HashMap<String, Object>)session.getAttribute("maSessionInfo");
		
		try {
			
			String link_txt = "";
			if(param.get("FILE_TYPE").equals("1")) {
				link_txt = "";
			} else {
				link_txt = ApcMaComUtil.nullToString(param.get("LINK_TXT"));
			}
			
			Map<String, Object> gmap1 = new HashMap<String, Object>();
			gmap1.put("procedure", 			"SP_COM5100_S");
			gmap1.put("workType", 			param.get("workType"));
			gmap1.put("getType", 			"json");
			gmap1.put("cv_count", 			"0");
			
    		String gmap2[][] = {
				{"V_P_DEBUG_MODE_YN",		ssmap.get("DEBUGMODEYN").toString()},
				{"V_P_LANG_ID",				ssmap.get("LANGID").toString()},
				{"V_P_COMP_CODE",			param.get("comp_code").toString()},
				{"V_P_CLIENT_CODE",			param.get("client_code").toString()},
				{"IV_P_SEQ",				param.get("SEQ").toString()},
				{"V_P_FILE_NAME",			link_txt},
				{"V_P_FILE_SERVER_PATH",	""},
				{"V_P_MEMO",				param.get("TITLE_TXT").toString()},
				{"V_P_ORDER_SEQ",			param.get("ORD_SEQ").toString()},
				{"V_P_SOURCE_TYPE",			param.get("source_type").toString()},
				{"V_P_SOURCE_CODE",			param.get("source_code").toString()},
				{"V_P_FILE_TYPE",			param.get("FILE_TYPE").toString()},
				{"V_P_SERVER_FILE_NAME",	""},
				{"V_P_FORM_ID",				param.get("formID").toString()},
				{"V_P_MENU_ID",				param.get("menuId").toString()},
				{"V_P_PROC_ID",				"SP_COM5100_S"},
				{"V_P_USERID",				ssmap.get("USERID").toString()},
				{"V_P_PC",					param.get("ipAddress").toString()}
        	};			
			Map<String, Object> gmap3 = apcMaCommDirectService.InnerCallProc2(gmap1, gmap2);    
			rmap = apcMaCommDirectService.checkError(gmap3);
			
		} catch (Exception e) {
			logger.debug("", e);
		}
		return rmap;
	}    
	
	public HashMap<String, Object> linkDeleteProcess(Map<String, Object> param, HttpSession session) {
		
		HashMap<String, Object> rmap 	= new HashMap<String, Object>();
		Map<String, Object> ssmap 		= (HashMap<String, Object>)session.getAttribute("maSessionInfo");
		
		try {
			
			Map<String, Object> gmap1 = new HashMap<String, Object>();
			gmap1.put("procedure", 			"SP_COM5100_S");
			gmap1.put("workType", 			param.get("workType"));
			gmap1.put("getType", 			"json");
			gmap1.put("cv_count", 			"0");
			
			String gmap2[][] = {
					{"V_P_DEBUG_MODE_YN",		ssmap.get("DEBUGMODEYN").toString()},
					{"V_P_LANG_ID",				ssmap.get("LANGID").toString()},
					{"V_P_COMP_CODE",			param.get("comp_code").toString()},
					{"V_P_CLIENT_CODE",			param.get("client_code").toString()},
					{"IV_P_SEQ",				param.get("SEQ").toString()},
					{"V_P_FILE_NAME",			""},
					{"V_P_FILE_SERVER_PATH",	""},
					{"V_P_MEMO",				""},
					{"V_P_ORDER_SEQ",			""},
					{"V_P_SOURCE_TYPE",			param.get("source_type").toString()},
					{"V_P_SOURCE_CODE",			param.get("source_code").toString()},
					{"V_P_FILE_TYPE",			""},
					{"V_P_SERVER_FILE_NAME",	""},
					{"V_P_FORM_ID",				param.get("formID").toString()},
					{"V_P_MENU_ID",				param.get("menuId").toString()},
					{"V_P_PROC_ID",				"SP_COM5100_S"},
					{"V_P_USERID",				ssmap.get("USERID").toString()},
					{"V_P_PC",					param.get("ipAddress").toString()}
			};			
			Map<String, Object> gmap3 = apcMaCommDirectService.InnerCallProc2(gmap1, gmap2);    
			rmap = apcMaCommDirectService.checkError(gmap3);
			
		} catch (Exception e) {
			logger.debug("", e);
		}
		return rmap;
	}    
	
	public HashMap<String, Object> fileDeleteProcess(Map<String, Object> param, HttpSession session) {
		
		HashMap<String, Object> rmap 	= new HashMap<String, Object>();
		Map<String, Object> ssmap 		= (HashMap<String, Object>)session.getAttribute("maSessionInfo");
		
		String  dpath	= "";
		
		try {
			
			//get delete key ---------------------------------------------------------
			Map<String, Object> gmap4 = new HashMap<String, Object>();
			gmap4.put("procedure", 			"SP_COM5100_Q");
			gmap4.put("workType", 			"Q2");
			gmap4.put("getType", 			"json");
			gmap4.put("cv_count", 			"1");
			
			String palist2[][] = {
					{"V_P_DEBUG_MODE_YN",		ssmap.get("DEBUGMODEYN").toString()},
					{"V_P_LANG_ID",				ssmap.get("LANGID").toString()},
					{"V_P_COMP_CODE",			param.get("comp_code").toString()},
					{"V_P_CLIENT_CODE",			param.get("client_code").toString()},
					{"V_P_FILE_NAME",			""},
					{"V_P_SOURCE_TYPE",			param.get("source_type").toString()},
					{"V_P_SOURCE_CODE",			param.get("SEQ").toString()},
					{"V_P_USER",				""},
					{"V_P_FORM_ID",				param.get("formID").toString()},
					{"V_P_MENU_ID",				param.get("menuId").toString()},
					{"V_P_PROC_ID",				"SP_COM5100_Q"},
					{"V_P_USERID",				ssmap.get("USERID").toString()},
					{"V_P_PC",					param.get("ipAddress").toString()}
			};			
			Map<String, Object> map3 = apcMaCommDirectService.InnerCallProc2(gmap4, palist2); 
    		List<Map<String, Object>> clist = (ArrayList<Map<String, Object>>)map3.get("cv_1");	
			Map<String, Object> map4 = clist.get(0);			
			
			//FILE_SERVER_PATH
			if(map4.containsKey("FILE_SRVR_PATH") && !map4.get("FILE_SRVR_PATH").equals("")) {
				dpath = map4.get("FILE_SRVR_PATH").toString();
			}			
			
			//delete data --------------------------------------------------------
			Map<String, Object> gmap1 = new HashMap<String, Object>();
			gmap1.put("procedure", 			"SP_COM5100_S");
			gmap1.put("workType", 			param.get("workType"));
			gmap1.put("getType", 			"json");
			gmap1.put("cv_count", 			"0");
			
			String gmap2[][] = {
					{"V_P_DEBUG_MODE_YN",		ssmap.get("DEBUGMODEYN").toString()},
					{"V_P_LANG_ID",				ssmap.get("LANGID").toString()},
					{"V_P_COMP_CODE",			param.get("comp_code").toString()},
					{"V_P_CLIENT_CODE",			param.get("client_code").toString()},
					{"IV_P_SEQ",				param.get("SEQ").toString()},
					{"V_P_FILE_NAME",			""},
					{"V_P_FILE_SERVER_PATH",	""},
					{"V_P_MEMO",				""},
					{"V_P_ORDER_SEQ",			""},
					{"V_P_SOURCE_TYPE",			param.get("source_type").toString()},
					{"V_P_SOURCE_CODE",			param.get("source_code").toString()},
					{"V_P_FILE_TYPE",			""},
					{"V_P_SERVER_FILE_NAME",	""},
					{"V_P_FORM_ID",				param.get("formID").toString()},
					{"V_P_MENU_ID",				param.get("menuId").toString()},
					{"V_P_PROC_ID",				"SP_COM5100_S"},
					{"V_P_USERID",				ssmap.get("USERID").toString()},
					{"V_P_PC",					param.get("ipAddress").toString()}
			};			
			Map<String, Object> gmap3 = apcMaCommDirectService.InnerCallProc2(gmap1, gmap2);    
			rmap = apcMaCommDirectService.checkError(gmap3);
			
			if(!dpath.equals("")) {
				//파일삭제
				ApcMaComUtil.fileDeleteOne(map4.get("FILE_SERVER_PATH").toString());
			}
			
		} catch (Exception e) {
			logger.debug("", e);
		}
		return rmap;
	}    
	
	public HashMap<String, Object> fileAddProcess(MultipartFile mfile, Map<String, Object> param, HttpSession session) {
		
		HashMap<String, Object> rmap 	= new HashMap<String, Object>();
		Map<String, Object> ssmap 		= (HashMap<String, Object>)session.getAttribute("maSessionInfo");
		
		try {
			
			String newFilePath = filePath_ma;
			
			//file Prefix Name create
			newFilePath = checkUrl(newFilePath, param.get("comp_code").toString(), param.get("source_type").toString(), param.get("source_code").toString());
			
			//file
			List<MultipartFile> mtfiles = new ArrayList<MultipartFile>();
			mtfiles.add(mfile);
			HashMap<String, Object> map1 = ApcMaComUtil.fileUpload(newFilePath, mtfiles);
			if(map1.get("success").equals(false)) {
				rmap.put("resultStatus", 	"E");
				rmap.put("resultMessage", 	"파일을 저장 중에 오류가 발생하였습니다.");
				return rmap;
			}			
			
			//save 프로시저
			Map<String, Object> gmap1 = new HashMap<String, Object>();
			gmap1.put("procedure", 			"SP_COM5100_S");
			gmap1.put("workType", 			param.get("workType"));
			gmap1.put("getType", 			"json");
			gmap1.put("cv_count", 			"0");
			
			String gmap2[][] = {
					{"V_P_DEBUG_MODE_YN",		ssmap.get("DEBUGMODEYN").toString()},
					{"V_P_LANG_ID",				ssmap.get("LANGID").toString()},
					{"V_P_COMP_CODE",			param.get("comp_code").toString()},
					{"V_P_CLIENT_CODE",			param.get("client_code").toString()},
					{"IV_P_SEQ",				param.get("SEQ").toString()},
					{"V_P_FILE_NAME",			map1.get("orgFileName").toString()},
					{"V_P_FILE_SERVER_PATH",	map1.get("fullFileName").toString()},
					{"V_P_MEMO",				param.get("TITLE_TXT").toString()},
					{"V_P_ORDER_SEQ",			param.get("ORD_SEQ").toString()},
					{"V_P_SOURCE_TYPE",			param.get("source_type").toString()},
					{"V_P_SOURCE_CODE",			param.get("source_code").toString()},
					{"V_P_FILE_TYPE",			"1"},
					{"V_P_SERVER_FILE_NAME",	map1.get("saveFileName").toString()},
					{"V_P_FORM_ID",				param.get("formID").toString()},
					{"V_P_MENU_ID",				param.get("menuId").toString()},
					{"V_P_PROC_ID",				"SP_COM5100_S"},
					{"V_P_USERID",				ssmap.get("USERID").toString()},
					{"V_P_PC",					param.get("ipAddress").toString()}
			};			
			Map<String, Object> gmap3 = apcMaCommDirectService.InnerCallProc2(gmap1, gmap2);    
			rmap = apcMaCommDirectService.checkError(gmap3);
			
		} catch (Exception e) {
			logger.debug("", e);
		}
		return rmap;
	}  
	
	public HashMap<String, Object> hrImageUploadProcess(MultipartFile mfile, Map<String, Object> param, HttpSession session) {
		
		HashMap<String, Object> rmap 	= new HashMap<String, Object>();
		Map<String, Object> ssmap 		= (HashMap<String, Object>)session.getAttribute("maSessionInfo");
		
		String imgKey 	= "";
		String imgTmKey = "";
		
		try {
			
			String newFilePath 	= filePath_ma;
			String source_type 	= "HRIMASTEMP";		//인사사항 EMP
			String source_code1 = "IMG";			//사진
			String source_code2 = "IMGTM";			//썸네일
			String source_code3 = "SIGN";			//싸인
			String source_code4 = "SIGNTM";			//싸인
			String source_code5 = "LOGO";			//법인 로고
			String source_code6 = "STAMP";			//직인
			String source_code7 = "SITE_STAMP";		//사용인감
			
			String path1 		= "";
			String path2 		= "";
			
			if(param.get("type").equals("1")) {
				path1 = checkUrl(newFilePath, param.get("comp_code").toString(), source_type, source_code1);
				path2 = checkUrl(newFilePath, param.get("comp_code").toString(), source_type, source_code2);
			} else if(param.get("type").equals("2")) {
				path1 = checkUrl(newFilePath, param.get("comp_code").toString(), source_type, source_code3);
				path2 = checkUrl(newFilePath, param.get("comp_code").toString(), source_type, source_code4);
			} else if(param.get("type").equals("3")) {
				path1 = checkUrl(newFilePath, param.get("comp_code").toString(), source_type, source_code5);
				path2 = checkUrl(newFilePath, param.get("comp_code").toString(), source_type, source_code5);
			} else if(param.get("type").equals("4")) {
				path1 = checkUrl(newFilePath, param.get("comp_code").toString(), source_type, source_code6);
				path2 = checkUrl(newFilePath, param.get("comp_code").toString(), source_type, source_code6);
			} else if(param.get("type").equals("5")) {
				path1 = checkUrl(newFilePath, param.get("comp_code").toString(), source_type, source_code7);
				path2 = checkUrl(newFilePath, param.get("comp_code").toString(), source_type, source_code7);
			}
		
			//파일저장
			List<MultipartFile> mtfiles = new ArrayList<MultipartFile>();
			mtfiles.add(mfile);
			Map<String, Object> map1 = ApcMaComUtil.fileUpload2(path1, mtfiles, param.get("empCode").toString());
			
			if(map1.get("success").equals(false)) {
				rmap.put("resultStatus", 	"E");
				if(param.get("type").equals("1")) {
					rmap.put("resultMessage", 	"사진 이미지 저장 중에 오류가 발생하였습니다.");
				} else if(param.get("type").equals("2")) {
					rmap.put("resultMessage", 	"싸인 이미지 저장 중에 오류가 발생하였습니다.");
				} else if(param.get("type").equals("3")) {
					rmap.put("resultMessage", 	"법인 로고 이미지 저장 중에 오류가 발생하였습니다.");
				} else if(param.get("type").equals("4")) {
					rmap.put("resultMessage", 	"직인 이미지 저장 중에 오류가 발생하였습니다.");
				} else if(param.get("type").equals("5")) {
					rmap.put("resultMessage", 	"사용인감 저장 중에 오류가 발생하였습니다.");
				}
				return rmap;
			}			
			
			//save 프로시저
			Map<String, Object> gmap1 = new HashMap<String, Object>();
			gmap1.put("procedure", 			"SP_COM5100_S");
			gmap1.put("workType", 			"N");
			gmap1.put("getType", 			"json");
			gmap1.put("cv_count", 			"0");
			
			String gmap2[][] = {
					{"V_P_DEBUG_MODE_YN",		ssmap.get("DEBUGMODEYN").toString()},
					{"V_P_LANG_ID",				ssmap.get("LANGID").toString()},
					{"V_P_COMP_CODE",			param.get("comp_code").toString()},
					{"V_P_CLIENT_CODE",			param.get("client_code").toString()},
					{"IV_P_SEQ",				"0"},
					{"V_P_FILE_NAME",			map1.get("orgFileName").toString()},
					{"V_P_FILE_SERVER_PATH",	map1.get("fullFileName").toString()},
					{"V_P_MEMO",				""},
					{"V_P_ORDER_SEQ",			"1"},
					{"V_P_SOURCE_TYPE",			source_type},
					{"V_P_SOURCE_CODE",			source_code1},
					{"V_P_FILE_TYPE",			"1"},
					{"V_P_SERVER_FILE_NAME",	map1.get("saveFileName").toString()},
					{"V_P_FORM_ID",				param.get("formID").toString()},
					{"V_P_MENU_ID",				param.get("menuId").toString()},
					{"V_P_PROC_ID",				"SP_COM5100_S"},
					{"V_P_USERID",				ssmap.get("USERID").toString()},
					{"V_P_PC",					param.get("ipAddress").toString()}
			};			
			Map<String, Object> gmap3 = apcMaCommDirectService.InnerCallProc2(gmap1, gmap2);    
			rmap = apcMaCommDirectService.checkError(gmap3);
			imgKey = map1.get("saveFileName").toString();
			
			//썸네일 --------------------------------
			Map<String, Object> map2 = createThumbnail(map1.get("fullFileName").toString(), path2, map1.get("orgFileName").toString());

			//save 프로시저
			Map<String, Object> gmap4 = new HashMap<String, Object>();
			gmap4.put("procedure", 			"SP_COM5100_S");
			gmap4.put("workType", 			"N");
			gmap4.put("getType", 			"json");
			gmap4.put("cv_count", 			"0");
			
			String gmap5[][] = {
					{"V_P_DEBUG_MODE_YN",		ssmap.get("DEBUGMODEYN").toString()},
					{"V_P_LANG_ID",				ssmap.get("LANGID").toString()},
					{"V_P_COMP_CODE",			param.get("comp_code").toString()},
					{"V_P_CLIENT_CODE",			param.get("client_code").toString()},
					{"IV_P_SEQ",				"0"},
					{"V_P_FILE_NAME",			map2.get("orgFileName").toString()},
					{"V_P_FILE_SERVER_PATH",	map2.get("fullFileName").toString()},
					{"V_P_MEMO",				""},
					{"V_P_ORDER_SEQ",			"1"},
					{"V_P_SOURCE_TYPE",			source_type},
					{"V_P_SOURCE_CODE",			source_code2},
					{"V_P_FILE_TYPE",			"1"},
					{"V_P_SERVER_FILE_NAME",	map2.get("saveFileName").toString()},
					{"V_P_FORM_ID",				param.get("formID").toString()},
					{"V_P_MENU_ID",				param.get("menuId").toString()},
					{"V_P_PROC_ID",				"SP_COM5100_S"},
					{"V_P_USERID",				ssmap.get("USERID").toString()},
					{"V_P_PC",					param.get("ipAddress").toString()}
			};			
			Map<String, Object> gmap6 = apcMaCommDirectService.InnerCallProc2(gmap4, gmap5);    
			rmap = apcMaCommDirectService.checkError(gmap6);
			imgTmKey = map2.get("saveFileName").toString();
			
		} catch (Exception e) {
			logger.debug("", e);
		}
		
		rmap.put("imgKey", 	 imgKey);
		rmap.put("imgTmKey", imgTmKey);
		return rmap;
	}    
	
	private String checkUrl(String url, String comp_code, String source_type, String source_code) {
		String rstr = "";
		
		if(url.contains(":")){
			//window path
			if(!String.valueOf(url.charAt(url.length()-1)).equals("\\")) {
				url = url + "\\" + comp_code.toString() + "\\"; 
			} else {
				url = url + comp_code.toString() + "\\"; 
			}
			if(source_code==null || source_code.equals("") || source_code.equals("null")) {
				url = url + source_type.toString() + "\\" + "null" + "\\";
			} else {
				url = url + source_type.toString() + "\\" + source_code.toString() + "\\";
			}
		} else {
			//other path
			if(!String.valueOf(url.charAt(url.length()-1)).equals("/")) {
				url = url + "/" + comp_code.toString() + "/"; 
			} else {
				url = url + comp_code.toString() + "/"; 
			}
			if(source_code==null || source_code.equals("") || source_code.equals("null")) {
				url = url + source_type.toString() + "/" + "null" + "/";
			} else {
				url = url + source_type.toString() + "/" + source_code.toString() + "/";
			}
		}
		rstr = url;
		return rstr;
	}
	
	/**
	 * 이미지를 축소하여 썸네일 이미지로 변환
	 * @param fullPath
	 * @return
	 */
	private Map<String, Object> createThumbnail(String oPath, String nPath, String fileName) {
		
		Map<String, Object> rmap = new HashMap<String, Object>();		
		
		try {
			
			File oFile 		= new File(oPath);
			int index 		= oPath.lastIndexOf(".");
			String ext 		= oPath.substring(index + 1); // 파일 확장자
			String sName	= StringUtils.remove(UUID.randomUUID().toString(),"-") + "." + ext;
			
			//폴더생성
			Path newPath = Paths.get(nPath.substring(0, nPath.length() - 1));
			Files.createDirectory(newPath);
			
			String tPath 	= nPath + sName; 			// 썸네일저장 경로
			File tFile 		= new File(tPath);
			
			double ratio = 2; // 이미지 축소 비율		
			
			//썸네일 작업
			BufferedImage oImage 	= ImageIO.read(oFile); 					// 원본이미지
			int tWidth 				= (int) (oImage.getWidth() / ratio);	// 생성할 썸네일이미지의 너비
			int tHeight 			= (int) (oImage.getHeight() / ratio); 	// 생성할 썸네일이미지의 높이
			
			BufferedImage tImage 	= new BufferedImage(tWidth, tHeight, BufferedImage.TYPE_3BYTE_BGR); // 썸네일이미지
			Graphics2D graphic 		= tImage.createGraphics();
			Image image 			= oImage.getScaledInstance(tWidth, tHeight, Image.SCALE_SMOOTH);
			graphic.drawImage(image, 0, 0, tWidth, tHeight, null);
			graphic.dispose(); // 리소스를 모두 해제
			
			//썸네일 완성
			ImageIO.write(tImage, ext, tFile);			
			
			rmap.put("orgFileName", 	fileName);
			rmap.put("saveFileName", 	sName);
			rmap.put("fullFileName", 	tPath);
			
		} catch (Exception e) {
			logger.debug("", e);
		}
		return rmap;
	}

	/**
	 * 화면에서 list로 보낸 data를 for-loop를 통해 일괄 처리
	 * @param param
	 * @param session
	 * @param request
	 * @param ptype
	 * @param procedureName
	 * @return
	 */
	public HashMap<String, Object> processForListData(Map<String, Object> param, HttpSession session, HttpServletRequest request, String ptype, String procedureName) throws Exception {
		List<HashMap<String,Object>> returnData = new ArrayList<>();
		HashMap<String, Object> result = new HashMap<>();

		result.put("resultStatus", "S");
		result.put("resultCode", "");
		result.put("resultMessage", "");

		for(String key : param.keySet()){
			if(key.contains("listData")) {
				if(param.get(key) instanceof List) {
					List<HashMap<String,Object>> listData = (List<HashMap<String, Object>>) param.get(key);

					for(int i = 0; i < listData.size(); i++) {
						listData.get(i).put("procedure", procedureName);
						returnData.add(i, apcMaCommDirectService.callProc(listData.get(i), session, request, Optional.ofNullable(ptype).orElse("")));

						if(returnData.get(i).get("resultStatus").equals("E")) {
							result.put("resultStatus", "E");
							result.put("resultCode", Integer.valueOf(Optional.ofNullable(listData.get(i).get("rownum")).orElse("-1").toString()));
							result.put("resultMessage", Optional.ofNullable(returnData.get(i).get("resultMessage")).orElse("").toString());

							return result;
						}
					}
				}
			}
		}

		return result;
    }

	@Override
	public HashMap<String, Object> sendFirmBanking(Map<String, Object> param) {
		HashMap<String,Object> resultMap = new HashMap<>();
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String fbsService = param.get("FBS_SERVICE").toString();
		String sendData = param.get("SEND_DATA").toString();
		Boolean bSync = (Boolean) param.get("bSync");

		byte[] numArray1 = new byte[4096];
		byte[] numArray2 = new byte[4096];
		resultMap.put("code", "CTIM");
		resultMap.put("message", "Connection timed out");
		resultMap.put("resultStatus", "E");

		String ipString;
		String s;

		if (fbsService.equals(loginVO.getMaFBSVAN())) {
			ipString = loginVO.getMaFBSRIP();
			s = loginVO.getMaFBSRPORT();
		} else if (fbsService.equals(loginVO.getMaFBSVANCB())) {
			ipString = loginVO.getMaFBSCIP();
			s = loginVO.getMaFBSCPORT();
		} else if (fbsService.equals(loginVO.getMaFBSVANFC())) {
			ipString = loginVO.getMaFBSFIP();
			s = loginVO.getMaFBSFPORT();
		} else {
			ipString = loginVO.getMaFBSRIP();
			s = loginVO.getMaFBSRPORT();
		}

		try {
			InetSocketAddress remoteEP = new InetSocketAddress(InetAddress.getByName(ipString), Integer.parseInt(s));
			this.socket = new Socket();
			this.socket.connect(remoteEP);
			byte[] bytes = sendData.getBytes(Charset.forName("ks_c_5601-1987"));
			OutputStream outputStream = this.socket.getOutputStream();
			outputStream.write(bytes);

			if (bSync) {
				try {
					InputStream inputStream = this.socket.getInputStream();
					int bytesRead = inputStream.read(numArray1);

					if (bytesRead == -1 || ByteBuffer.wrap(numArray1).getInt() == 0) {
						resultMap.put("code", "VTIM");
						resultMap.put("message", "TIMEOUT ERROR");
						resultMap.put("resultStatus", "E");
					} else {
						int num2 = byteArrayDefrag(numArray1);
						String inputString = new String(numArray1, 0, num2 + 1, Charset.forName("ks_c_5601-1987"));
						resultMap.put("code", fnFirmSubString(inputString, 85, 4));
						resultMap.put("message", inputString);
						resultMap.put("resultStatus", "S");
					}
				} catch (Exception ex) {
					resultMap.put("code", "VTIM");
					resultMap.put("message", "TIMEOUT ERROR");
					resultMap.put("resultStatus", "E");
				} finally {
					this.socket.close();
				}
			} else {
				resultMap.put("code", "COMP");
				resultMap.put("message", "Transfer completed");
				resultMap.put("resultStatus", "S");
			}
		} catch (Exception ex) {
			resultMap.put("code", "CTIM");
			resultMap.put("message", "Connection timed out");
			resultMap.put("resultStatus", "E");
		} finally {
			try {
				if (this.socket != null && !this.socket.isClosed()) {
					this.socket.close();
				}
			} catch (IOException e) {
				logger.error(e.getMessage());
			}
		}

		return resultMap;
	}

	@Override
	public HashMap<String, Object> sendSalaryTransferDataForFtp(Map<String, Object> param) {
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		List<Map<String, Object>> dtFirmbanking = (List<Map<String, Object>>) param.get("params");

		String strContent = "";
		String upload_file_name = dtFirmbanking.get(0).get("FILE_NAME").toString();
		int intStrLength = Integer.parseInt(dtFirmbanking.get(0).get("STR_LENGTH").toString());
		String newfile_name = filePath_ma +"\\salary\\temp\\" + upload_file_name;
		FileWriter objwriter = null;
		boolean bSuccess = false;
		int iTotalLength = 0;
		int iCnt = 0;

		try {
			objwriter = new FileWriter(newfile_name, Charset.defaultCharset());

			for (Map dr : dtFirmbanking) {
				try {
					char[] charArr = dr.get("SEND_DATA").toString().toCharArray();
					int hCnt = 0;

					for (char ch : charArr) {
						if (Character.getType(ch) == Character.OTHER_LETTER) {
							hCnt++;
						}
					}

					String paddedString = StringUtils.rightPad(dr.get("SEND_DATA").toString(), intStrLength - 2 - hCnt) + "\r\n";
					byte[] StrByte = paddedString.getBytes(Charset.defaultCharset());
					char[] StrChar = new String(StrByte, Charset.defaultCharset()).toCharArray();

					strContent += paddedString;
					objwriter.write(StrChar, 0, StrChar.length);
					bSuccess = true;

					iTotalLength += StrChar.length;
				} catch (Exception e) {
					bSuccess = false;
				}

				iCnt++;
			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (objwriter != null) {
				try {
					objwriter.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		if (bSuccess && iCnt > 2 && iTotalLength > 2) {
			String strftpaddress = "ftp://" + loginVO.getMaFBSBIP() + "/";
			String strPath = loginVO.getMaFBSSENDPATH();
			String user = loginVO.getMaFBSBATCHID();
			String pwd = loginVO.getMaFBSBATCHPW();

			if (loginVO.getMaFBSSERVERTYPE().toString().equals("DEV")) {
				strftpaddress = "ftp://" + loginVO.getMaFBSBIP() + "/";
				strPath = loginVO.getMaFBSSENDPATH();
				user = loginVO.getMaFBSBATCHID();
				pwd = loginVO.getMaFBSBATCHPW();
			}

			String ftpPath = strPath + upload_file_name;
			String inputFile = newfile_name;

			FTPClient ftpClient = new FTPClient();

			try (FileInputStream inputStream = new FileInputStream(inputFile)) {
				ftpClient.connect(loginVO.getMaFBSBIP());
				ftpClient.login(user, pwd);

				// Switch to passive mode
				ftpClient.enterLocalPassiveMode();
				ftpClient.setFileType(FTP.BINARY_FILE_TYPE);

				// Perform FTP upload
				boolean done = ftpClient.storeFile(ftpPath, inputStream);
				if (done) {
					logger.info("File is successfully uploaded.");
					returnMap.put(ComConstants.PROP_RESULT_STATUS, "S");
					returnMap.put(ComConstants.PROP_RESULT_CODE, ComConstants.CON_BLANK);
					returnMap.put(ComConstants.PROP_RESULT_MESSAGE, "급여이체파일 전송결과 - [Success], file_name : " + newfile_name);
				} else {
					logger.error("File upload failed.");
					returnMap.put(ComConstants.PROP_RESULT_STATUS, "E");
					returnMap.put(ComConstants.PROP_RESULT_CODE, ComConstants.CON_BLANK);
					returnMap.put(ComConstants.PROP_RESULT_MESSAGE, "급여이체파일 전송실패");
				}

			} catch (FileNotFoundException ex) {
				logger.error("The file was not found: " + ex.getMessage());
			} catch (IOException ex) {
				logger.error("Error occurred: " + ex.getMessage());
			} finally {
				try {
					if (ftpClient.isConnected()) {
						ftpClient.logout();
						ftpClient.disconnect();
					}
				} catch (IOException ex) {
					ex.printStackTrace();
				}
			}
		} else {
			if (iCnt <= 2 || iTotalLength <= 2) {
				returnMap.put(ComConstants.PROP_RESULT_STATUS, "E");
				returnMap.put(ComConstants.PROP_RESULT_CODE, ComConstants.CON_BLANK);
				returnMap.put(ComConstants.PROP_RESULT_MESSAGE, "전송가능한 급여이체건이 존재하지 않습니다.");
			} else {
				returnMap.put(ComConstants.PROP_RESULT_STATUS, "E");
				returnMap.put(ComConstants.PROP_RESULT_CODE, ComConstants.CON_BLANK);
				returnMap.put(ComConstants.PROP_RESULT_MESSAGE, "급여이체파일 전송실패");
			}
		}

		return returnMap;
	}

	private int byteArrayDefrag(byte[] array) {
		int i = 0;
		while (i < array.length && array[i] != 0) {
			i++;
		}
		return i;
	}

	private static String fnFirmSubString(String inputString, int startIndex, int length) {
		Charset encoding = Charset.forName("ks_c_5601-1987");

		// 문자열을 바이트 배열로 변환
		byte[] bytes = inputString.getBytes(encoding);

		// 범위를 벗어나지 않도록 조정
		if (bytes.length <= startIndex + length) {
			return new String(bytes, encoding);
		}

		// 부분 문자열을 추출
		byte[] subBytes = new byte[length];
		System.arraycopy(bytes, startIndex, subBytes, 0, length);

		return new String(subBytes, encoding);
    }
}
