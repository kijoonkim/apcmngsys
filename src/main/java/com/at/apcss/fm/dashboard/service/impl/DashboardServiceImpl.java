package com.at.apcss.fm.dashboard.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.fm.dashboard.mapper.DashboardMapper;
import com.at.apcss.fm.dashboard.service.DashboardService;
import com.at.apcss.fm.dashboard.vo.DashboardVO;

@Service("dashboardService")
public class DashboardServiceImpl implements DashboardService{

	@Autowired
	private DashboardMapper dashboardMapper;
	
	@Override
	public List<DashboardVO> selectDashboardInfoList(DashboardVO dashboardVO) throws Exception {

		List<DashboardVO> resultList = dashboardMapper.selectDashboardInfoList(dashboardVO);
//		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
//		System.out.println(resultList);
//		System.out.println(resultList.toString());
//		for (DashboardVO msg : resultList ) {
//			//System.out.printf("msgCn : %s", msg.getMsgCn());
//			System.out.println();
//		}
		return resultList;
	}
	
	@Override
	public List<DashboardVO> selectDashboardInfoListCnt(DashboardVO dashboardVO) throws Exception {

		List<DashboardVO> resultList = dashboardMapper.selectDashboardInfoListCnt(dashboardVO);
//		System.out.println("$$$$$$$$$$$$$$$$$$$$$");
//		System.out.println(resultList);
//		System.out.println(resultList.toString());
//		for (DashboardVO msg : resultList ) {
//			//System.out.printf("msgCn : %s", msg.getMsgCn());
//			System.out.println();
//		}
		return resultList;
	}

}
