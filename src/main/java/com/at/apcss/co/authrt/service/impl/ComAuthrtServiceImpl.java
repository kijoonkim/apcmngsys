package com.at.apcss.co.authrt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.authrt.mapper.ComAuthrtMapper;
import com.at.apcss.co.authrt.service.ComAuthrtService;
import com.at.apcss.co.authrt.vo.ComAuthrtMenuVO;
import com.at.apcss.co.authrt.vo.ComAuthrtUiVO;
import com.at.apcss.co.authrt.vo.ComAuthrtUserVO;
import com.at.apcss.co.authrt.vo.ComAuthrtVO;

@Service("comAuthrtService")
public class ComAuthrtServiceImpl implements ComAuthrtService {

	@Autowired
	private ComAuthrtMapper comAuthrtMapper;
	
	@Override
	public ComAuthrtVO selectComAuthrt(ComAuthrtVO comAuthrtVO) {
		
		ComAuthrtVO rtnVO = comAuthrtMapper.selectComAuthrt(comAuthrtVO);
		
		return rtnVO;
	}

	@Override
	public ComAuthrtVO selectComAuthrt(String authrtId) {
		
		ComAuthrtVO comAuthrtVO = new ComAuthrtVO();
		comAuthrtVO.setAuthrtId(authrtId);
		
		ComAuthrtVO rtnVO = comAuthrtMapper.selectComAuthrt(comAuthrtVO);
		
		return rtnVO;
	}

	@Override
	public List<ComAuthrtVO> selectComAuthrtList(ComAuthrtVO comAuthrtVO) {
		
		List<ComAuthrtVO> rtnList = comAuthrtMapper.selectComAuthrtList(comAuthrtVO);
		
		return rtnList;
	}

	@Override
	public List<ComAuthrtMenuVO> selectComAuthrtMenuList(ComAuthrtMenuVO comAuthrtMenuVO) {
		
		List<ComAuthrtMenuVO> rtnList = comAuthrtMapper.selectComAuthrtMenuList(comAuthrtMenuVO);
		
		return rtnList;
	}

	@Override
	public List<ComAuthrtUiVO> selectComAuthrtUiList(ComAuthrtUiVO comAuthrtUiVO) {
		
		List<ComAuthrtUiVO> rtnList = comAuthrtMapper.selectComAuthrtUiList(comAuthrtUiVO);
		
		return rtnList;
	}

	@Override
	public List<ComAuthrtMenuVO> selectComAuthrtMenuTreeList(ComAuthrtMenuVO comAuthrtMenuVO) {
		
		List<ComAuthrtMenuVO> rtnList = comAuthrtMapper.selectComAuthrtMenuTreeList(comAuthrtMenuVO);
		
		return rtnList;
	}

	@Override
	public List<ComAuthrtUserVO> selectComAuthrtUserList(ComAuthrtUserVO comAuthrtUserVO) {
		
		List<ComAuthrtUserVO> rtnList = comAuthrtMapper.selectComAuthrtUserList(comAuthrtUserVO);
		
		return rtnList;
	}

	@Override
	public int insertComAuthrtMenu(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateComAuthrtMenu(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComAuthrtMenu(ComAuthrtMenuVO comAuthrtMenuVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ComAuthrtUserVO selectComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteComAuthrtUser(ComAuthrtUserVO comAuthrtUserVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
