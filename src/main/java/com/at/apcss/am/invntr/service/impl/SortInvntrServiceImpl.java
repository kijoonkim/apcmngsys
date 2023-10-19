package com.at.apcss.am.invntr.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.at.apcss.am.invntr.mapper.SortInvntrMapper;
import com.at.apcss.am.invntr.service.SortInvntrService;
import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.invntr.vo.SortStdGrdVO;
import com.at.apcss.co.constants.ApcConstants;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.co.sys.util.ComUtil;

/**
 * @Class Name : SortInvntrServiceImpl.java
 * @Description : 선별재고관리 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("sortInvntrService")
public class SortInvntrServiceImpl extends BaseServiceImpl implements SortInvntrService {

	@Autowired
	private SortInvntrMapper sortInvntrMapper;

	@Override
	public SortInvntrVO selectSortInvntr(SortInvntrVO sortInvntrVO) throws Exception {

		SortInvntrVO resultVO = sortInvntrMapper.selectSortInvntr(sortInvntrVO);

		return resultVO;
	}

	@Override
	public List<SortInvntrVO> selectSortInvntrDsctnList(SortInvntrVO sortInvntrVO) throws Exception {

		List<SortInvntrVO> resultList = sortInvntrMapper.selectSortInvntrDsctnList(sortInvntrVO);

		return resultList;
	}

	@Override
	public List<SortInvntrVO> selectSortInvntrList(SortInvntrVO sortInvntrVO) throws Exception {

		List<SortInvntrVO> resultList = sortInvntrMapper.selectSortInvntrList(sortInvntrVO);

		return resultList;
	}

	@Override
	public HashMap<String, Object> insertSortInvntr(SortInvntrVO sortInvntrVO) throws Exception {

		sortInvntrMapper.insertSortInvntr(sortInvntrVO);

		List<SortStdGrdVO> stdGrdList = sortInvntrVO.getStdGrdList();
		for ( SortStdGrdVO stdGrd : stdGrdList ) {

			SortStdGrdVO sortStdGrdVO = new SortStdGrdVO();
			BeanUtils.copyProperties(sortInvntrVO, sortStdGrdVO);
			BeanUtils.copyProperties(stdGrd, sortStdGrdVO,
					ApcConstants.PROP_APC_CD,
					ApcConstants.PROP_SORTNO,
					ApcConstants.PROP_SORT_SN,
					ComConstants.PROP_SYS_FRST_INPT_DT,
					ComConstants.PROP_SYS_FRST_INPT_USER_ID,
					ComConstants.PROP_SYS_FRST_INPT_PRGRM_ID,
					ComConstants.PROP_SYS_LAST_CHG_DT,
					ComConstants.PROP_SYS_LAST_CHG_USER_ID,
					ComConstants.PROP_SYS_LAST_CHG_PRGRM_ID);
			logger.debug("sortSn : {}", sortStdGrdVO.getSortSn());
			sortInvntrMapper.insertSortStdGrd(sortStdGrdVO);
		}

		return null;
	}

	@Override
	public HashMap<String, Object> insertSortInvntrList(List<SortInvntrVO> sortInvntrList) throws Exception {

		for ( SortInvntrVO sortInvntrVO : sortInvntrList ) {
			HashMap<String, Object> rtnObj = insertSortInvntr(sortInvntrVO);
			if (rtnObj != null) {
				return rtnObj;
			}
		}

		return null;
	}

	@Override
	public HashMap<String, Object> updateSortInvntr(SortInvntrVO sortInvntrVO) throws Exception {

		sortInvntrMapper.updateSortInvntr(sortInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> deleteSortInvntr(SortInvntrVO sortInvntrVO) throws Exception {

		sortInvntrMapper.updateSortInvntrForDelY(sortInvntrVO);

		sortInvntrMapper.updateSortStdGrdForDelY(sortInvntrVO);

		return null;
	}

	@Override
	public HashMap<String, Object> updateInvntrPckgPrfmnc(SortInvntrVO sortInvntrVO) throws Exception {

		SortInvntrVO invntrInfo = sortInvntrMapper.selectSortInvntr(sortInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getSortno())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별재고");
		}

		if (sortInvntrVO.getPckgWght() > invntrInfo.getInvntrWght()) {
			return ComUtil.getResultMap("W0008", "재고량||포장량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() - sortInvntrVO.getInptQntt();
		double invntrWght = invntrInfo.getInvntrWght() - sortInvntrVO.getInptWght();
		sortInvntrVO.setInvntrQntt(invntrQntt);
		sortInvntrVO.setInvntrWght(invntrWght);

		// 포장량
		int pckgQntt = invntrInfo.getPckgQntt() + sortInvntrVO.getInptQntt();
		double pckgWght = invntrInfo.getPckgWght() + sortInvntrVO.getInptWght();
		sortInvntrVO.setPckgQntt(pckgQntt);
		sortInvntrVO.setPckgWght(pckgWght);

		int updatedCnt = sortInvntrMapper.updateInvntrPckgPrfmnc(sortInvntrVO);

		if (updatedCnt != 1) {

		}

		return null;
	}


	@Override
	public HashMap<String, Object> updateInvntrPckgPrfmncCncl(SortInvntrVO sortInvntrVO) throws Exception {

		SortInvntrVO invntrInfo = sortInvntrMapper.selectSortInvntr(sortInvntrVO);

		if (invntrInfo == null || !StringUtils.hasText(invntrInfo.getSortno())) {
			return ComUtil.getResultMap(ComConstants.MSGCD_NOT_FOUND, "선별재고");
		}

		if (sortInvntrVO.getInptQntt() > invntrInfo.getPckgQntt()) {
			return ComUtil.getResultMap(ComConstants.MSGCD_GREATER_THAN, "취소량||포장량");		// W0008	{0} 보다 {1}이/가 큽니다.
		}

		// 재고량
		int invntrQntt = invntrInfo.getInvntrQntt() + sortInvntrVO.getInptQntt();
		double invntrWght = invntrInfo.getInvntrWght() + sortInvntrVO.getInptWght();
		sortInvntrVO.setInvntrQntt(invntrQntt);
		sortInvntrVO.setInvntrWght(invntrWght);

		// 포장량
		int pckgQntt = invntrInfo.getPckgQntt() - sortInvntrVO.getInptQntt();
		double pckgWght = invntrInfo.getPckgWght() - sortInvntrVO.getInptWght();
		sortInvntrVO.setPckgQntt(pckgQntt);
		sortInvntrVO.setPckgWght(pckgWght);

		int updatedCnt = sortInvntrMapper.updateInvntrPckgPrfmnc(sortInvntrVO);

		if (updatedCnt != 1) {

		}

		return null;
	}

	@Override
	public HashMap<String, Object> updateSortInvntrDsctnList(List<SortInvntrVO> sortInvntrList) throws Exception {
		List<SortInvntrVO> updateList = new ArrayList<>();

		for (SortInvntrVO sortInvntrVO : sortInvntrList) {
			SortInvntrVO vo = new SortInvntrVO();
			BeanUtils.copyProperties(sortInvntrVO, vo);

			if (ComConstants.ROW_STS_UPDATE.equals(sortInvntrVO.getRowSts())) {
				updateList.add(vo);
			}
		}

		for (SortInvntrVO sortInvntrVO : updateList) {
			sortInvntrMapper.updateSortInvntrDsctnList(sortInvntrVO);
		}

		return null;
	}

	@Override
	public List<SortInvntrVO> selectPckgCmndTrgetList(SortInvntrVO sortInvntrVO) throws Exception {

		List<SortInvntrVO> resultList = sortInvntrMapper.selectPckgCmndTrgetList(sortInvntrVO);

		return resultList;
	}


}
