package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.co.sys.service.impl.BaseServiceImpl;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.SearchFarmerNoLogMapper;
import com.at.apcss.fm.farm.service.SearchFarmerNoLogService;
import com.at.apcss.fm.farm.vo.SearchFarmerNoLogVO;


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
@Service("searchFarmerNoLogService")
public class SearchFarmerNoLogServiceImpl extends BaseServiceImpl implements SearchFarmerNoLogService{

	@Autowired
	private SearchFarmerNoLogMapper searchFarmerNoLogMapper;

	@Override
	public SearchFarmerNoLogVO selectSearchFarmerNoLog(SearchFarmerNoLogVO searchFarmerNoLogVO) throws Exception {

		SearchFarmerNoLogVO resultVO = searchFarmerNoLogMapper.selectSearchFarmerNoLog(searchFarmerNoLogVO);

		return resultVO;
	}

	@Override
	public List<SearchFarmerNoLogVO> selectSearchFarmerNoLogList(SearchFarmerNoLogVO searchFarmerNoLogVO) throws Exception {

		List<SearchFarmerNoLogVO> resultList = searchFarmerNoLogMapper.selectSearchFarmerNoLogList(searchFarmerNoLogVO);
		return resultList;
	}

	@Override
	public int insertSearchFarmerNoLog(SearchFarmerNoLogVO searchFarmerNoLogVO) throws Exception {

		int insertedCnt = searchFarmerNoLogMapper.insertSearchFarmerNoLog(searchFarmerNoLogVO);

		return insertedCnt;
	}

	@Override
	public int updateSearchFarmerNoLog(SearchFarmerNoLogVO searchFarmerNoLogVO) throws Exception {

		int updatedCnt = searchFarmerNoLogMapper.updateSearchFarmerNoLog(searchFarmerNoLogVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveSearchFarmerNoLogList(List<SearchFarmerNoLogVO> searchFarmerNoLogVOList) throws Exception {
		int savedCnt = 0;
		for (SearchFarmerNoLogVO searchFarmerNoLogVO : searchFarmerNoLogVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(searchFarmerNoLogVO.getRowSts())) {
				savedCnt += insertSearchFarmerNoLog(searchFarmerNoLogVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(searchFarmerNoLogVO.getRowSts())) {
				savedCnt += updateSearchFarmerNoLog(searchFarmerNoLogVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerSearchFarmerNoLog(SearchFarmerNoLogVO searchFarmerNoLogVO) throws Exception {
		return searchFarmerNoLogMapper.insertMegerSearchFarmerNoLog(searchFarmerNoLogVO);
	}
	@Override
	public int insertMegerLogSearchFarmerNoLog(SearchFarmerNoLogVO searchFarmerNoLogVO) throws Exception {
		return searchFarmerNoLogMapper.insertMegerLogSearchFarmerNoLog(searchFarmerNoLogVO);
	}
	@Override
	public int updateMegerSearchFarmerNoLog(SearchFarmerNoLogVO searchFarmerNoLogVO) throws Exception {
		return searchFarmerNoLogMapper.updateMegerSearchFarmerNoLog(searchFarmerNoLogVO);
	}

	@Override
	public int deleteSearchFarmerNoLog(SearchFarmerNoLogVO searchFarmerNoLogVO) throws Exception {
		return searchFarmerNoLogMapper.deleteSearchFarmerNoLog(searchFarmerNoLogVO);
	}

}
