package com.at.apcss.am.whrs.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.invntr.service.RawMtrInvntrService;
import com.at.apcss.am.invntr.vo.RawMtrInvntrVO;
import com.at.apcss.am.whrs.mapper.RawMtrWrhsMapper;
import com.at.apcss.am.whrs.service.RawMtrWrhsService;
import com.at.apcss.am.whrs.vo.RawMtrWrhsVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : RawMtrWrhsServiceImpl.java
 * @Description : 원물입고 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("rawMtrWrhsService")
public class RawMtrWrhsServiceImpl extends BaseServiceImpl implements RawMtrWrhsService {

	@Autowired
	private RawMtrWrhsMapper rawMtrWrhsMapper;
	
	@Resource(name="cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;
	
	@Resource(name="rawMtrInvntrService")
	private RawMtrInvntrService rawMtrInvntrService;
	
	
	@Override
	public RawMtrWrhsVO selectRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RawMtrWrhsVO> selectRawMtrWrhsList(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {
		
		List<RawMtrWrhsVO> resultList = rawMtrWrhsMapper.selectRawMtrWrhsList(rawMtrWrhsVO);
		
		return resultList;
	}

	@Override
	public HashMap<String, Object> insertRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {

		String wrhsno = cmnsTaskNoService.selectWrhsno(rawMtrWrhsVO.getApcCd(), rawMtrWrhsVO.getWrhsYmd());
		rawMtrWrhsVO.setWrhsno(wrhsno);
		
		if (!StringUtils.hasText(rawMtrWrhsVO.getPltno())) {
			rawMtrWrhsVO.setPltno(wrhsno);
		}
		if (!StringUtils.hasText(rawMtrWrhsVO.getWghno())) {
			rawMtrWrhsVO.setWghno(wrhsno);
		}
		
		int insertedCnt = rawMtrWrhsMapper.insertRawMtrWrhs(rawMtrWrhsVO);
		
		if (insertedCnt != 0) {
			
		}
		
		RawMtrInvntrVO rawMtrInvntrVO = new RawMtrInvntrVO();
		BeanUtils.copyProperties(rawMtrWrhsVO, rawMtrInvntrVO);
		rawMtrInvntrVO.setInvntrQntt(rawMtrWrhsVO.getBxQntt());
		rawMtrInvntrVO.setInvntrWght(rawMtrWrhsVO.getWrhsWght());
		
		HashMap<String, Object> rtnObj = rawMtrInvntrService.insertRawMtrInvntr(rawMtrInvntrVO);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}
		
		return null;
	}

	@Override
	public HashMap<String, Object> insertRawMtrWrhsList(List<RawMtrWrhsVO> rawMtrWrhsList) throws Exception {

		List<RawMtrInvntrVO> rawMtrInvntrList = new ArrayList<>();
		
		int insertedCnt = 0;
		for ( RawMtrWrhsVO rawMtrWrhsVO : rawMtrWrhsList ) {
			
			String wrhsno = cmnsTaskNoService.selectWrhsno(rawMtrWrhsVO.getApcCd(), rawMtrWrhsVO.getWrhsYmd());
			rawMtrWrhsVO.setWrhsno(wrhsno);
			
			if (!StringUtils.hasText(rawMtrWrhsVO.getPltno())) {
				rawMtrWrhsVO.setPltno(wrhsno);
			}
			if (!StringUtils.hasText(rawMtrWrhsVO.getWghno())) {
				rawMtrWrhsVO.setWghno(wrhsno);
			}
			
			insertedCnt = rawMtrWrhsMapper.insertRawMtrWrhs(rawMtrWrhsVO);
			
			if (insertedCnt != 0) {
				
			}
			
			RawMtrInvntrVO rawMtrInvntrVO = new RawMtrInvntrVO();
			BeanUtils.copyProperties(rawMtrWrhsVO, rawMtrInvntrVO);
			rawMtrInvntrVO.setInvntrQntt(rawMtrWrhsVO.getBxQntt());
			rawMtrInvntrVO.setInvntrWght(rawMtrWrhsVO.getWrhsWght());
			rawMtrInvntrList.add(rawMtrInvntrVO);
		}
		
		// FIXME 입고번호로 재고 생성 추가
		HashMap<String, Object> rtnObj = rawMtrInvntrService.insertRawMtrInvntrList(rawMtrInvntrList);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}
		
		
		return null;
	}
	
	@Override
	public HashMap<String, Object> insertRawMtrWrhsByWghno(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {
		
		return null;
	}

	@Override
	public int updateRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteRawMtrWrhs(RawMtrWrhsVO rawMtrWrhsVO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}



}
