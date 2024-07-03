package com.at.apcma.com.service;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

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
	
	/**
	 * 사진 및 싸인 이미지 저장 Service
	 * @param param
	 * @param session
	 * @param ipAddress
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, Object> hrImageUploadProcess(MultipartFile mfile, Map<String, Object> param, HttpSession session);

	/**
	 * 화면에서 list로 보낸 data를 for-loop를 통해 일괄 처리
	 * @param param
	 * @param session
	 * @param request
	 * @param ptype
	 * @param procedureName
	 * @return
	 */
	HashMap<String, Object> processForListData(Map<String, Object> param, HttpSession session, HttpServletRequest request, String ptype, String procedureName) throws Exception;

}
