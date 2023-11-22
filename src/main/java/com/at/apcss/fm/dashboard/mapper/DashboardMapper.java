package  com.at.apcss.fm.dashboard.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.dashboard.vo.DashboardVO;


@Mapper
public interface DashboardMapper {



	public  List<DashboardVO> selectDashboardInfoList(DashboardVO dashboardVO);
	public  List<DashboardVO> selectDashboardInfoListCnt(DashboardVO dashboardVO);
}
