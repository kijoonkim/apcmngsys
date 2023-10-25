package com.at.apcss.am.trnsf.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;

import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.am.trnsf.mapper.TrnsfRawMtrInvntrMapper;
import com.at.apcss.am.trnsf.service.InvntrTrnsfService;
import com.at.apcss.am.trnsf.service.TrnsfRawMtrInvntrService;
import com.at.apcss.am.trnsf.vo.InvntrTrnsfVO;
import com.at.apcss.am.trnsf.vo.TrnsfRawMtrInvntrVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

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
@Service("TrnsfRawMtrInvntrService")
public class TrnsfRawMtrInvntrServiceImpl extends BaseServiceImpl implements TrnsfRawMtrInvntrService {

	@Autowired
	private TrnsfRawMtrInvntrMapper trnsfRawMtrInvntrMapper;

	@Resource(name = "rawMtrInvntrService")
	private RawMtrInvntrService rawMtrInvntrService;

	@Resource(name = "invntrTrnsfService")
	private InvntrTrnsfService invntrTrnsfService;


	@Override
	public List<TrnsfRawMtrInvntrVO> selectTrnsfRawMtrInvntrList(TrnsfRawMtrInvntrVO trnsfRawMtrInvntrVO) throws Exception {

		List<TrnsfRawMtrInvntrVO> resultList = trnsfRawMtrInvntrMapper.selectTrnsfRawMtrInvntrList(trnsfRawMtrInvntrVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertTrnsfRawMtrInvntrList(List<TrnsfRawMtrInvntrVO> trnsfRawMtrInvntrList) throws Exception {

		List<InvntrTrnsfVO> insertList = new ArrayList<>();
		List<RawMtrInvntrVO> rawMtrInvntrList = new ArrayList<>();


		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		for (TrnsfRawMtrInvntrVO trnsfRawMtrInvntrVO : trnsfRawMtrInvntrList) {
			RawMtrInvntrVO rawMtrInvntr = new RawMtrInvntrVO();
			InvntrTrnsfVO invntrTrnsf = new InvntrTrnsfVO();
			BeanUtils.copyProperties(trnsfRawMtrInvntrVO, rawMtrInvntr);
			BeanUtils.copyProperties(trnsfRawMtrInvntrVO, invntrTrnsf);

			rawMtrInvntrList.add(rawMtrInvntr);

			insertList.add(invntrTrnsf);

		}


		resultMap = invntrTrnsfService.insertInvntrTrnsfList(insertList);

		if(resultMap != null) {
			throw new EgovBizException(getMessageForMap(resultMap));
		}

		resultMap = rawMtrInvntrService.updateRawMtrInvntrList(rawMtrInvntrList);

		if(resultMap != null) {
			throw new EgovBizException(getMessageForMap(resultMap));
		}

		return resultMap;
	}



}
