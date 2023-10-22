package com.at.apcss.fm.farm.service;

import java.util.regex.Pattern;

import lombok.extern.slf4j.Slf4j;


/**
 * @Project : AIMMED FrameWork Project
 * @Class : JsonUtil.java
 * @Description : This class for offering JsonUtil functions
 * @Author : ysyoon
 * @Since : 2022. 7.13
 *
 * @Copyright ⓒ AIM-MED
 *-------------------------------------------------------
 * Modification Information
 *-------------------------------------------------------
 * Date          Modifier        Reason
 *-------------------------------------------------------
 * 2022. 7.13    ysyoon          initial
 *-------------------------------------------------------
 */
@Slf4j
public class JsonUtil {

	// Character encoding
	private static final String DEFAULT_ENCODING = "UTF-8";

	/**
	 * String Data가 jsonArray 인지를 반환한다.
	 *
	 * @param str
	 * @return Boolean(true/false)
	 */
	public static Boolean isJSONArray(String str) {
		Pattern pattern = Pattern.compile("\\[\\{(.*?)\\}\\]");

		return pattern.matcher(str.trim()).find();
	}

	// 테스트
	public static void main(String[] args) {
		log.debug("CommUtil.isJSONArray {'aa':[{'bb':'cc'}], 'bb':'a1'} = {}, aaab[b]cccc = {}", isJSONArray("{\"aaaa\":[{\"aaaaa\":\"bbbbb\"}]}"));
	}
}
