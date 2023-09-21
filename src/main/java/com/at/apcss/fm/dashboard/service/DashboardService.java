package com.at.apcss.fm.dashboard.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.fm.dashboard.vo.DashboardVO;

public interface DashboardService {


	public List<DashboardVO> selectDashboardInfoList(DashboardVO dashboardVO) throws Exception;
	public List<DashboardVO> selectDashboardInfoListCnt(DashboardVO dashboardVO) throws Exception;


}
