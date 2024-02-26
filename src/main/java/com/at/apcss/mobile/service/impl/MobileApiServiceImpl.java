package com.at.apcss.mobile.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.wrhs.mapper.RawMtrWrhsMapper;
import com.at.apcss.am.wrhs.vo.RawMtrWrhsVO;
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
public class MobileApiServiceImpl implements MobileApiService{
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

}
