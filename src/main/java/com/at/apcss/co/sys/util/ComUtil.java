package com.at.apcss.co.sys.util;

import java.util.HashMap;

import com.at.apcss.co.constants.ComConstants;

public class ComUtil {
	
	public static final HashMap<String, Object> getResultMap() {
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put(ComConstants.PROP_RESULT_CODE, ComConstants.CON_BLANK);
		resultMap.put(ComConstants.PROP_RESULT_MESSAGE, ComConstants.CON_BLANK);
		
		return resultMap;
	}
}
