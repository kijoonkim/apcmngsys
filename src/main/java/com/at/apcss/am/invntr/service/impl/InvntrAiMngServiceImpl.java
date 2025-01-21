package com.at.apcss.am.invntr.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.invntr.mapper.InvntrAiMngMapper;
import com.at.apcss.am.invntr.mapper.InvntrGrdMngMapper;
import com.at.apcss.am.invntr.service.GdsInvntrService;
import com.at.apcss.am.invntr.service.InvntrAiMngService;

import com.at.apcss.am.invntr.service.InvntrService;
import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.service.SortInvntrService;
import com.at.apcss.am.invntr.vo.InvntrAiMngVO;
import com.at.apcss.am.invntr.vo.InvntrMngVO;
import com.at.apcss.am.invntr.vo.InvntrVO;
import com.at.apcss.am.sort.mapper.SortPrfmncMapper;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : InvntrAiMngServiceImpl.java
 * @Description : 실사기준관리 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 박승진
 * @since 2025.01.16
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2025.01.16  박승진        최초 생성
 * </pre>
 */
@Service("invntrAiMngService")
public class InvntrAiMngServiceImpl extends BaseServiceImpl implements InvntrAiMngService {


	@Autowired
	private InvntrAiMngMapper invntrAiMngMapper;

	@Override
	public List<InvntrAiMngVO> selectInvntrAiCrtr(InvntrAiMngVO invntrAiMngVO) throws Exception {

		List<InvntrAiMngVO> result = invntrAiMngMapper.selectInvntrAiCrtr(invntrAiMngVO);

		return result;
	}

	@Override
	public int deleteInvntrAiCrtr(InvntrAiMngVO invntrAiMngVO) throws Exception {

		invntrAiMngMapper.deleteInvntrAiCrtr(invntrAiMngVO);

		return 0;
	}



	@Override
	public int insertInvntrAiCrtr(List<InvntrAiMngVO> invntrAiMngVOList) throws Exception {

		int result = 0;
		invntrAiMngVOList.forEach(item->{
			String status = item.getGubun();
			if(status.equals("insert")) {
				invntrAiMngMapper.insertInvntrAiCrtr(item);
			}else if(status.equals("update")) {
				invntrAiMngMapper.updateInvntrAiCrtr(item);
			}
		});

		return result;
	}

	@Override
	public List<InvntrAiMngVO> selectInvntrAiPlan(InvntrAiMngVO invntrAiMngVO) throws Exception {

		List<InvntrAiMngVO> invntrAiMngList = invntrAiMngMapper.selectInvntrAiPlan(invntrAiMngVO);

		return invntrAiMngList;
	}

	@Override
	public int deleteInvntrAiPlan(InvntrAiMngVO invntrAiMngVO) throws Exception {
		invntrAiMngMapper.deleteInvntrAiPlan(invntrAiMngVO);
		return 0;
	}



	@Override
	public int insertInvntrAiPlan(InvntrAiMngVO invntrAiMngVO) throws Exception {
		int result = 0;
		String status = invntrAiMngVO.getGubun();
		if(status.equals("insert")) {
			invntrAiMngMapper.insertInvntrAiPlan(invntrAiMngVO);
		}else if(status.equals("update")) {
			invntrAiMngMapper.updateInvntrAiPlan(invntrAiMngVO);
		}
		return result;
	}

	@Override
	public List<InvntrAiMngVO> selectInvntrAiMng(InvntrAiMngVO invntrAiMngVO) {
		List<InvntrAiMngVO> invntrAiMngList = invntrAiMngMapper.selectInvntrAiMng(invntrAiMngVO);
		return invntrAiMngList;
	}

	@Override
	public int insertInvntrAiMng(InvntrAiMngVO invntrAiMngVO) {
		int result = 0;
		String status = invntrAiMngVO.getGubun();
		if(status.equals("insert")) {
			invntrAiMngMapper.insertInvntrAiMng(invntrAiMngVO);
		}else if(status.equals("update")) {
			invntrAiMngMapper.updateInvntrAiMng(invntrAiMngVO);
		}
		return result;
	}



	@Override
	public int deleteInvntrAiMng(InvntrAiMngVO invntrAiMngVO) {
		invntrAiMngMapper.deleteInvntrAiMng(invntrAiMngVO);
		return 0;
	}





}
