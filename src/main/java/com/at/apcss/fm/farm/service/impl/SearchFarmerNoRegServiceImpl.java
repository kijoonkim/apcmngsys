package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.SearchFarmerNoRegMapper;
import com.at.apcss.fm.farm.service.SearchFarmerNoRegService;
import com.at.apcss.fm.farm.vo.SearchFarmerNoRegVO;


/**
 * @Class Name : BbsServiceImpl.java
 * @Description : 게시판 서비스를 정의하기 위한 서비스 구현 클래스
 * @author 정연두
 * @since 2023.06.21
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.06.21  정연두        최초 생성
 * </pre>
 */
@Service("searchFarmerNoRegService")
public class SearchFarmerNoRegServiceImpl implements SearchFarmerNoRegService{

	@Autowired
	private SearchFarmerNoRegMapper searchFarmerNoRegMapper;

	@Override
	public SearchFarmerNoRegVO selectSearchFarmerNoReg(SearchFarmerNoRegVO searchFarmerNoRegVO) throws Exception {

		SearchFarmerNoRegVO resultVO = searchFarmerNoRegMapper.selectSearchFarmerNoReg(searchFarmerNoRegVO);

		return resultVO;
	}

	@Override
	public List<SearchFarmerNoRegVO> selectSearchFarmerNoRegList(SearchFarmerNoRegVO searchFarmerNoRegVO) throws Exception {

		List<SearchFarmerNoRegVO> resultList = searchFarmerNoRegMapper.selectSearchFarmerNoRegList(searchFarmerNoRegVO);
		return resultList;
	}

	@Override
	public int insertSearchFarmerNoReg(SearchFarmerNoRegVO searchFarmerNoRegVO) throws Exception {

		int insertedCnt = searchFarmerNoRegMapper.insertSearchFarmerNoReg(searchFarmerNoRegVO);

		return insertedCnt;
	}

	@Override
	public int updateSearchFarmerNoReg(SearchFarmerNoRegVO searchFarmerNoRegVO) throws Exception {

		int updatedCnt = searchFarmerNoRegMapper.updateSearchFarmerNoReg(searchFarmerNoRegVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveSearchFarmerNoRegList(List<SearchFarmerNoRegVO> searchFarmerNoRegVOList) throws Exception {
		int savedCnt = 0;
		for (SearchFarmerNoRegVO searchFarmerNoRegVO : searchFarmerNoRegVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(searchFarmerNoRegVO.getRowSts())) {
				savedCnt += insertSearchFarmerNoReg(searchFarmerNoRegVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(searchFarmerNoRegVO.getRowSts())) {
				savedCnt += updateSearchFarmerNoReg(searchFarmerNoRegVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deleteSearchFarmerNoReg(SearchFarmerNoRegVO searchFarmerNoRegVO) throws Exception {
		return searchFarmerNoRegMapper.deleteSearchFarmerNoReg(searchFarmerNoRegVO);
	}

}
