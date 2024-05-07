package com.at.apcma.com.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcma.com.mapper.ProcMapper;
import com.at.apcma.com.service.ApcMaCommDirectService;

/**
 * @Class Name 		: ComMsgServiceImpl.java
 * @Description 	: 공통으로 처리하는 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 			: 장성주
 * @since 			: 2024.04.29
 * @version 		: 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일      수정자     	수정내용
 * ----------  ----------  	---------------------------
 * 2024.04.29  장성주       최초 생성
 * </pre>
 */
/**
 * @author admin
 *
 */
@Service("apcMaCommDirectService")
public class ApcMaCommDirectServiceImpl implements ApcMaCommDirectService {

	public final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private ProcMapper procMapper;
	
    @Autowired
    public void setProcMapper(ProcMapper mapper) {
    	this.procMapper = mapper;
    }	
	
    public Map<String, Object> callProcTibero(Map<String, Object> param) throws Exception{
    	return procMapper.callProcTibero(param);
    }    
    
	public HashMap<String, Object> callProc(Map<String, Object> param, String rtype) throws Exception{
		
		HashMap<String, Object> rmap = new HashMap<String, Object>();
		
		try {
			
			String[] params = null;
			int cnt 		= 0;
			
			if(rtype.equals("POST")) {
				//post type
				params = param.get("params").toString().split("\\,", -1);
				
			} else {
				//get type
				String temp1 	= param.get("params").toString();
				if(temp1!=null && !temp1.equals("")) {
					String[] temp2	= temp1.split(",");
					params = new String[temp2.length];
					for (String temp3 : temp2) {
						String[] temp4	= temp3.split(":");
						if(temp4.length>1) {
							params[cnt] = temp4[1];
						} else {
							params[cnt] = "";
						}
						cnt ++;
					}
				}
			}
			
			rmap.put("procedure", 		param.get("procedure"));
			rmap.put("workType", 		param.get("workType"));
			rmap.put("cv_count", 		param.get("cv_count"));
			
			rmap.put("getType", 		param.get("getType"));
			if(params!=null) {
				rmap.put("params",		params);
			}
			rmap.put("v_errorCode", 	"");
			rmap.put("v_rowCount", 		0);
			rmap.put("v_errorNote", 	"");
			rmap.put("v_returnStr", 	"");
			rmap.put("v_errorStr", 		"");
			rmap.put("v_errorState",	"");
			rmap.put("v_errorProcedure","");
			int cv_count = Integer.parseInt(param.get("cv_count").toString());
			
			for (int i = 0; i < cv_count; i++) {
				rmap.put("cv_" + (i + 1), new ArrayList<Map<String, Object>>());	
			}
			this.callProcTibero(rmap);    		
    		
		} catch (Exception e) {
			logger.debug(e.getMessage());
		}
		return rmap;
	}    
    
	private String decodeString(String strData) {
        if (strData == null) {
            return "";
        }
        return strData.replaceAll("&lt;", "<").replaceAll("&gt;", ">")
                .replaceAll("&apos;", "'").replaceAll("&#39;", "'")
                .replaceAll("&quot;", "\"")
                .replaceAll("&amp;", "&");
	}    
	
}
