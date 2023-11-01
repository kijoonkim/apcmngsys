package com.at.apcss.am.trnsf.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.invntr.service.SortInvntrService;
import com.at.apcss.am.invntr.vo.SortInvntrVO;
import com.at.apcss.am.trnsf.mapper.TrnsfSortInvntrMapper;
import com.at.apcss.am.trnsf.service.InvntrTrnsfService;
import com.at.apcss.am.trnsf.service.TrnsfSortInvntrService;
import com.at.apcss.am.trnsf.vo.InvntrTrnsfVO;
import com.at.apcss.am.trnsf.vo.TrnsfSortInvntrVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

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
@Service("trnsfSortInvntrService")
public class TrnsfSortInvntrServiceImpl extends BaseServiceImpl implements TrnsfSortInvntrService {

	@Autowired
	private TrnsfSortInvntrMapper trnsfSortInvntrMapper;

	@Resource(name = "sortInvntrService")
	private SortInvntrService sortInvntrService;

	@Resource(name = "invntrTrnsfService")
	private InvntrTrnsfService invntrTrnsfService;

	@Override
	public List<TrnsfSortInvntrVO> selectTrnsfSortInvntrDsctnList(TrnsfSortInvntrVO trnsfSortInvntrVO) throws Exception {

		List<TrnsfSortInvntrVO> resultList = trnsfSortInvntrMapper.selectTrnsfSortInvntrDsctnList(trnsfSortInvntrVO);

		return resultList;
	}


	@Override
	public HashMap<String, Object> insertTrnsfSortInvntrList(List<TrnsfSortInvntrVO> trnsfSortInvntrList) throws Exception {

		List<InvntrTrnsfVO> insertList = new ArrayList<>();
		List<SortInvntrVO> sortInvntrList = new ArrayList<>();
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		for (TrnsfSortInvntrVO trnsfSortInvntrVO : trnsfSortInvntrList) {
			InvntrTrnsfVO invntrTrnsf = new InvntrTrnsfVO();
			BeanUtils.copyProperties(trnsfSortInvntrVO, invntrTrnsf);
			// 이송등록 리스트
			insertList.add(invntrTrnsf);

		}

		resultMap = invntrTrnsfService.insertInvntrTrnsfList(insertList);

		if(resultMap != null) {
			throw new EgovBizException(getMessageForMap(resultMap));
		}

		return null;
	}

}
