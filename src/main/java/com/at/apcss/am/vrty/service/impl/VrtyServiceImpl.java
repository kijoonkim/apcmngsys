package com.at.apcss.am.vrty.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.at.apcss.am.vrty.mapper.VrtyMapper;
import com.at.apcss.am.vrty.service.VrtyService;
import com.at.apcss.am.vrty.vo.VrtyVO;
import com.at.apcss.co.authrt.service.ComAuthrtService;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

//public class VrtyServiceImpl {
	@Service("vrtyService")
public class VrtyServiceImpl extends BaseServiceImpl implements VrtyService{
		
		@Autowired
		private VrtyMapper vrtyMapper;

		// 권한관리
		@Resource(name = "comAuthrtService")
		private ComAuthrtService comAuthrtService;
		
		@Override
		public List<VrtyVO> selectVrtyList(VrtyVO vrtyVO) throws Exception {
			return vrtyMapper.selectVrtyList(vrtyVO);
		}
		
}
