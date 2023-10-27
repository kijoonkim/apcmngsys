package com.at.apcss.fm.farm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.SearchCorpFarmerNoVO;

/**
 * 게시판 Mapper 인터페이스
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
@Mapper
public interface SearchCorpFarmerNoMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public SearchCorpFarmerNoVO selectSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO);

	public List<SearchCorpFarmerNoVO> selectSearchCorpFarmerNoList(SearchCorpFarmerNoVO searchCorpFarmerNoVO);

	public int insertSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO);

	public int updateSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO);

	public int insertMegerSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception;
	public int insertMegerLogSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception;

	public int insertMegerSearchCorpFarmerNoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogSearchCorpFarmerNoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception;

	public int deleteSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception;
}
