package com.at.apcss.fm.farm.service;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;


/**
 * @Project : AIMMED FrameWork Project
 * @Class : TypeUtil.java
 * @Description : This class for offering TypeUtil functions
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
public class TypeUtil {

	public static final String UTF8_BOM = "\uFEFF";
	public static final Charset UTF_8 = StandardCharsets.UTF_8;

	/**
	 * Remove UTF-8 BOM
	 *
	 * @param s
	 * @return
	 */
	public static String removeUTF8BOM(String s) {
		if (s.startsWith(UTF8_BOM)) {
			s = s.substring(1);
		}
		return s;
	}
}