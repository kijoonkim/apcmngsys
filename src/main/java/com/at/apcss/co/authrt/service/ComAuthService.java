package com.at.apcss.co.authrt.service;

import java.util.List;

import com.at.apcss.co.authrt.vo.ComAuthMenuVO;
import com.at.apcss.co.authrt.vo.ComAuthUiVO;
import com.at.apcss.co.authrt.vo.ComAuthUserVO;
import com.at.apcss.co.authrt.vo.ComAuthVO;

public interface ComAuthService {
	
	/**
	 * 권한 정보 조회
	 * @param comAuthVO
	 * @return
	 */
	public ComAuthVO selectComAuth(ComAuthVO comAuthVO);
	public ComAuthVO selectComAuth(String authrtId);
	
	/**
	 * 권한 정보 목록 조회
	 * @param comAuthVO
	 * @return
	 */
	public List<ComAuthVO> selectComAuthList(ComAuthVO comAuthVO);
	
	/**
	 * 권한 메뉴 목록 조회
	 * @param ComAuthMenuVO
	 * @return
	 */
	public List<ComAuthMenuVO> selectComAuthMenuList(ComAuthMenuVO comAuthMenuVO);
	
	/**
	 * 권한 화면 목록 조회
	 * @param ComAuthUiVO
	 * @return
	 */
	public List<ComAuthUiVO> selectComAuthUiList(ComAuthUiVO comAuthUiVO);
	
	/**
	 * 권한 메뉴트리 목록 조회
	 * @param ComAuthMenuVO
	 * @return
	 */
	public List<ComAuthMenuVO> selectComAuthMenuTreeList(ComAuthMenuVO comAuthMenuVO);
	
	/**
	 * 권한 사용자 목록 조회
	 * @param comAuthUserVO
	 * @return
	 */
	public List<ComAuthUserVO> selectComAuthUserList(ComAuthUserVO comAuthUserVO);

}
