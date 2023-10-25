package com.at.apcss.fm.farm.service;

import java.util.List;
import java.util.Map;

import com.at.apcss.co.cd.vo.ComCdVO;
import com.at.apcss.fm.bbs.vo.BbsVO;
import com.at.apcss.fm.farm.vo.SearchCorpFarmerNoVO;


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
public interface SearchCorpFarmerNoService {

	/**
	 * 정보를 조회한다.
	 * @param searchCorpFarmerNoVO
	 * @return
	 * @throws Exception
	 */
	public SearchCorpFarmerNoVO selectSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception;

	public List<SearchCorpFarmerNoVO> selectSearchCorpFarmerNoList(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception;

	public int insertSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception;

	public int updateSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception;

	public int multiSaveSearchCorpFarmerNoList(List<SearchCorpFarmerNoVO> searchCorpFarmerNoVOList) throws Exception;

	public int insertMegerSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVOList) throws Exception;
	public int insertMegerLogSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVOList) throws Exception;

	public int insertMegerSearchCorpFarmerNoMap(Map<String, String> MapList) throws Exception;
	public int insertMegerLogSearchCorpFarmerNoMap(Map<String, String> MapList) throws Exception;

	public int updateMegerSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVOList) throws Exception;

	public int deleteSearchCorpFarmerNo(SearchCorpFarmerNoVO searchCorpFarmerNoVO) throws Exception;

}
