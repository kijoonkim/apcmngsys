package com.at.apcss.am.vrty.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.apc.mapper.ApcEvrmntStngMapper;
import com.at.apcss.am.cmns.service.PltBxService;
import com.at.apcss.am.vrty.service.VrtyService;
import com.at.apcss.co.authrt.service.ComAuthrtService;
import com.at.apcss.co.cd.service.ComCdService;
import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

//public class VrtyServiceImpl {
	@Service("vrtyService")
public class VrtyServiceImpl extends BaseServiceImpl implements VrtyService{
		
		@Autowired
		private ApcEvrmntStngMapper apcEvrmntStngMapper;

		// 권한관리
		@Resource(name = "comAuthrtService")
		private ComAuthrtService comAuthrtService;

		// 공통코드
		@Resource(name = "comCdService")
		private ComCdService comCdService;

		// 팔레트/박스
		@Resource(name = "pltBxService")
		private PltBxService pltBxService;
		
		@Override
		public List<ComCdVO> selectVrtyList(ComCdVO comCdVO) throws Exception {
			return apcEvrmntStngMapper.selectVrtyList(comCdVO);
		}
		
}
