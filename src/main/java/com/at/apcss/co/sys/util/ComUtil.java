package com.at.apcss.co.sys.util;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.MapUtils;
import org.springframework.util.ObjectUtils;
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
	
	public static final String toString(int num) {
		return Integer.toString(num);
	}
	public static final String toString(double num) { return Double.toString(num);}


	public static final String nullToEmpty(String str) {
		return nullToDefault(str, ComConstants.CON_BLANK);
	}
	
	public static final double round(double num, int digit) {
		
		double result = num;
		
		double factor = Math.pow(10, (digit * -1));
		result = Math.round(num / factor) * factor;
		
		return result;
	}
	
	public static final double round(double num) {		
		return Math.round(num);
	}
	
	public static final int round(int num, int digit) {
		
		int result = num;
		
		double factor = Math.pow(10, (digit * -1));
		
		result = (int)(Math.round(num / factor) * factor);
		
		return result;
	}
	
	public static final int round(int num) {		
		return Math.round(num);
	}
	
	public static String rPad(String str, Integer length, char car) {
	  return (str + String.format("%" + length + "s", "").replace(" ", String.valueOf(car))).substring(0, length);
	}

	public static String lPad(String str, Integer length, char car) {
	  return (String.format("%" + length + "s", "").replace(" ", String.valueOf(car)) + str).substring(str.length(), length + str.length());
	}


	public static <T> T convertVo(Map<String,Object> map, Class<T> vo) throws Exception {
		T obj = null;
		if (ObjectUtils.isEmpty(vo)) {
			throw new Exception("CommonUtils convertVo : vo Class null");
		} else {
			//vo 객체 생성
			obj = vo.getConstructor().newInstance();

			if (MapUtils.isEmpty(map)) {
				return obj;
			} else {
				for (Map.Entry<String, Object> entry : map.entrySet()) {
					//vo 필드 id 추출
					Field[] field = vo.getDeclaredFields();

					for (Field v : field) {
						v.setAccessible(true);      //필드에 접근하기 위해

						if (null != entry.getValue() && entry.getKey().equals(v.getName())) {

							try {
								Object returnValue  = map.get(v.getName());

								//                                log.info("value : " + entry.getValue());
								//                                log.info("type : " + entry.getValue().getClass() + " : " + v.getType());
								//                                log.info("key : " +  entry.getKey() + " : " + v.getName());

								//Map > vo 형 변환 시 BigDecimal은 동적 변환이 안되서 정적변환 (웬만하면 알아서 파싱 할 것 같은데 파싱하다 에러나면 하나씩 추가해줘야함 ㅠㅠ)
								if (!entry.getValue().getClass().equals(v.getType()) && String.valueOf(v.getType()).contains("BigDecimal")) {
									returnValue = new BigDecimal(String.valueOf(entry.getValue()));
								}

								v.set(obj, returnValue);    //값이 존재하는 것만 set

							} catch (Exception e) {
								throw new Exception("CommonUtils convertVo Error : " + e.getMessage());
							}

						}
					}
				}
			}
		}

		return obj;
	}


}
