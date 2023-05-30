package com.at.apcss.co.menu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.menu.vo.ComMenuVO;

@Mapper
public interface ComMenuMapper {

	/**
	 * 메뉴정보 조회
	 * @param comMenuVO
	 * @return
	 */
	public ComMenuVO selectComMenu(ComMenuVO comMenuVO);
	
	/**
	 * 메뉴정보 목록 조회
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
