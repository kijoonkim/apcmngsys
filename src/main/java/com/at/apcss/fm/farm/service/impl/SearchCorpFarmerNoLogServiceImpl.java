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
import com.at.apcss.fm.farm.mapper.SearchCorpFarmerNoLogMapper;
import com.at.apcss.fm.farm.service.SearchCorpFarmerNoLogService;
import com.at.apcss.fm.farm.vo.SearchCorpFarmerNoLogVO;


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
@Service("searchCorpFarmerNoLogService")
public class SearchCorpFarmerNoLogServiceImpl extends BaseServiceImpl implements SearchCorpFarmerNoLogService{

	@Autowired
	private SearchCorpFarmerNoLogMapper searchCorpFarmerNoLogMapper;

	@Override
	public SearchCorpFarmerNoLogVO selectSearchCorpFarmerNoLog(SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVO) throws Exception {

		SearchCorpFarmerNoLogVO resultVO = searchCorpFarmerNoLogMapper.selectSearchCorpFarmerNoLog(searchCorpFarmerNoLogVO);

		return resultVO;
	}

	@Override
	public List<SearchCorpFarmerNoLogVO> selectSearchCorpFarmerNoLogList(SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVO) throws Exception {

		List<SearchCorpFarmerNoLogVO> resultList = searchCorpFarmerNoLogMapper.selectSearchCorpFarmerNoLogList(searchCorpFarmerNoLogVO);
		return resultList;
	}

	@Override
	public int insertSearchCorpFarmerNoLog(SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVO) throws Exception {

		int insertedCnt = searchCorpFarmerNoLogMapper.insertSearchCorpFarmerNoLog(searchCorpFarmerNoLogVO);

		return insertedCnt;
	}

	@Override
	public int updateSearchCorpFarmerNoLog(SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVO) throws Exception {

		int updatedCnt = searchCorpFarmerNoLogMapper.updateSearchCorpFarmerNoLog(searchCorpFarmerNoLogVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveSearchCorpFarmerNoLogList(List<SearchCorpFarmerNoLogVO> searchCorpFarmerNoLogVOList) throws Exception {
		int savedCnt = 0;
		for (SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVO : searchCorpFarmerNoLogVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(searchCorpFarmerNoLogVO.getRowSts())) {
				savedCnt += insertSearchCorpFarmerNoLog(searchCorpFarmerNoLogVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(searchCorpFarmerNoLogVO.getRowSts())) {
				savedCnt += updateSearchCorpFarmerNoLog(searchCorpFarmerNoLogVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int insertMegerSearchCorpFarmerNoLog(SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVO) throws Exception {
		return searchCorpFarmerNoLogMapper.insertMegerSearchCorpFarmerNoLog(searchCorpFarmerNoLogVO);
	}
	@Override
	public int insertMegerLogSearchCorpFarmerNoLog(SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVO) throws Exception {
		return searchCorpFarmerNoLogMapper.insertMegerLogSearchCorpFarmerNoLog(searchCorpFarmerNoLogVO);
	}
	@Override
	public int updateMegerSearchCorpFarmerNoLog(SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVO) throws Exception {
		return searchCorpFarmerNoLogMapper.updateMegerSearchCorpFarmerNoLog(searchCorpFarmerNoLogVO);
	}

	@Override
	public int deleteSearchCorpFarmerNoLog(SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVO) throws Exception {
		return searchCorpFarmerNoLogMapper.deleteSearchCorpFarmerNoLog(searchCorpFarmerNoLogVO);
	}

}
