package com.at.apcss.am.sort.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.cmns.service.CmnsTaskNoService;
import com.at.apcss.am.sort.mapper.SortCmndMapper;
import com.at.apcss.am.sort.service.SortCmndService;
import com.at.apcss.am.sort.vo.SortCmndVO;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;

/**
 * @Class Name : SortCmndServiceImpl.java
 * @Description : 선별지시 서비스를 정의하기 위한 서비스 구현 클래스
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
@Service("sortCmndService")
public class SortCmndServiceImpl extends BaseServiceImpl implements SortCmndService {

	@Autowired
	private SortCmndMapper sortCmndMapper;

	@Resource(name= "cmnsTaskNoService")
	private CmnsTaskNoService cmnsTaskNoService;

	@Override
	public SortCmndVO selectSortCmnd(SortCmndVO sortCmndVO) throws Exception {

		SortCmndVO resultVO = sortCmndMapper.selectSortCmnd(sortCmndVO);

		return resultVO;
	}

	@Override
	public List<SortCmndVO> selectSortCmndList(SortCmndVO sortCmndVO) throws Exception {

		List<SortCmndVO> resultList = sortCmndMapper.selectSortCmndList(sortCmndVO);

		return resultList;
	}

	@Override
	public int insertSortCmnd(SortCmndVO sortCmndVO) throws Exception {

		int insertedCnt = sortCmndMapper.insertSortCmnd(sortCmndVO);

		return insertedCnt;
	}

	@Override
	public int updateSortCmnd(SortCmndVO sortCmndVO) throws Exception {

		int updatedCnt = sortCmndMapper.updateSortCmnd(sortCmndVO);

		return updatedCnt;
	}

	@Override
	public int deleteSortCmnd(SortCmndVO sortCmndVO) throws Exception {

		int deletedCnt = sortCmndMapper.deleteSortCmnd(sortCmndVO);

		return deletedCnt;
	}

	@Override
	public int insertSortCmndList(List<SortCmndVO> sortCmndList) throws Exception {

		int insertedCnt = 0;
		String sortCmndno = cmnsTaskNoService.selectSortCmndno(sortCmndList.get(0).getApcCd(), sortCmndList.get(0).getSortCmndYmd());
		int sn=1;
		for (SortCmndVO sortCmndVO : sortCmndList) {
			sortCmndVO.setSortCmndSn(sn);
			sortCmndVO.setSortCmndno(sortCmndno);
			insertedCnt += insertSortCmnd(sortCmndVO);
			sn++;
		}
		return insertedCnt;
	}

	@Override
	public int deleteSortCmndList(List<SortCmndVO> sortCmndList) throws Exception {
		int deletedCnt = 0;
		for (SortCmndVO sortCmndVO : sortCmndList) {
			deletedCnt = deleteSortCmnd(sortCmndVO);
		}
		return deletedCnt;
	}
}
