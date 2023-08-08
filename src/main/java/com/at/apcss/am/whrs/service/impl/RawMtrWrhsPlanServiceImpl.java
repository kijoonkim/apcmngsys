package com.at.apcss.am.whrs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.whrs.mapper.RawMtrWrhsPlanMapper;
import com.at.apcss.am.whrs.service.RawMtrWrhsPlanService;
import com.at.apcss.am.whrs.vo.RawMtrWrhsPlanVO;
/**
 * @Class Name : RawMtrWrhsPlanServiceImpl.java
 * @Description : 원물입고계획등록 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 김호
 * @since 2023.08.08
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.08.08     김호        최초 생성
 * </pre>
 */
@Service("rawMtrWrhsPlanService")
public class RawMtrWrhsPlanServiceImpl implements RawMtrWrhsPlanService{

	@Autowired
	private RawMtrWrhsPlanMapper rawMtrWrhsPlanMapper;

	@Override
	public RawMtrWrhsPlanVO selectRawMtrWrhsPlan(RawMtrWrhsPlanVO rawMtrWrhsPlanVO) throws Exception {
		return rawMtrWrhsPlanMapper.selectRawMtrWrhsPlan(rawMtrWrhsPlanVO);
	}

	@Override
	public List<RawMtrWrhsPlanVO> selectRawMtrWrhsPlanList(RawMtrWrhsPlanVO rawMtrWrhsPlanVO) throws Exception {
		return rawMtrWrhsPlanMapper.selectRawMtrWrhsPlanList(rawMtrWrhsPlanVO);
	}

	@Override
	public int insertRawMtrWrhsPlan(RawMtrWrhsPlanVO rawMtrWrhsPlanVO) throws Exception {
		return rawMtrWrhsPlanMapper.insertRawMtrWrhsPlan(rawMtrWrhsPlanVO);
	}

	@Override
	public int updateRawMtrWrhsPlan(RawMtrWrhsPlanVO rawMtrWrhsPlanVO) throws Exception {
		return rawMtrWrhsPlanMapper.updateRawMtrWrhsPlan(rawMtrWrhsPlanVO);
	}

	@Override
	public int deleteRawMtrWrhsPlan(RawMtrWrhsPlanVO rawMtrWrhsPlanVO) throws Exception {
		return rawMtrWrhsPlanMapper.deleteRawMtrWrhsPlan(rawMtrWrhsPlanVO);
	}

}
