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
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

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

		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		for (TrnsfRawMtrInvntrVO trnsfRawMtrInvntrVO : trnsfRawMtrInvntrList) {
			InvntrTrnsfVO invntrTrnsf = new InvntrTrnsfVO();

			BeanUtils.copyProperties(trnsfRawMtrInvntrVO, invntrTrnsf);

			insertList.add(invntrTrnsf);

		}


		resultMap = invntrTrnsfService.insertInvntrTrnsfList(insertList);

		if(resultMap != null) {
			throw new EgovBizException(getMessageForMap(resultMap));
		}

		return resultMap;
	}

	@Override
	public List<TrnsfRawMtrInvntrVO> selectTrnsfCfmtnRawMtrInvntrList(TrnsfRawMtrInvntrVO trnsfrawMtrInvntrVO) throws Exception {
		List<TrnsfRawMtrInvntrVO> resultList = trnsfRawMtrInvntrMapper.selectTrnsfCfmtnRawMtrInvntrList(trnsfrawMtrInvntrVO);
		return resultList;
	}

	@Override
	public HashMap<String, Object> deleteTrnsfCfmtnRawMtrInvntrList(List<TrnsfRawMtrInvntrVO> trnsfRawMtrInvntrList) throws Exception {

		List<RawMtrInvntrVO> rawMtrInvntrList = new ArrayList<>();
		List<InvntrTrnsfVO> invntrTrnsfList = new ArrayList<>();

		for (TrnsfRawMtrInvntrVO trnsfRawMtrInvntrVO : trnsfRawMtrInvntrList) {

				RawMtrInvntrVO rawMtrInvntrVO = new RawMtrInvntrVO();
				InvntrTrnsfVO invntrTrnsfVO = new InvntrTrnsfVO();
				BeanUtils.copyProperties(trnsfRawMtrInvntrVO, rawMtrInvntrVO);
				BeanUtils.copyProperties(trnsfRawMtrInvntrVO, invntrTrnsfVO);

				rawMtrInvntrList.add(rawMtrInvntrVO);
				invntrTrnsfList.add(invntrTrnsfVO);
		}

		for (InvntrTrnsfVO invntrTrnsfVO : invntrTrnsfList) {
			int i = invntrTrnsfService.updateTrnsfInvntrCncl(invntrTrnsfVO);

			if(i == 0) {
				throw new EgovBizException(getMessageForMap(ComUtil.getResultMap(ComConstants.MSGCD_ERR_CUSTOM, "취소 중 오류가 발생 했습니다.")));		// E0000	{0}
			}
		}

		for (RawMtrInvntrVO rawMtrInvntrVO : rawMtrInvntrList) {
			HashMap<String, Object> rtnObj = rawMtrInvntrService.deleteRawMtrInvntr(rawMtrInvntrVO);
			if(rtnObj != null) {
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		return null;
	}
}
