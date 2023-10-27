package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.SearchFarmerNoVO;


/**
 * 평가등록결과 Service 인터페이스
 * @author 김동제
 * @since 2023.10.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 수정일        수정자        수정내용
 * ----------  ----------  ---------------------------
 * 2023.10.01  김동제        최초 생성
 * </pre>
 */
public interface SearchFarmerNoService {

	/**
	 * 정보를 조회한다.
	 * @param searchFarmerNoVO
	 * @return
	 * @throws Exception
	 */
	public SearchFarmerNoVO selectSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO) throws Exception;

	public List<SearchFarmerNoVO> selectSearchFarmerNoList(SearchFarmerNoVO searchFarmerNoVO) throws Exception;

	public int insertSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO) throws Exception;

	public int updateSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO) throws Exception;

	public int multiSaveSearchFarmerNoList(List<SearchFarmerNoVO> searchFarmerNoVOList) throws Exception;

	public int insertMegerSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVOList) throws Exception;
	public int insertMegerLogSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVOList) throws Exception;

	public int insertMegerSearchFarmerNoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogSearchFarmerNoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVOList) throws Exception;

	public int deleteSearchFarmerNo(SearchFarmerNoVO searchFarmerNoVO) throws Exception;

}
