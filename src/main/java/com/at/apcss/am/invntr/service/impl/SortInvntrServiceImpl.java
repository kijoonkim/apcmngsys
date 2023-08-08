package com.at.apcss.am.invntr.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.am.invntr.mapper.SortInvntrMapper;
import com.at.apcss.am.invntr.service.SortInvntrService;
import com.at.apcss.am.invntr.vo.SortInvntrVO;
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
	public List<SortInvntrVO> selectSortInvntrList(SortInvntrVO sortInvntrVO) throws Exception {
		
		List<SortInvntrVO> resultList = sortInvntrMapper.selectSortInvntrList(sortInvntrVO);
		
		return resultList;
	}

	@Override
	public HashMap<String, Object> insertSortInvntr(SortInvntrVO sortInvntrVO) throws Exception {

		int insertedCnt = sortInvntrMapper.insertSortInvntr(sortInvntrVO);
		
		return null;
	}

	@Override
	public HashMap<String, Object> insertSortInvntrList(List<SortInvntrVO> sortInvntrList) throws Exception {
		
		int insertedCnt = 0;
		for ( SortInvntrVO sortInvntrVO : sortInvntrList ) {
			
			insertedCnt = sortInvntrMapper.insertSortInvntr(sortInvntrVO);
			
			if (insertedCnt != 0) {
				
			}
		}
		
		return null;
	}
	
	@Override
	public HashMap<String, Object> updateSortInvntr(SortInvntrVO sortInvntrVO) throws Exception {

		int updatedCnt = sortInvntrMapper.updateSortInvntr(sortInvntrVO);
		
		return null;
	}

	@Override
	public HashMap<String, Object> deleteSortInvntr(SortInvntrVO sortInvntrVO) throws Exception {

		int deletedCnt = sortInvntrMapper.deleteSortInvntr(sortInvntrVO);
		
		return null;
	}

}
