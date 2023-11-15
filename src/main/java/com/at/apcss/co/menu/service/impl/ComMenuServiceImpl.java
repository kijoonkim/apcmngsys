package com.at.apcss.co.menu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.menu.mapper.ComMenuMapper;
import com.at.apcss.co.menu.service.ComMenuService;
import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.menu.vo.ComUiVO;

@Service("comMenuService")
public class ComMenuServiceImpl implements ComMenuService {

	@Autowired
	private ComMenuMapper comMenuMapper;

	@Override
	public ComMenuVO selectComMenu(ComMenuVO comMenuVO) throws Exception {

		ComMenuVO comMenuResultVO = comMenuMapper.selectComMenu(comMenuVO);

		return comMenuResultVO;
	}

	@Override
	public ComMenuVO selectComMenu(String menuId) throws Exception {

		ComMenuVO comMenuVO = new ComMenuVO();
		comMenuVO.setMenuId(menuId);

		ComMenuVO comMenuResultVO = comMenuMapper.selectComMenu(comMenuVO);

		return comMenuResultVO;
	}

	@Override
	public List<ComMenuVO> selectComMenuList(ComMenuVO comMenuVO) throws Exception {

		List<ComMenuVO> menuList = comMenuMapper.selectComMenuList(comMenuVO);

		return menuList;
	}

	@Override
	public List<ComMenuVO> selectMenuTreeList(ComMenuVO comMenuVO) throws Exception {

		List<ComMenuVO> menuList = comMenuMapper.selectMenuTreeList(comMenuVO);

		return menuList;
	}

	@Override
	public List<ComMenuVO> selectTopMenuList(ComMenuVO comMenuVO) throws Exception {

		List<ComMenuVO> menuList = comMenuMapper.selectTopMenuList(comMenuVO);

		return menuList;
	}

	@Override
	public List<ComMenuVO> selectLeftMenuList(ComMenuVO comMenuVO) throws Exception {

		List<ComMenuVO> menuList = comMenuMapper.selectLeftMenuList(comMenuVO);

		return menuList;
	}

	@Override
	public int insertMenu(ComMenuVO comMenuVO) throws Exception {
		return comMenuMapper.insertMenu(comMenuVO);
	}

	@Override
	public int updateMenu(ComMenuVO comMenuVO) throws Exception {
		return comMenuMapper.updateMenu(comMenuVO);
	}

	@Override
	public List<ComMenuVO> selectMenuList(ComMenuVO comMenuVO) throws Exception {
		List<ComMenuVO> menuList = comMenuMapper.selectMenuList(comMenuVO);
		return menuList;
	}

	@Override
	public int deleteMenu(ComMenuVO comMenuVO) throws Exception {
		return comMenuMapper.deleteMenu(comMenuVO);
	}

	@Override
	public List<ComUiVO> selectComUiList(ComUiVO comUiVO) throws Exception {
		return comMenuMapper.selectComUiList(comUiVO);
	}

	@Override
	public ComUiVO selectComUi(ComUiVO comUiVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertComUi(ComUiVO comUiVO) throws Exception {
		return comMenuMapper.insertComUi(comUiVO);
	}

	@Override
	public int updateComUi(ComUiVO comUiVO) throws Exception {
		return comMenuMapper.updateComUi(comUiVO);
	}

	@Override
	public int deleteComUi(ComUiVO comUiVO) throws Exception {
		return comMenuMapper.deleteComUi(comUiVO);
	}

	@Override
	public List<ComMenuVO> selectMenuUiList(ComMenuVO comMenuVO) throws Exception {
		return comMenuMapper.selectMenuUiList(comMenuVO);
	}

	@Override
	public int multiSaveComUiList(List<ComUiVO> comUiList) throws Exception {

		int savedCnt = 0;
		for (ComUiVO comUiVO : comUiList) {
			if("I".equals(comUiVO.getRowSts())){
				savedCnt += insertComUi(comUiVO);
			}else if("U".equals(comUiVO.getRowSts())) {
				savedCnt += updateComUi(comUiVO);
			}
		}
		return savedCnt;
	}

	@Override
	public List<ComMenuVO> selectMenuListByType(ComMenuVO comMenuVO) throws Exception {
		List<ComMenuVO> resultList = comMenuMapper.selectMenuListByType(comMenuVO);
		return resultList;
	}


}
