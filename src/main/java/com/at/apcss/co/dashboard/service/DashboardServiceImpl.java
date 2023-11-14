package com.at.apcss.co.dashboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.dashboard.mapper.MainDashboardMapper;
import com.at.apcss.co.dashboard.vo.DashboardVO;

/**
 * 대시보드 데이터를 조회하는 Service
 * @author 손민성
 * @since 2023.11.14
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *  수정일         수정자       수정내용
 *  ----------   --------   ---------------------------
 *  2023.11.14   손민성       최초 생성
 *  </pre>
 */
@Service("DashboardService")
public class DashboardServiceImpl implements DashboardService{
	@Autowired
	private MainDashboardMapper mainDashboardMapper;

	/**
	 * 대시보드 정보조회
	 * @param gv_apcCd
	 * @return
	 */
	@Override
	public List<DashboardVO> selectStats(DashboardVO gv_apcCd) throws Exception {
		// TODO Auto-generated method stub
		List<DashboardVO> resultList = mainDashboardMapper.selectDashboardInfoList(gv_apcCd);
		List<DashboardVO.DayPrcsSttn> dayPrcsSttnList = mainDashboardMapper.selectdayPrcsSttnList(gv_apcCd);
		resultList.get(0).setDayPrcsSttn(dayPrcsSttnList);
		return resultList;
	}

}
