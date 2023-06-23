package com.at.apcss.am.cmns.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.WrhsVhclMapper;
import com.at.apcss.am.cmns.service.WrhsVhclService;
import com.at.apcss.am.cmns.vo.WrhsVhclVO;

/**
 * @Class Name : WrhsVhclServiceImpl.java
 * @Description : 입고차량정보관리 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 신정철
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  신정철        최초 생성
 * </pre>
 */
@Service("wrhsVhclService")
public class WrhsVhclServiceImpl implements WrhsVhclService {
	
	@Autowired
	private WrhsVhclMapper wrhsVhclMapper;
	
	@Override
	public WrhsVhclVO selectWrhsVhcl(WrhsVhclVO wrhsVhclVO) throws Exception {
		
		WrhsVhclVO resultVO = wrhsVhclMapper.selectWrhsVhcl(wrhsVhclVO);
		
		return resultVO;
	}

	@Override
	public List<WrhsVhclVO> selectWrhsVhclList(WrhsVhclVO wrhsVhclVO) throws Exception {

		List<WrhsVhclVO> resultList = wrhsVhclMapper.selectWrhsVhclList(wrhsVhclVO);
		
		return resultList;
	}

	@Override
	public int insertWrhsVhcl(WrhsVhclVO wrhsVhclVO) throws Exception {

		int insertedCnt = wrhsVhclMapper.insertWrhsVhcl(wrhsVhclVO);
		
		return insertedCnt;
	}

	@Override
	public int updateWrhsVhcl(WrhsVhclVO wrhsVhclVO) throws Exception {

		int updatedCnt = wrhsVhclMapper.updateWrhsVhcl(wrhsVhclVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteWrhsVhcl(WrhsVhclVO wrhsVhclVO) throws Exception {

		int deletedCnt = wrhsVhclMapper.deleteWrhsVhcl(wrhsVhclVO);
		
		return deletedCnt;
	}

}
