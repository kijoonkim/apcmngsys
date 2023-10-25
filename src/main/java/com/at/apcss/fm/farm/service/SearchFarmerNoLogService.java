package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.SearchFarmerNoLogVO;


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
public interface SearchFarmerNoLogService {

	/**
	 * 정보를 조회한다.
	 * @param searchFarmerNoLogVO
	 * @return
	 * @throws Exception
	 */
	public SearchFarmerNoLogVO selectSearchFarmerNoLog(SearchFarmerNoLogVO searchFarmerNoLogVO) throws Exception;

	public List<SearchFarmerNoLogVO> selectSearchFarmerNoLogList(SearchFarmerNoLogVO searchFarmerNoLogVO) throws Exception;

	public int insertSearchFarmerNoLog(SearchFarmerNoLogVO searchFarmerNoLogVO) throws Exception;

	public int updateSearchFarmerNoLog(SearchFarmerNoLogVO searchFarmerNoLogVO) throws Exception;

	public int multiSaveSearchFarmerNoLogList(List<SearchFarmerNoLogVO> searchFarmerNoLogVOList) throws Exception;
	public int insertMegerSearchFarmerNoLog(SearchFarmerNoLogVO searchFarmerNoLogVOList) throws Exception;
	public int insertMegerLogSearchFarmerNoLog(SearchFarmerNoLogVO searchFarmerNoLogVOList) throws Exception;
	public int updateMegerSearchFarmerNoLog(SearchFarmerNoLogVO searchFarmerNoLogVOList) throws Exception;

	public int deleteSearchFarmerNoLog(SearchFarmerNoLogVO searchFarmerNoLogVO) throws Exception;

}
