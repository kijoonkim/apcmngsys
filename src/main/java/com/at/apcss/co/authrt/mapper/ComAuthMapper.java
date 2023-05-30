package com.at.apcss.co.authrt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.authrt.vo.ComAuthMenuVO;
import com.at.apcss.co.authrt.vo.ComAuthUiVO;
import com.at.apcss.co.authrt.vo.ComAuthUserVO;
import com.at.apcss.co.authrt.vo.ComAuthVO;

@Mapper
public interface ComAuthMapper {
	
	/**
	 * 권한정보 조회
	 * @param comAuthVO
	 * @return
	 */
	public ComAuthVO selectComAuth(ComAuthVO comAuthVO);
	
	/**
	 * 권한정보 목록 조회
	 * @param comAuthVO
	 * @return List<>
	 */
	public List<ComAuthVO> selectComAuthList(ComAuthVO comAuthVO);
	
	/**
	 * 권한 메뉴 목록 조회
	 * @param comAuthVO
	 * @return
	 */
	public List<ComAuthMenuVO> selectComAuthMenuList(ComAuthMenuVO comAuthMenuVO);
	
	/**
	 * 권한 화면 목록 조회
	 * @param comAuthVO
	 * @return
	 */
	public List<ComAuthUiVO> selectComAuthUiList(ComAuthUiVO comAuthUiVO);
	
	/**
	 * 권한 메뉴트리 목록 조회
	 * @param comAuthMenuVO
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
