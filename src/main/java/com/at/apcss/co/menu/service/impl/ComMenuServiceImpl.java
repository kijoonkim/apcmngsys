package com.at.apcss.co.menu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.menu.mapper.ComMenuMapper;
import com.at.apcss.co.menu.service.ComMenuService;
import com.at.apcss.co.menu.vo.ComMenuVO;

@Service("comMenuService")
public class ComMenuServiceImpl implements ComMenuService {

	@Autowired
	private ComMenuMapper comMenuMapper;
	
	@Override
	public ComMenuVO selectComMenu(ComMenuVO comMenuVO) {
		
		ComMenuVO comMenuResultVO = comMenuMapper.selectComMenu(comMenuVO);
		
		return comMenuResultVO;
	}

	@Override
	public ComMenuVO selectComMenu(String menuId) {
		
		ComMenuVO comMenuVO = new ComMenuVO();
		comMenuVO.setMenuId(menuId);
		
		ComMenuVO comMenuResultVO = comMenuMapper.selectComMenu(comMenuVO);
		
		return comMenuResultVO;
	}
	
	@Override
	public List<ComMenuVO> selectComMenuList(ComMenuVO comMenuVO) {
		
		List<ComMenuVO> menuList = comMenuMapper.selectComMenuList(comMenuVO);
		
		return menuList;
	}

	@Override
	public List<ComMenuVO> selectMenuTreeList(ComMenuVO comMenuVO) {
		
		List<ComMenuVO> menuList = comMenuMapper.selectMenuTreeList(comMenuVO);
		
		return menuList;
	}

	@Override
	public List<ComMenuVO> selectTopMenuList(ComMenuVO comMenuVO) {
		
		List<ComMenuVO> menuList = comMenuMapper.selectTopMenuList(comMenuVO);
		
		return menuList;
	}

	@Override
	public List<ComMenuVO> selectLeftMenuList(ComMenuVO comMenuVO) {
		
		List<ComMenuVO> menuList = comMenuMapper.selectLeftMenuList(comMenuVO);
		
		return menuList;
	}


	
	
	
}
