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
	
	/**
	 * 
	 * @param comSysVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> insertComSession(ComSysVO comSysVO) throws Exception;
	
	/**
	 * 
	 * @param comSysVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateComSessionExpiry(ComSysVO comSysVO) throws Exception;
	
	/**
	 * user id로 기존 세션 종료 처리
	 * @param comSysVO
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> updateComSessionExpiryByUser(ComSysVO comSysVO) throws Exception;
	
	/**
	 * 세션 유효성 체크
	 * @param sessId
	 * @return
	 * @throws Exception
	 */
	public boolean checkSessionValid(String sessId) throws Exception;
	
	/**
	 * 중복 로그인 확인
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public boolean checkDuplicatedUser(String userId, String userIp) throws Exception;
	
}
