package com.at.apcma.com.service.impl;

import java.util.*;
import java.util.stream.Collectors;

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
    
	public HashMap<String, Object> callProc(Map<String, Object> param, String rtype, String ptype) throws Exception{
		
		HashMap<String, Object> rmap = new HashMap<String, Object>();
		try {
			HashMap<String, Object> map1 = this.InnerCallProc(param, rtype, ptype);
			rmap = this.checkError(map1);
		} catch (Exception e) {
			logger.debug(e.getMessage());
		}
		return rmap;
	}
	
	private HashMap<String, Object> InnerCallProc(Map<String, Object> param, String rtype, String ptype) throws Exception{
		
		HashMap<String, Object> rmap = new HashMap<String, Object>();
		
		try {
			
			String[] params = null;
			int cnt 		= 0;
			
			if(rtype.equals("POST")) {
				//post type
				if(ptype.equals("")) {
					params = param.get("params").toString().split(",", -1);
				} else {
					params = (String[])param.get("params");
				}
				
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

			if(!param.containsKey("convertCamelCase") || param.get("convertCamelCase").equals("Y"))
				convertCamelCase(rmap);
    		
		} catch (Exception e) {
			logger.debug(e.getMessage());
		}
		return rmap;
	}    
    
	private HashMap<String, Object> checkError(Map<String, Object> param) throws Exception{
		
		HashMap<String, Object> rmap = new HashMap<String, Object>();
		rmap.putAll(param);
		
		try {
			
			//정상
			HashMap<String, Object> emap1 = new HashMap<String, Object>();
			emap1.put("MSG0000", 	"정상적으로 처리 되었습니다.");
			emap1.put("MSG0001", 	"정상적으로 조회가 되었습니다.");
			emap1.put("MSG0002", 	"정상적으로 등록되었습니다.");
			emap1.put("MSG0003", 	"정상적으로 삭제되었습니다.");
			emap1.put("MSG0004", 	"정상적으로 수정되었습니다.");
			
			//에러
			HashMap<String, Object> emap2 = new HashMap<String, Object>();
			emap2.put("MSG0029", 	"등록된 레코드가 없습니다.(Error : MSG0029)");
			emap2.put("MSG0030", 	"수정된 레코드가 없습니다.(Error : MSG0030)");
			emap2.put("MSG0031", 	"삭제된 레코드가 없습니다.(Error : MSG0031)");
			emap2.put("ERR0000", 	"에러가 발생하였습니다.(Error : ERR0000)");
			emap2.put("ERR0006", 	"조회시 에러가 발생하였습니다.(Error : ERR0006)");
			emap2.put("ERR0008", 	"등록시 에러가 발생하였습니다.(Error : ERR0008)");
			emap2.put("ERR0009", 	"수정시 에러가 발생하였습니다.(Error : ERR0009)");
			emap2.put("ERR0010", 	"삭제시 에러가 발생하였습니다.(Error : ERR0010)");
			emap2.put("ERR0001", 	"차대가 맞지 않습니다.(Error : ERR0001)");
			emap2.put("ERR0011", 	"거래처의 계정과목이 누락되었습니다.(Error : ERR0011)");
			
			String[] temp1 = new String[]{
					"KOR", "", "", ""
			};
			HashMap<String, Object> temp2 = new HashMap<String, Object>();
			temp2.put("procedure", 	"USRMAT.P_SERVICEMESSAGE");
			temp2.put("workType", 	"QESS");
			temp2.put("getType", 	"json");
			temp2.put("cv_count", 	"1");
			temp2.put("params", 	temp1);
			HashMap<String, Object> temp3 = this.InnerCallProc(temp2, "POST", "A");
			List<Map<String, Object>> cv_1 = (ArrayList<Map<String, Object>>)temp3.get("cv_1");
			
			//check
			String p_errorCode 	= param.get("v_errorCode").toString();
			String p_errorStr 	= param.get("v_errorStr").toString();
			
			//1 - 정상
			for (String key : emap1.keySet()) {
			    String value = emap1.get(key).toString();
			    if(p_errorCode.equals(key)) {
			    	rmap.put("resultStatus", 	"S");
			    	rmap.put("resultMessage", 	value);
			    	if(!p_errorCode.equals("MSG0001")) {
			    		rmap.put("resultMessage", 	"");
			    	}
			    	return rmap;
			    }
			}			
			
			//2 - error
			for (String key : emap2.keySet()) {
			    String value = emap2.get(key).toString();
			    if(p_errorCode.equals(key)) {
			    	rmap.put("resultStatus", 	"E");
			    	rmap.put("resultMessage", 	value);
			    	if(!p_errorCode.equals("MSG0001")) {
			    		rmap.put("resultMessage", 	"");
			    	}
			    	return rmap;
			    }
			}			
			
			//3 - other error message
			for (int i = 0; i < cv_1.size() ; i++) {
		        if (p_errorCode.equals(cv_1.get(i).get("error_code").toString())){
			    	rmap.put("resultStatus", 	"E");
		    		rmap.put("resultMessage", 	cv_1.get(i).get("error_str").toString() + "\n" + p_errorStr);
			    	return rmap;
		        }
			}
			
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

	private Map<String, Object> convertLowerCase(Map<String, Object> originData) {
		try {
			for(String key : originData.keySet()) {
				if (key.matches("cv\\_\\d")) {
					if(Objects.nonNull(originData.get(key)) && originData.get(key) instanceof List) {
						List<Map<String, Object>> cv = (List<Map<String, Object>>) originData.get(key);
						List<Map<String, Object>> data = cv.stream()
								.map(map -> map.entrySet().stream()
										.collect(Collectors.toMap(
												entry -> entry.getKey().toLowerCase(),
												Map.Entry::getValue,
												(oldValue, newValue) -> oldValue))
								)
								.collect(Collectors.toList());
						originData.put(key, data);
					}
				}
			}
			return originData;
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return originData;
		}
	}

	private Map<String, Object> convertCamelCase(Map<String, Object> originData) {
		try {
			for(String key : originData.keySet()) {
				if (key.matches("cv\\_\\d")) {
					if(Objects.nonNull(originData.get(key)) && originData.get(key) instanceof List) {
						List<Map<String, Object>> cv = (List<Map<String, Object>>) originData.get(key);
						List<Map<String, Object>> data = cv.stream()
								.map(map -> map.entrySet().stream()
										.collect(Collectors.toMap(
												entry -> toCamelCase(entry.getKey()),
												Map.Entry::getValue,
												(oldValue, newValue) -> oldValue))
								)
								.collect(Collectors.toList());
						originData.put(key, data);
					}
				}
			}
			return originData;
		} catch (Exception e) {
			logger.debug(e.getMessage());
			return originData;
		}
	}

	public static String toCamelCase(String s) {
		if (s == null || s.isEmpty()) {
			return s;
		}

		String[] parts = s.split("[ _-]");  // Splitting by space, underscore, or dash
		StringBuilder camelCaseString = new StringBuilder(parts[0].toLowerCase());

		for (int i = 1; i < parts.length; i++) {
			String part = parts[i];
			camelCaseString.append(part.substring(0, 1).toUpperCase()).append(part.substring(1).toLowerCase());
		}

		return camelCaseString.toString();
	}
}
