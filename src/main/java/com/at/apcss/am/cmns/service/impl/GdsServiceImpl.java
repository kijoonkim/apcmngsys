package com.at.apcss.am.cmns.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.GdsMapper;
import com.at.apcss.am.cmns.service.GdsService;
import com.at.apcss.am.cmns.vo.GdsVO;

/**
 * @Class Name : GdsServiceImpl.java
 * @Description : 상품정보관리 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 하민우
 * @since 2023.09.11
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.09.11  하민우        최초 생성
 * </pre>
 */
@Service("gdsService")
public class GdsServiceImpl implements GdsService {
	
	@Autowired
	private GdsMapper gdsMapper;
	
	@Override
	public List<GdsVO> selectGdsList(GdsVO gdsVO) throws Exception {
		
		List<GdsVO> resultList = gdsMapper.selectGdsList(gdsVO);
		
		return resultList;
	}

	@Override
	public int insertGds(GdsVO gdsVO) throws Exception {
		
		int insertedCnt = gdsMapper.insertGds(gdsVO);
		
		return insertedCnt;
	}

	@Override
	public int updateGds(GdsVO gdsVO) throws Exception {

		int updatedCnt = gdsMapper.updateGds(gdsVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteGds(GdsVO gdsVO) throws Exception {

		int deletedCnt = gdsMapper.deleteGds(gdsVO);
		
		return deletedCnt;
	}
}
