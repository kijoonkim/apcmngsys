package com.at.apcss.am.cmns.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.mapper.RawMtrWrhsGrdMapper;
import com.at.apcss.am.cmns.service.RawMtrWrhsGrdService;
import com.at.apcss.am.cmns.vo.RawMtrWrhsGrdVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : RawMtrWrhsGrdServiceImpl.java
 * @Description : 원물입고육안등급관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("rawMtrWrhsGrdService")
public class RawMtrWrhsGrdServiceImpl extends BaseServiceImpl implements RawMtrWrhsGrdService {
	
	@Autowired
	private RawMtrWrhsGrdMapper rawMtrWrhsGrdMapper;
	
	@Override
	public RawMtrWrhsGrdVO selectRawMtrWrhsGrd(RawMtrWrhsGrdVO rawMtrWrhsGrdVO) throws Exception {

		RawMtrWrhsGrdVO resultVO = rawMtrWrhsGrdMapper.selectRawMtrWrhsGrd(rawMtrWrhsGrdVO);
		
		return resultVO;
	}

	@Override
	public List<RawMtrWrhsGrdVO> selectRawMtrWrhsGrdList(RawMtrWrhsGrdVO rawMtrWrhsGrdVO) throws Exception {

		List<RawMtrWrhsGrdVO> resultList = rawMtrWrhsGrdMapper.selectRawMtrWrhsGrdList(rawMtrWrhsGrdVO);
		
		return resultList;
	}

	@Override
	public int insertRawMtrWrhsGrd(RawMtrWrhsGrdVO rawMtrWrhsGrdVO) throws Exception {

		int insertedCnt = rawMtrWrhsGrdMapper.insertRawMtrWrhsGrd(rawMtrWrhsGrdVO);
		
		return insertedCnt;
	}

	@Override
	public int updateRawMtrWrhsGrd(RawMtrWrhsGrdVO rawMtrWrhsGrdVO) throws Exception {

		int updatedCnt = rawMtrWrhsGrdMapper.updateRawMtrWrhsGrd(rawMtrWrhsGrdVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteRawMtrWrhsGrd(RawMtrWrhsGrdVO rawMtrWrhsGrdVO) throws Exception {

		int deletedCnt = rawMtrWrhsGrdMapper.deleteRawMtrWrhsGrd(rawMtrWrhsGrdVO);
		
		return deletedCnt;
	}

}
