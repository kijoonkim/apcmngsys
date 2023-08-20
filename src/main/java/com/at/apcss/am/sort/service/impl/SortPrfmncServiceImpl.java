package com.at.apcss.am.sort.service.impl;

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
import com.at.apcss.am.invntr.service.SortInvntrService;
import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.sort.mapper.SortPrfmncMapper;
import com.at.apcss.am.sort.service.SortInptPrfmncService;
import com.at.apcss.am.sort.service.SortPrfmncService;
import com.at.apcss.am.sort.vo.SortInptPrfmncVO;
import com.at.apcss.am.sort.vo.SortPrfmncVO;
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
@Service("sortPrfmncService")
public class SortPrfmncServiceImpl extends BaseServiceImpl implements SortPrfmncService {

	@Autowired
	private SortPrfmncMapper sortPrfmncMapper;

	@Resource(name="cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Resource(name="sortInptPrfmncService")
	private SortInptPrfmncService sortInptPrfmncService;

	@Resource(name="sortInvntrService")
	private SortInvntrService sortInvntrService;

	@Override
	public SortPrfmncVO selectSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception {

		SortPrfmncVO resultVO = sortPrfmncMapper.selectSortPrfmnc(sortPrfmncVO);

		return resultVO;
	}

	@Override
	public List<SortPrfmncVO> selectSortPrfmncList(SortPrfmncVO sortPrfmncVO) throws Exception {

		List<SortPrfmncVO> resultList = sortPrfmncMapper.selectSortPrfmncList(sortPrfmncVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception {

		int insertedCnt = sortPrfmncMapper.insertSortPrfmnc(sortPrfmncVO);

		return null;
	}

	@Override
	public HashMap<String, Object> insertSortPrfmncList(List<SortPrfmncVO> sortPrfmncList) throws Exception {

		HashMap<String, Object> rtnObj = new HashMap<>();

		List<SortInvntrVO> sortInvntrList = new ArrayList<>();

		// 투입실적 등록용 list
		List<SortInptPrfmncVO> inptRegList = new ArrayList<>();

		// 투입실적 유무에 따라 선별번호 부여 or 선별투입실적 등록 처리

		int insertedCnt = 0;
		for ( SortPrfmncVO sortPrfmncVO : sortPrfmncList ) {

			String sortno = cmnsTaskNoService.selectSortno(sortPrfmncVO.getApcCd(), sortPrfmncVO.getInptYmd());
			sortPrfmncVO.setSortno(sortno);


			if (!StringUtils.hasText(sortPrfmncVO.getRprsPrdcrCd())) {
				sortPrfmncVO.setRprsPrdcrCd(sortPrfmncVO.getPrdcrCd());
			}

			insertedCnt = sortPrfmncMapper.insertSortPrfmnc(sortPrfmncVO);

			if (insertedCnt != 0) {

			}

			SortInvntrVO sortInvntrVO = new SortInvntrVO();
			BeanUtils.copyProperties(sortPrfmncVO, sortInvntrVO);
			sortInvntrVO.setSortQntt(sortPrfmncVO.getQntt());
			sortInvntrVO.setSortWght(sortPrfmncVO.getWght());
			sortInvntrVO.setInvntrQntt(sortPrfmncVO.getQntt());
			sortInvntrVO.setInvntrWght(sortPrfmncVO.getWght());

			sortInvntrList.add(sortInvntrVO);

			/*
			// 선별투입실적 확인
			SortInptPrfmncVO sortInptPrfmncVO = new SortInptPrfmncVO();
			BeanUtils.copyProperties(sortPrfmncVO, sortInptPrfmncVO);

			SortInptPrfmncVO inptInfo = sortInptPrfmncService.selectSortInptPrfmnc(sortInptPrfmncVO);
			if (inptInfo != null && StringUtils.hasText(inptInfo.getWrhsno())) {
				sortPrfmncVO.setNeedsInptChgYn(ComConstants.CON_YES);
			} else {

				// 투입실적 항목 set
				inptRegList.add(sortInptPrfmncVO);
			}
			*/
		}

		if (!inptRegList.isEmpty()) {
			rtnObj = sortInptPrfmncService.insertSortInptPrfmncList(inptRegList);
			if (rtnObj != null) {
				// error throw exception;
				throw new EgovBizException(getMessageForMap(rtnObj));
			}
		}

		// 선별투입실적 선별번호 update
		/*
		for ( SortPrfmncVO sortPrfmncVO : sortPrfmncList ) {
			if (ComConstants.CON_YES.equals(sortPrfmncVO.getNeedsInptChgYn())) {
				sortPrfmncMapper.updateInptSortno(sortPrfmncVO);
			}
		}
		*/

		// 선별재고 생성
		rtnObj = sortInvntrService.insertSortInvntrList(sortInvntrList);
		if (rtnObj != null) {
			throw new EgovBizException(getMessageForMap(rtnObj));
		}

		// 입고구분에 따라 재고 변경 추가

		return null;
	}


	@Override
	public HashMap<String, Object> updateSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception {

		int updatedCnt = sortPrfmncMapper.updateSortPrfmnc(sortPrfmncVO);

		return null;
	}

	@Override
	public HashMap<String, Object> deleteSortPrfmnc(SortPrfmncVO sortPrfmncVO) throws Exception {

		int deletedCnt = sortPrfmncMapper.deleteSortPrfmnc(sortPrfmncVO);

		return null;
	}



}
