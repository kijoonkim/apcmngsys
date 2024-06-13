package com.at.apcma.com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.at.apcma.com.mapper.ProcMapper;
import com.at.apcma.com.service.ApcMaComService;
import com.at.apcma.com.service.ApcMaComUtil;
import com.at.apcma.com.service.ApcMaCommDirectService;

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
	
    @Autowired
    public void setProcMapper(ProcMapper mapper) {
    	this.procMapper = mapper;
    }	
	
	//파일 업로드 경로
	@Value("${upload.path2}")
    private String filePath;
    
    public Map<String, Object> callProcTibero(Map<String, Object> param) throws Exception{
    	return procMapper.callProcTibero(param);
    }    
    
	public HashMap<String, Object> linkAddProcess(Map<String, Object> param, HttpSession session) {

		HashMap<String, Object> rmap 	= new HashMap<String, Object>();
		Map<String, Object> ssmap 		= (HashMap<String, Object>)session.getAttribute("maSessionInfo");
		
		try {
			
			Map<String, Object> gmap1 = new HashMap<String, Object>();
			gmap1.put("procedure", 			"P_COM5100_S");
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
				{"V_P_PROC_ID",				"P_COM5100_S"},
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
			gmap1.put("procedure", 			"P_COM5100_S");
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
				{"V_P_PROC_ID",				"P_COM5100_S"},
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
			gmap1.put("procedure", 			"P_COM5100_S");
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
					{"V_P_PROC_ID",				"P_COM5100_S"},
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
			gmap4.put("procedure", 			"P_COM5100_Q");
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
					{"V_P_PROC_ID",				"P_COM5100_Q"},
					{"V_P_USERID",				ssmap.get("USERID").toString()},
					{"V_P_PC",					param.get("ipAddress").toString()}
			};			
			Map<String, Object> map3 = apcMaCommDirectService.InnerCallProc2(gmap4, palist2); 
    		List<Map<String, Object>> clist = (ArrayList<Map<String, Object>>)map3.get("cv_1");	
			Map<String, Object> map4 = clist.get(0);			
			
			//FILE_SERVER_PATH
			if(map4.containsKey("FILE_SERVER_PATH") && !map4.get("FILE_SERVER_PATH").equals("")) {
				dpath = map4.get("FILE_SERVER_PATH").toString();
			}			
			
			//delete data --------------------------------------------------------
			Map<String, Object> gmap1 = new HashMap<String, Object>();
			gmap1.put("procedure", 			"P_COM5100_S");
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
					{"V_P_PROC_ID",				"P_COM5100_S"},
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
			
			var newFilePath = filePath;
			
			//file Prefix Name create
			if(newFilePath.contains(":")){
				//window path
				if(!String.valueOf(newFilePath.charAt(newFilePath.length()-1)).equals("\\")) {
					newFilePath = newFilePath + "\\"; 
				}
				if(param.get("source_code")==null || param.get("source_code").equals("") || param.get("source_code").equals("null")) {
					newFilePath = newFilePath + param.get("source_type").toString() + "\\" + "null" + "\\";
				} else {
					newFilePath = newFilePath + param.get("source_type").toString() + "\\" + param.get("source_code").toString() + "\\";
				}
				
			} else {
				//other path
				if(!String.valueOf(newFilePath.charAt(newFilePath.length()-1)).equals("/")) {
					newFilePath = newFilePath+ "/"; 
				}
				if(param.get("source_code")==null || param.get("source_code").equals("") || param.get("source_code").equals("null")) {
					newFilePath = newFilePath + param.get("source_type").toString() + "/" + "null" + "/";
				} else {
					newFilePath = newFilePath + param.get("source_type").toString() + "/" + param.get("source_code").toString() + "/";
				}
				
			}
			
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
			gmap1.put("procedure", 			"P_COM5100_S");
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
					{"V_P_PROC_ID",				"P_COM5100_S"},
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
	
}
