package com.at.apcss.fm.farm.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.at.apcss.fm.farm.vo.SearchCorpFarmerNoRegVO;

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
public interface SearchCorpFarmerNoRegMapper {


	/**
	 * 메시지정보를 조회한다.
	 * @param bbsVO
	 * @return
	 */
	public SearchCorpFarmerNoRegVO selectSearchCorpFarmerNoReg(SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO);

	public List<SearchCorpFarmerNoRegVO> selectSearchCorpFarmerNoRegList(SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO);

	public int insertSearchCorpFarmerNoReg(SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO);

	public int updateSearchCorpFarmerNoReg(SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO);

	public int deleteSearchCorpFarmerNoReg(SearchCorpFarmerNoRegVO searchCorpFarmerNoRegVO) throws Exception;
}
