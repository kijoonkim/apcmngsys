package com.at.apcss.co.sys.util;

import java.util.HashMap;

import org.springframework.util.StringUtils;

import com.at.apcss.co.constants.ComConstants;

public class ComUtil {
	
	public static final HashMap<String, Object> getResultMap() {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put(ComConstants.PROP_RESULT_CODE, ComConstants.CON_BLANK);
		resultMap.put(ComConstants.PROP_RESULT_MESSAGE, ComConstants.CON_BLANK);
		
		return resultMap;
	}
	
	public static final HashMap<String, Object> getResultMap(String errorCode, String errorMessages) {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put(ComConstants.PROP_RESULT_CODE, errorCode);
		resultMap.put(ComConstants.PROP_RESULT_MESSAGE, errorMessages);
		
		return resultMap;
	}
	
	public static final String nullToDefault(String str, String defaultValue) {
		if (StringUtils.hasText(str)) {
			return str;
		} else {
			return defaultValue;
		}
	}
	
	public static final String nullToEmpty(String str) {
		return nullToDefault(str, ComConstants.CON_BLANK);
	}
	
	
	
}
