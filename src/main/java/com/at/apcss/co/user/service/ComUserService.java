package com.at.apcss.co.user.service;

import java.util.List;

import com.at.apcss.co.user.vo.ComUserVO;

public interface ComUserService {

	/**
	 * 사용자 정보 조회
	 * @param comUserVO
	 * @return
	 */
	public ComUserVO selectComUser(ComUserVO comUserVO);
	
	public ComUserVO selectComUser(String userId);
	
	/**
	 * 사용자 정보 목록 조회
	 * @param comUserVO
	 * @return List<>
	 */
	public List<ComUserVO> selectComUserList(ComUserVO comUserVO);
	
}
