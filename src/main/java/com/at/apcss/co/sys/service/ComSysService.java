package com.at.apcss.co.sys.service;

import java.util.HashMap;

import com.at.apcss.co.sys.vo.ComSysVO;

public interface ComSysService {

	/**
	 * 
	 * @param comSysVO
	 * @return
	 */
	public HashMap<String, Object> insertComeMenuLogPrsnaInfo(ComSysVO comSysVO) throws Exception;
}
