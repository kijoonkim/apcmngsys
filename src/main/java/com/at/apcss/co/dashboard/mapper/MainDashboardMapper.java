package com.at.apcss.co.dashboard.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.dashboard.vo.DashboardVO;

/**
 * 대시보드 데이터를 조회하는 DAO 클래스
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
@Mapper
public interface MainDashboardMapper {

	public  List<DashboardVO> selectDashboardInfoList(DashboardVO gv_apcCd) throws Exception;

	public List<DashboardVO.DayPrcsSttn> selectdayPrcsSttnList(DashboardVO gv_apcCd) throws Exception;

}
