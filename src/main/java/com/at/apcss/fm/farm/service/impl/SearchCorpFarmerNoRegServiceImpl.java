package com.at.apcss.fm.farm.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.co.constants.ComConstants;
import com.at.apcss.fm.bbs.mapper.BbsMapper;
import com.at.apcss.fm.bbs.service.BbsService;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.mapper.SearchCorpFarmerNoRegMapper;
import com.at.apcss.fm.farm.service.SearchCorpFarmerNoRegService;
import com.at.apcss.fm.farm.vo.SearchCorpFarmerNoRegVO;


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
@Service("searchCorpFarmerNoRegService")
public class SearchCorpFarmerNoRegServiceImpl implements SearchCorpFarmerNoRegService{

	@Autowired
	private SearchCorpFarmerNoRegMapper searchCorpFarmerNoRegMapper;

	@Override
	public SearchCorpFarmerNoRegVO selectSearchCorpFarmerNoReg(SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO) throws Exception {

		SearchCorpFarmerNoRegVO resultVO = searchCorpFarmerNoRegMapper.selectSearchCorpFarmerNoReg(searchCorpFarmerNoRegVO);

		return resultVO;
	}

	@Override
	public List<SearchCorpFarmerNoRegVO> selectSearchCorpFarmerNoRegList(SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO) throws Exception {

		List<SearchCorpFarmerNoRegVO> resultList = searchCorpFarmerNoRegMapper.selectSearchCorpFarmerNoRegList(searchCorpFarmerNoRegVO);
		return resultList;
	}

	@Override
	public int insertSearchCorpFarmerNoReg(SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO) throws Exception {

		int insertedCnt = searchCorpFarmerNoRegMapper.insertSearchCorpFarmerNoReg(searchCorpFarmerNoRegVO);

		return insertedCnt;
	}

	@Override
	public int updateSearchCorpFarmerNoReg(SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO) throws Exception {

		int updatedCnt = searchCorpFarmerNoRegMapper.updateSearchCorpFarmerNoReg(searchCorpFarmerNoRegVO);

		return updatedCnt;
	}

	@Override
	public int multiSaveSearchCorpFarmerNoRegList(List<SearchCorpFarmerNoRegVO> searchCorpFarmerNoRegVOList) throws Exception {
		int savedCnt = 0;
		for (SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO : searchCorpFarmerNoRegVOList) {
			if(ComConstants.ROW_STS_INSERT.equals(searchCorpFarmerNoRegVO.getRowSts())) {
				savedCnt += insertSearchCorpFarmerNoReg(searchCorpFarmerNoRegVO);
			}
			if(ComConstants.ROW_STS_UPDATE.equals(searchCorpFarmerNoRegVO.getRowSts())) {
				savedCnt += updateSearchCorpFarmerNoReg(searchCorpFarmerNoRegVO);
			}
		}
		return savedCnt;
	}

	@Override
	public int deleteSearchCorpFarmerNoReg(SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO) throws Exception {
		return searchCorpFarmerNoRegMapper.deleteSearchCorpFarmerNoReg(searchCorpFarmerNoRegVO);
	}

}
