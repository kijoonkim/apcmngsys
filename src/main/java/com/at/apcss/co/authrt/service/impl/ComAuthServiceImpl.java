package com.at.apcss.co.authrt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.authrt.mapper.ComAuthMapper;
import com.at.apcss.co.authrt.service.ComAuthService;
import com.at.apcss.co.authrt.vo.ComAuthMenuVO;
import com.at.apcss.co.authrt.vo.ComAuthUiVO;
import com.at.apcss.co.authrt.vo.ComAuthUserVO;
import com.at.apcss.co.authrt.vo.ComAuthVO;

@Service("comAuthService")
public class ComAuthServiceImpl implements ComAuthService {

	@Autowired
	private ComAuthMapper comAuthMapper;
	
	@Override
	public ComAuthVO selectComAuth(ComAuthVO comAuthVO) {
		
		ComAuthVO rtnVO = comAuthMapper.selectComAuth(comAuthVO);
		
		return rtnVO;
	}

	@Override
	public ComAuthVO selectComAuth(String authrtId) {
		
		ComAuthVO comAuthVO = new ComAuthVO();
		comAuthVO.setAuthrtId(authrtId);
		
		ComAuthVO rtnVO = comAuthMapper.selectComAuth(comAuthVO);
		
		return rtnVO;
	}

	@Override
	public List<ComAuthVO> selectComAuthList(ComAuthVO comAuthVO) {
		
		List<ComAuthVO> rtnList = comAuthMapper.selectComAuthList(comAuthVO);
		
		return rtnList;
	}

	@Override
	public List<ComAuthMenuVO> selectComAuthMenuList(ComAuthMenuVO comAuthMenuVO) {
		
		List<ComAuthMenuVO> rtnList = comAuthMapper.selectComAuthMenuList(comAuthMenuVO);
		
		return rtnList;
	}

	@Override
	public List<ComAuthUiVO> selectComAuthUiList(ComAuthUiVO comAuthUiVO) {
		
		List<ComAuthUiVO> rtnList = comAuthMapper.selectComAuthUiList(comAuthUiVO);
		
		return rtnList;
	}

	@Override
	public List<ComAuthMenuVO> selectComAuthMenuTreeList(ComAuthMenuVO comAuthMenuVO) {
		
		List<ComAuthMenuVO> rtnList = comAuthMapper.selectComAuthMenuTreeList(comAuthMenuVO);
		
		return rtnList;
	}

	@Override
	public List<ComAuthUserVO> selectComAuthUserList(ComAuthUserVO comAuthUserVO) {
		
		List<ComAuthUserVO> rtnList = comAuthMapper.selectComAuthUserList(comAuthUserVO);
		
		return rtnList;
	}

}
