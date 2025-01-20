package com.at.apcss.am.trnsf.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.trnsf.mapper.InvntrMngMapper;
import com.at.apcss.am.trnsf.service.InvntrMngService;
import com.at.apcss.am.trnsf.vo.InvntrMngVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

@Service("invntrMngService")
public class InvntrMngServiceImpl extends BaseServiceImpl implements InvntrMngService{
	
	@Autowired
	private InvntrMngMapper invntrMngMapper;

	@Override
	public List<InvntrMngVO> selectInvntrCrtr(InvntrMngVO invntrMngVO) throws Exception {
		return invntrMngMapper.selectInvntrCrtr(invntrMngVO);
	}

	@Override
	public int insertInvntrCrtr(List<InvntrMngVO> invntrCrtrList) throws Exception {
		int resultCnt = 0;
		for (InvntrMngVO vo : invntrCrtrList) {
			String status = vo.getGubun();
			if(status.equals("insert")){
				resultCnt += invntrMngMapper.insertInvntrCrtr(vo);
			}else if(status.equals("update")){
				resultCnt += invntrMngMapper.updateInvntrCrtr(vo);
			}
		}
		if(resultCnt <0 ) {
			throw new EgovBizException();
		}
		return resultCnt;
	}

	@Override
	public int deleteInvntrCrtr(InvntrMngVO invntrMngVO) throws Exception {
		int deleteCnt = 0;
			deleteCnt = invntrMngMapper.deleteInvntrCrtr(invntrMngVO);
		return deleteCnt;
	}

	@Override
	public List<InvntrMngVO> selectInvntrCrtrDtl(InvntrMngVO invntrMngVO) throws Exception {
		return invntrMngMapper.selectInvntrCrtrDtl(invntrMngVO);
	}

	@Override
	public int insertInvntrCrtrDtl(List<InvntrMngVO> invntrCrtrList) throws Exception {
		int resultCnt = 0;
		for(InvntrMngVO invntrMngVO : invntrCrtrList){
			String status = invntrMngVO.getGubun();
			if(status.equals("insert")){
				resultCnt = invntrMngMapper.insertInvntrCrtrDtl(invntrMngVO);
			}else if(status.equals("update")){
				resultCnt = invntrMngMapper.updateInvntrCrtrDtl(invntrMngVO);
			}
			if(resultCnt<0){
				throw new EgovBizException();
			}
		}
		return resultCnt;
	}

	@Override
	public int deleteInvntrCrtrDtl(InvntrMngVO invntrMngVO) throws Exception {
		int deleteCnt = 0;
			deleteCnt = invntrMngMapper.deleteInvntrCrtrDtl(invntrMngVO);
		return deleteCnt;
	}

}
