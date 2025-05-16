package com.at.apcss.mobile.service.impl;

import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.wrhs.mapper.RawMtrWrhsMapper;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.mobile.mapper.MobileApiMapper;
import com.at.apcss.mobile.service.MobileApiService;
import com.at.apcss.mobile.vo.FacilityMngVO;
import com.at.apcss.mobile.vo.WarehouseInfoVO;


/**
 * 모바일 입고 관리 Service
 * @author joon
 * @since 2023.11.22
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.11.22  joon       최초 생성
 * </pre>
 */

@Service("mobileApiService")
public class MobileApiServiceImpl extends BaseServiceImpl implements MobileApiService{
	@Autowired
	private MobileApiMapper mobileApiMapper;

	@Autowired
	private CmnsTaskNoService cmnsTaskNoService;

	@Override
	public int addRefreshToken(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mobileApiMapper.addRefreshToken(map);
	}

	@Override
	public int delRefreshToken(String userId) throws Exception {
		// TODO Auto-generated method stub
		return mobileApiMapper.delRefreshToken(userId);
	}

	@Override
	public Map<String, Object> findRefreshToken(String userId) throws Exception {
		// TODO Auto-generated method stub
		return mobileApiMapper.findRefreshToken(userId);
	}

	@Override
	public Map<String, Object> getStatsForOneYearBySearchYmd() throws Exception {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String searchYmd = sdf.format(new Date());

		Calendar cal = Calendar.getInstance();
		// searchYmd = "20011021";
		cal.set(Calendar.YEAR, Integer.parseInt(searchYmd.substring(0, 4)));
		cal.set(Calendar.MONTH, Integer.parseInt(searchYmd.substring(4, 6)) - 1);
		//1년 전
		cal.add(Calendar.MONTH, -11);
		cal.set(Calendar.DATE, Integer.parseInt(searchYmd.substring(6, 8)));

		long writeTime = cal.getTimeInMillis();

		String searchYmdFrom = sdf.format(new Date(writeTime));
		searchYmdFrom = searchYmdFrom.substring(0, 6)+"01";
		String searchYmdTo = searchYmd.substring(0, 6)+"31";;

		Map<String, Object> map = new HashMap<>();
		map.put("SEARCH_YMD", searchYmd);
		map.put("SEARCH_YMD_FROM", searchYmdFrom);
		map.put("SEARCH_YMD_TO", searchYmdTo);
		map.put("RESULTS", mobileApiMapper.getStatsForOneYearBySearchYmd(map));

		return map;
	}
}
