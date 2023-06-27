package com.at.apcss.am.trnsf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.trnsf.mapper.InvntrTrnsfMapper;
import com.at.apcss.am.trnsf.service.InvntrTrnsfService;
import com.at.apcss.am.trnsf.vo.InvntrTrnsfVO;

/**
 * @Class Name : InvntrTrnsfServiceImpl.java
 * @Description : 재고이송 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("invntrTrnsfService")
public class InvntrTrnsfServiceImpl implements InvntrTrnsfService {

	@Autowired
	private InvntrTrnsfMapper invntrTrnsfMapper;
	
	@Override
	public InvntrTrnsfVO selectInvntrTrnsf(InvntrTrnsfVO invntrTrnsfVO) throws Exception {
		
		InvntrTrnsfVO resultVO = invntrTrnsfMapper.selectInvntrTrnsf(invntrTrnsfVO);
		
		return resultVO;
	}

	@Override
	public List<InvntrTrnsfVO> selectInvntrTrnsfList(InvntrTrnsfVO invntrTrnsfVO) throws Exception {
		
		List<InvntrTrnsfVO> resultList = invntrTrnsfMapper.selectInvntrTrnsfList(invntrTrnsfVO);
		
		return resultList;
	}

	@Override
	public int insertInvntrTrnsf(InvntrTrnsfVO invntrTrnsfVO) throws Exception {
		
		int insertedCnt = invntrTrnsfMapper.insertInvntrTrnsf(invntrTrnsfVO);
		
		return insertedCnt;
	}

	@Override
	public int updateInvntrTrnsf(InvntrTrnsfVO invntrTrnsfVO) throws Exception {
		
		int updatedCnt = invntrTrnsfMapper.updateInvntrTrnsf(invntrTrnsfVO);
		
		return updatedCnt;
	}

	@Override
	public int deleteInvntrTrnsf(InvntrTrnsfVO invntrTrnsfVO) throws Exception {
		
		int deletedCnt = invntrTrnsfMapper.deleteInvntrTrnsf(invntrTrnsfVO);
		
		return deletedCnt ;
	}
}
