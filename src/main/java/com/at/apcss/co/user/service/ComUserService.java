package com.at.apcss.co.user.service;

import java.util.HashMap;
import java.util.List;

import com.at.apcss.co.user.vo.ComUserVO;

public interface ComUserService {

	/**
	 * 사용자 정보 조회
	 * @param comUserVO
	 * @return
	 */
	public ComUserVO selectComUser(ComUserVO comUserVO) throws Exception;

	public ComUserVO selectComUser(String userId) throws Exception;

	/**
	 * 사용자 정보 목록 조회
	 * @param comUserVO
	 * @return List<>
	 */
	public List<ComUserVO> selectComUserList(ComUserVO comUserVO) throws Exception;

	/**
	 * 사용자 정보를 변경한다.
	 * @param comUserVO
	 * @return
	 */
	public int updateComUser(ComUserVO comUserVO) throws Exception;

	/**
	 * 사용자 승인상태를 변경한다.
	 * @param comUserVO
	 * @return
	 */
	public int updateComUserAprv(ComUserVO comUserVO) throws Exception;

	/**
	 * 사용자 목록 승인등록
	 * @param comUserList
	 * @return
	 */
	public HashMap<String,Object> insertUserAprvList(List<ComUserVO> comUserList) throws Exception;

}
