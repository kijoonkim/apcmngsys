package com.at.apcma.com.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface ApcMaComService {

	/**
	 * 링크 저장 Service
	 * @param param
	 * @param session
	 * @param ipAddress
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> linkAddProcess(Map<String, Object> param, HttpSession session) throws Exception;
	
	/**
	 * 링크/파일 수정 Service
	 * @param param
	 * @param session
	 * @param ipAddress
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> linkFileUpdateProcess(Map<String, Object> param, HttpSession session) throws Exception;
	
	/**
	 * 링크 삭제 Service
	 * @param param
	 * @param session
	 * @param ipAddress
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> linkDeleteProcess(Map<String, Object> param, HttpSession session) throws Exception;
	
	/**
	 * 파일 삭제 Service
	 * @param param
	 * @param session
	 * @param ipAddress
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> fileDeleteProcess(Map<String, Object> param, HttpSession session) throws Exception;
	
	/**
	 * 파일 저장 Service
	 * @param param
	 * @param session
	 * @param ipAddress
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> fileAddProcess(MultipartFile mfile, Map<String, Object> param, HttpSession session);

}
