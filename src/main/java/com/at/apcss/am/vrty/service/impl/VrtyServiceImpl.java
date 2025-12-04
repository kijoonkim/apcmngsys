package com.apcmngsys.apcss.am.vrty.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.apcmngsys.apcss.am.vrty.mapper.VrtyMapper;
import com.apcmngsys.apcss.am.vrty.service.VrtyService;
import com.apcmngsys.apcss.am.vrty.vo.VrtyVO;
import com.apcmngsys.apcss.co.authrt.service.ComAuthrtService;
import com.apcmngsys.apcss.co.sys.service.impl.BaseServiceImpl;

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
