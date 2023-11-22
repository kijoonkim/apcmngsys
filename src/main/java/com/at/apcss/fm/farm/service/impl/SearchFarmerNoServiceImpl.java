package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.SearchFarmerNoMapper;
import com.at.apcss.fm.farm.service.SearchFarmerNoService;
import com.at.apcss.fm.farm.vo.SearchFarmerNoVO;


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
@Service("searchFarmerNoService")
public class SearchFarmerNoServiceImpl extends BaseServiceImpl implements SearchFarmerNoService{

	@Autowired
	private SearchFarmerNoMapper searchFarmerNoMapper;

	@Override
	public SearchFarmerNoVO selectSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO) throws Exception {

		SearchFarmerNoVO resultVO = searchFarmerNoMapper.selectSearchFarmerNo(searchFarmerNoVO);

		return resultVO;
	}

	@Override
	public List<SearchFarmerNoVO> selectSearchFarmerNoList(SearchFarmerNoVO searchFarmerNoVO) throws Exception {

		List<SearchFarmerNoVO> resultList = searchFarmerNoMapper.selectSearchFarmerNoList(searchFarmerNoVO);
		return resultList;
	}

	@Override
	public int insertSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO) throws Exception {

		int insertedCnt = searchFarmerNoMapper.insertSearchFarmerNo(searchFarmerNoVO);

		return insertedCnt;
	}

	@Override
	public int updateSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO) throws Exception {

		int updatedCnt = searchFarmerNoMapper.updateSearchFarmerNo(searchFarmerNoVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveSearchFarmerNoList(List<SearchFarmerNoVO> searchFarmerNoVOList) throws Exception {
		int savedCnt = 0;
		for (SearchFarmerNoVO searchFarmerNoVO : searchFarmerNoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(searchFarmerNoVO.getRowSts())) {
				savedCnt += insertSearchFarmerNo(searchFarmerNoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(searchFarmerNoVO.getRowSts())) {
				savedCnt += updateSearchFarmerNo(searchFarmerNoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO) throws Exception {
		return searchFarmerNoMapper.insertMegerSearchFarmerNo(searchFarmerNoVO);
	}
	@Override
	public int insertMegerLogSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO) throws Exception {
		return searchFarmerNoMapper.insertMegerLogSearchFarmerNo(searchFarmerNoVO);
	}


	@Override
	public int insertMegerSearchFarmerNoMap(Map<String, String> MapList) throws Exception {
		return searchFarmerNoMapper.insertMegerSearchFarmerNoMap(MapList);
	}
	@Override
	public int insertMegerLogSearchFarmerNoMap(Map<String, String> MapList) throws Exception {
		return searchFarmerNoMapper.insertMegerLogSearchFarmerNoMap(MapList);
	}

	@Override
	public int updateMegerSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO) throws Exception {
		return searchFarmerNoMapper.updateMegerSearchFarmerNo(searchFarmerNoVO);
	}

	@Override
	public int deleteSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO) throws Exception {
		return searchFarmerNoMapper.deleteSearchFarmerNo(searchFarmerNoVO);
	}

}
