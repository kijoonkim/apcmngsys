package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.SearchCorpFarmerNoMapper;
import com.at.apcss.fm.farm.service.SearchCorpFarmerNoService;
import com.at.apcss.fm.farm.vo.SearchCorpFarmerNoVO;


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
@Service("searchCorpFarmerNoService")
public class SearchCorpFarmerNoServiceImpl implements SearchCorpFarmerNoService{

	@Autowired
	private SearchCorpFarmerNoMapper searchCorpFarmerNoMapper;

	@Override
	public SearchCorpFarmerNoVO selectSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception {

		SearchCorpFarmerNoVO resultVO = searchCorpFarmerNoMapper.selectSearchCorpFarmerNo(searchCorpFarmerNoVO);

		return resultVO;
	}

	@Override
	public List<SearchCorpFarmerNoVO> selectSearchCorpFarmerNoList(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception {

		List<SearchCorpFarmerNoVO> resultList = searchCorpFarmerNoMapper.selectSearchCorpFarmerNoList(searchCorpFarmerNoVO);
		return resultList;
	}

	@Override
	public int insertSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception {

		int insertedCnt = searchCorpFarmerNoMapper.insertSearchCorpFarmerNo(searchCorpFarmerNoVO);

		return insertedCnt;
	}

	@Override
	public int updateSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception {

		int updatedCnt = searchCorpFarmerNoMapper.updateSearchCorpFarmerNo(searchCorpFarmerNoVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveSearchCorpFarmerNoList(List<SearchCorpFarmerNoVO> searchCorpFarmerNoVOList) throws Exception {
		int savedCnt = 0;
		for (SearchCorpFarmerNoVO searchCorpFarmerNoVO : searchCorpFarmerNoVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(searchCorpFarmerNoVO.getRowSts())) {
				savedCnt += insertSearchCorpFarmerNo(searchCorpFarmerNoVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(searchCorpFarmerNoVO.getRowSts())) {
				savedCnt += updateSearchCorpFarmerNo(searchCorpFarmerNoVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception {
		return searchCorpFarmerNoMapper.insertMegerSearchCorpFarmerNo(searchCorpFarmerNoVO);
	}
	@Override
	public int insertMegerLogSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception {
		return searchCorpFarmerNoMapper.insertMegerLogSearchCorpFarmerNo(searchCorpFarmerNoVO);
	}


	@Override
	public int insertMegerSearchCorpFarmerNoMap(Map<String, String> MapList) throws Exception {
		return searchCorpFarmerNoMapper.insertMegerSearchCorpFarmerNoMap(MapList);
	}
	@Override
	public int insertMegerLogSearchCorpFarmerNoMap(Map<String, String> MapList) throws Exception {
		return searchCorpFarmerNoMapper.insertMegerLogSearchCorpFarmerNoMap(MapList);
	}

	@Override
	public int updateMegerSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception {
		return searchCorpFarmerNoMapper.updateMegerSearchCorpFarmerNo(searchCorpFarmerNoVO);
	}

	@Override
	public int deleteSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception {
		return searchCorpFarmerNoMapper.deleteSearchCorpFarmerNo(searchCorpFarmerNoVO);
	}

}
