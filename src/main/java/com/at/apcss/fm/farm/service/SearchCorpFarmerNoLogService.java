package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.SearchCorpFarmerNoLogVO;


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
public interface SearchCorpFarmerNoLogService {

	/**
	 * 정보를 조회한다.
	 * @param searchCorpFarmerNoLogVO
	 * @return
	 * @throws Exception
	 */
	public SearchCorpFarmerNoLogVO selectSearchCorpFarmerNoLog(SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVO) throws Exception;

	public List<SearchCorpFarmerNoLogVO> selectSearchCorpFarmerNoLogList(SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVO) throws Exception;

	public int insertSearchCorpFarmerNoLog(SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVO) throws Exception;

	public int updateSearchCorpFarmerNoLog(SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVO) throws Exception;

	public int multiSaveSearchCorpFarmerNoLogList(List<SearchCorpFarmerNoLogVO> searchCorpFarmerNoLogVOList) throws Exception;
	public int insertMegerSearchCorpFarmerNoLog(SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVOList) throws Exception;
	public int insertMegerLogSearchCorpFarmerNoLog(SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVOList) throws Exception;
	public int updateMegerSearchCorpFarmerNoLog(SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVOList) throws Exception;

	public int deleteSearchCorpFarmerNoLog(SearchCorpFarmerNoLogVO searchCorpFarmerNoLogVO) throws Exception;

}
