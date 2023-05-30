package com.at.apcss.co.menu.service;

import java.util.List;

import com.at.apcss.co.menu.vo.ComMenuVO;

public interface ComMenuService {
	
	/**
	 * 메뉴정보 조회
	 * @param comMenuVO
	 * @return
	 */
	public ComMenuVO selectComMenu(ComMenuVO comMenuVO);
	public ComMenuVO selectComMenu(String menuId);
	
	/**
	 * 메뉴목록 조회
	 * @param comMenuVO
	 * @return
	 */
	public List<ComMenuVO> selectComMenuList(ComMenuVO comMenuVO);
	
	/**
	 * 메뉴트리 목록 조회
	 * @param comMenuVO
	 * @return
	 */
	public List<ComMenuVO> selectMenuTreeList(ComMenuVO comMenuVO);
	
	
}
