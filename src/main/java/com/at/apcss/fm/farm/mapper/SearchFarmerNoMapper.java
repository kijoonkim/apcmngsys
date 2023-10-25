package com.at.apcss.fm.farm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.SearchFarmerNoVO;

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
public interface SearchFarmerNoMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public SearchFarmerNoVO selectSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO);

	public List<SearchFarmerNoVO> selectSearchFarmerNoList(SearchFarmerNoVO searchFarmerNoVO);

	public int insertSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO);

	public int updateSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO);

	public int insertMegerSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO) throws Exception;
	public int insertMegerLogSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO) throws Exception;

	public int insertMegerSearchFarmerNoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogSearchFarmerNoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO) throws Exception;

	public int deleteSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO) throws Exception;
}
