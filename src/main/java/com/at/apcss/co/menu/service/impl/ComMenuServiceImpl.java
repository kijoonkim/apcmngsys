package com.at.apcss.co.menu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Objects;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.menu.mapper.ComMenuMapper;
import com.at.apcss.co.menu.service.ComMenuService;
import com.at.apcss.co.menu.vo.ComMenuVO;
import com.at.apcss.co.menu.vo.ComUiVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

@Service("comMenuService")
public class ComMenuServiceImpl extends BaseServiceImpl implements ComMenuService {

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
	public HashMap<String, Object> multiSaveComUiList(List<ComUiVO> comUiList) throws Exception {

		List<ComMenuVO> menuInfoList = comUiList.get(0).getMenuInfoList();
		
		if (menuInfoList.size() > 0) {
			menuInfoList.get(0).setSysLastChgPrgrmId(comUiList.get(0).getSysLastChgPrgrmId());
			menuInfoList.get(0).setSysLastChgUserId(comUiList.get(0).getSysLastChgUserId());
			
			if (0 == updateMenu(menuInfoList.get(0))) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
			}
		}
		
		if (!Objects.isNull(comUiList.get(0).getEntyId())) {
			for (ComUiVO comUiVO : comUiList) {
				if ("I".equals(comUiVO.getRowSts())){
					if (0 == insertComUi(comUiVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				} else if ("U".equals(comUiVO.getRowSts())) {
					if (0 == updateComUi(comUiVO)) {
						throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "저장 중 오류가 발생 했습니다."))); // E0000	{0}
					}
				}
			}
		}
		return null;
	}

	@Override
	public List<ComMenuVO> selectMenuListByType(ComMenuVO comMenuVO) throws Exception {
		List<ComMenuVO> resultList = comMenuMapper.selectMenuListByType(comMenuVO);
		return resultList;
	}


}
