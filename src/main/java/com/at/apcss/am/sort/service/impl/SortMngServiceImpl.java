package com.at.apcss.am.sort.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.sort.service.SortCmndService;
import com.at.apcss.am.sort.service.SortInptPrfmncService;
import com.at.apcss.am.sort.service.SortMngService;
import com.at.apcss.am.sort.service.SortPrfmncService;
import com.at.apcss.am.sort.vo.SortInptPrfmncVO;
import com.at.apcss.am.sort.vo.SortMngVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : SortPrfmncServiceImpl.java
 * @Description : 선별실적 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("sortMngService")
public class SortMngServiceImpl extends BaseServiceImpl implements SortMngService {

	
	@Resource(name="cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;
	
	@Resource(name="sortCmndService")
	private SortCmndService sortCmndService;
	
	@Resource(name="sortInptPrfmncService")
	private SortInptPrfmncService sortInptPrfmncService;	
	
	@Resource(name="sortPrfmncService")
	private SortPrfmncService sortPrfmncService;

	
	@Override
	public HashMap<String, Object> insertSortCmnd(SortMngVO sortMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> insertSortInptPrfmnc(SortMngVO sortMngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();
		
		List<SortInptPrfmncVO> inptList = sortMngVO.getSortInptPrfmncList();

		// 선별투입실적 등록용 list
		List<SortInptPrfmncVO> sortInptPrfmncVOList = new ArrayList<>();
		
		// 선별실적 등록용 list
		List<SortPrfmncVO> sortPrfmncVOList = new ArrayList<>();
		
		for ( SortInptPrfmncVO inptInfo : inptList ) {
			
			SortInptPrfmncVO inptVO = new SortInptPrfmncVO();
			BeanUtils.copyProperties(sortMngVO, inptVO);
			BeanUtils.copyProperties(inptInfo, inptVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);
			
			// 투입실적 항목 set
			
			sortInptPrfmncVOList.add(inptVO);
			
			// 선별실적 vo
			SortPrfmncVO sortPrfmncVO = new SortPrfmncVO();
			BeanUtils.copyProperties(inptInfo, sortPrfmncVO);
			// 선별실적 항목 set
			sortPrfmncVOList.add(sortPrfmncVO);
		}
		
		rtnObj = sortInptPrfmncService.insertSortInptPrfmncList(sortInptPrfmncVOList);
		
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}
		
		// 실적 등록
		sortMngVO.setSortPrfmncList(sortPrfmncVOList);
		rtnObj = insertSortPrfmnc(sortMngVO);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}
		
		return null;
	}

	@Override
	public HashMap<String, Object> insertSortPrfmnc(SortMngVO sortMngVO) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();
		
		// 실적등록 대상정보 목록
		List<SortPrfmncVO> prfmncList = sortMngVO.getSortPrfmncList();
		
		// 선별실적 등록 시 투입실적도 함께 등록 (투입실적 여부 확인 후 등록)
		if (ComConstants.CON_YES.equals(sortMngVO.getNeedsInptRegYn())) {
			
			List<SortInptPrfmncVO> sortInptPrfmncVOList = new ArrayList<>();
			for ( SortPrfmncVO prfmncInfo : prfmncList ) {
				
				SortInptPrfmncVO inptVO = new SortInptPrfmncVO();
				BeanUtils.copyProperties(prfmncInfo, inptVO);
				BeanUtils.copyProperties(prfmncInfo, inptVO,
						ApcConstants.PROP_APC_CD,
						ComConstants.PROP_SYS_FRST_INPT_DT,
						ComConstants.PROP_SYS_FRST_INPT_USER_ID,
						ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
						ComConstants.PROP_SYS_LAST_CHG_DT,
						ComConstants.PROP_SYS_LAST_CHG_USER_ID,
						ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);
				
				// 투입실적 항목 set
				
				sortInptPrfmncVOList.add(inptVO);
			}
			
			rtnObj = sortInptPrfmncService.insertSortInptPrfmncList(sortInptPrfmncVOList);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}
		
		
		
		// 선별실적 등록
		List<SortPrfmncVO> sortPrfmncVOList = new ArrayList<>();		
		
		for ( SortPrfmncVO prfmncInfo : prfmncList ) {
			SortPrfmncVO prfmncVO = new SortPrfmncVO();
			BeanUtils.copyProperties(sortMngVO, prfmncVO);
			BeanUtils.copyProperties(prfmncInfo, prfmncVO,
					ApcConstants.PROP_APC_CD,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);
			
			sortPrfmncVOList.add(prfmncVO);
		}
		
		rtnObj = sortPrfmncService.insertSortPrfmncList(sortPrfmncVOList);
		if (rtnObj != null) {
			// error throw exception;
			throw new EgovBizException(getMessageForMap(rtnObj));
		}
		
		return null;
	}

	@Override
	public HashMap<String, Object> updateSortCmnd(SortMngVO sortMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> updateSortInptPrfmnc(SortMngVO sortMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> updateSortPrfmnc(SortMngVO sortMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> deleteSortCmnd(SortMngVO sortMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> deleteSortInptPrfmnc(SortMngVO sortMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> deleteSortPrfmnc(SortMngVO sortMngVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
