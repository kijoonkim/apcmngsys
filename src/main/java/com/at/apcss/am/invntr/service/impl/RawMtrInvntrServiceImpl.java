package com.at.apcss.am.invntr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.invntr.mapper.RawMtrInvntrMapper;
import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;

/**
 * @Class Name : RawMtrInvntrServiceImpl.java
 * @Description : 원물재고관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("rawMtrInvntrService")
public class RawMtrInvntrServiceImpl implements RawMtrInvntrService {

	@Autowired
	private RawMtrInvntrMapper rawMtrInvntrMapper;
	
	@Override
	public RawMtrInvntrVO selectRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		RawMtrInvntrVO resultVO = rawMtrInvntrMapper.selectRawMtrInvntr(rawMtrInvntrVO);
		
		return resultVO;
	}

	@Override
	public List<RawMtrInvntrVO> selectRawMtrInvntrList(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		List<RawMtrInvntrVO> resultList = rawMtrInvntrMapper.selectRawMtrInvntrList(rawMtrInvntrVO);
		
		return resultList;
	}

	@Override
	public int insertRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		int insertedCnt = rawMtrInvntrMapper.insertRawMtrInvntr(rawMtrInvntrVO);
		
		return insertedCnt;
	}

	@Override
	public int updateRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		int updatedCnt = rawMtrInvntrMapper.updateRawMtrInvntr(rawMtrInvntrVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteRawMtrInvntr(RawMtrInvntrVO rawMtrInvntrVO) throws Exception {

		int deletedCnt = rawMtrInvntrMapper.deleteRawMtrInvntr(rawMtrInvntrVO);
		
		return deletedCnt;
	}

}
